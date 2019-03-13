from django import forms
from django.forms import ModelForm

from polls.my_models import TablePsPrice1C


class StatusForm(ModelForm):
     class Meta:
         model = TablePsPrice1C
         fields = ['id_product', 'article_clean', 'brand_clean', 'description']

class SearchForm(forms.Form):

    str_search = forms.CharField(
        widget=forms.TextInput(
            attrs={
                'class': 'search-form',
                'style': 'width: 350px;',
                'placeholder': 'код/артикул/название'
            }),
        required = False,
        label = '',
        min_length = 3,
        max_length = 100
    )
    brand_search = forms.CharField(
        widget=forms.TextInput(
            attrs={
                'class': 'search-form',
                'style': 'width: 200px;',
                'placeholder': 'отбор по Бренду'
            }),
        required = False,
        label = '',
        min_length = 2,
        max_length = 100
    )

    # def clean_str_search(self):
    def clean(self):
        cleaned_data = super(SearchForm, self).clean()
        str_search = cleaned_data.get("str_search")
        brand_search = cleaned_data.get("brand_search")

        if str_search=='' and brand_search=='':
            raise forms.ValidationError("Хотя бы одно поле должно быть заполнено")