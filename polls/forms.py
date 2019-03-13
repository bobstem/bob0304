from django import forms


class SearchForm(forms.Form):

    str_search = forms.CharField(
        widget=forms.TextInput(attrs={'placeholder': 'код/артикул/название'}),
        required = True,
        label = '',
        min_length = 3,
        max_length = 100
    )
    brand_search = forms.CharField(
        widget=forms.TextInput(attrs={'placeholder': 'отбор по Бренду'}),
        required = False,
        label = '',
        min_length = 2,
        max_length = 100
    )
