from django.conf.urls import url

from polls import my_views
from . import views

app_name = 'polls'
# urlpatterns = [
#     # ex: /polls/
#     url(r'^$', views.index, name='index'),
#     # ex: /polls/5/
#     url(r'^(?P<question_id>[0-9]+)/$', views.detail, name='detail'),
#     # ex: /polls/5/results/
#     url(r'^(?P<question_id>[0-9]+)/results/$', views.results, name='results'),
#     # ex: /polls/5/vote/
#     url(r'^(?P<question_id>[0-9]+)/vote/$', views.vote, name='vote'),
# ]

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^polls/$', views.PollsView.as_view(), name='polls'),
    url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),
    url(r'^(?P<pk>[0-9]+)/results/$', views.ResultsView.as_view(), name='results'),
    url(r'^(?P<question_id>[0-9]+)/vote/$', views.vote, name='vote'),

    url(r'^album/$', my_views.AlbumView.as_view(), name='album'),
    url(r'^musician/$', my_views.MusicianView.as_view(), name='musician'),

    # url(r'^search_all/$', my_views.Search_allView.as_view(), name='search_all'),
    url(r'^search_form/$', my_views.search_form, name='search_form'),
]
