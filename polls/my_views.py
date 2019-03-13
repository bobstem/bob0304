from django.db.models import Q
from django.forms import forms

from bob0304.lib_utils import only_letters_and_digits, str_to_int
from polls.my_forms import SearchForm
from polls.my_models import Album, Musician, TablePsPrice1C

from django.shortcuts import get_object_or_404, render
from django.template.context_processors import request
from django.views import generic

from polls.soap_req import WebService

# class AlbumView(generic.ListView):
#     model = Album.objects.filter(name__contains='соло')
#     template_name = 'polls/album.html'


class AlbumView(generic.ListView):
    template_name = 'polls/album.html'
    context_object_name = 'album_list'

    def get_queryset(self):
        """Return the last five published questions."""
        # return Musician.objects.order_by('-last_name')[:15]
        # return Musician.objects.all()
        # return Musician.objects.all().filter(first_name = 'Максим')
        # return Musician.objects.filter(first_name = 'олег')
        # return Album.objects.filter(name__icontains= 'соло')
        return Album.objects.all()


# class MusicianView(generic.ListView):
#     model = Musician
#     template_name = 'polls/musician.html'

class MusicianView(generic.ListView):
    template_name = 'polls/musician.html'
    context_object_name = 'musician_list'

    def get_queryset(self):
        """Return the last five published questions."""
        # return Musician.objects.order_by('-last_name')[:15]
        # return Musician.objects.all().filter(first_name = 'Максим')
        # return Musician.objects.filter(first_name = 'олег')
        # return Musician.objects.filter(last_name__icontains = 'ов') #exclude - исключение
        # return Musician.objects.filter(album__name__contains= 'соло')
        return Musician.objects.all()

# class Search_allView(generic.ListView):
#     template_name = 'polls/search_all.html'
#     context_object_name = 'search_all'
#
#     def get_queryset(self):
#         q = self.request.POST.get("q")
#         """Return the last five published questions."""
#         queryset = TablePsPrice1C.objects.all()[:50]
#         return queryset


def search_form(request):

    if request.method == 'POST':
        form = SearchForm(request.POST)

        # check whether it's valid:
        if form.is_valid():
            message = 'FORM IS VALID'
        else:
            message = 'FORM IS NOT VALID'
        search_list = TablePsPrice1C.objects.filter(
            Q(brand_clean__icontains=only_letters_and_digits(form.data['brand_search'])),
            Q(id_product__icontains=form.data['str_search']) |
            Q(article_clean__icontains=only_letters_and_digits(form.data['str_search'])) |
            Q(search__icontains=form.data['str_search']) |
            Q(analogues__icontains=form.data['str_search']) |
            Q(categories__icontains=form.data['str_search']) |
            Q(description__icontains=form.data['str_search'])
        ).order_by('brand_clean')[:2000]
    else:
        message = 'CREATE FORM'
        form = SearchForm()
        search_list = [] # TablePsPrice1C.objects.all()[:50]

    search_list_price = []
    min_price = 0
    max_price = 0
    total_number = 0
    if search_list:
        codes = ''
        for item in search_list:
            codes += item.id_product + ';'

        # storage = webService(codes)
        storage = WebService(WebService.PRODUCT_SEARCH).getStoragePrice(codes)
        # print(storage.TotalSearchResults.TotalNumber)
        # print(storage.TotalSearchResults)
        if storage:
            if 'TotalSearchResults' in storage:
                if 'ElSearchResults' in storage.TotalSearchResults:
                    min_price = storage.TotalSearchResults.MinPrice
                    max_price = storage.TotalSearchResults.MaxPrice
                    total_number = storage.TotalSearchResults.TotalNumber
                    for dbitem in search_list:
                        for item in storage.TotalSearchResults.ElSearchResults:
                            if dbitem.id_product == item.Code:
                                dbitem.price = item.Price
                                dbitem.balance = str_to_int(item.Balance)
                                # if item.Balance:
                                #     dbitem.balance = item.Balance
                                # else:
                                #     dbitem.balance = 0
                                search_list_price.append(dbitem)
                                break

    context = {
        'search_all': search_list_price,
        'min_price': min_price,
        'max_price': max_price,
        'total_number': total_number,
        'message': message,
        'form': form
        # 'prim': prim
    }
    return render(request, 'polls/search_all.html', context)

