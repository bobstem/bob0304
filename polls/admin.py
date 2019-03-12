from django.contrib import admin

from polls.my_models import Album, Musician, Users
from .models import Question, Choice

class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 1

# class ChoiceInline(admin.StackedInline): # В столбец
#     model = Choice
#     extra = 0

class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Вопрос', {'fields': ['question_text']}),
        ('Date information', {'fields': ['pub_date'],
                              'classes': ['collapse']}),
    ]
    inlines = [ChoiceInline]

admin.site.register(Question, QuestionAdmin)

# admin.site.register(Question)
# admin.site.register(Choice)

class AlbumInline(admin.TabularInline):
    model = Album
    extra = 1


class MusicianAdmin(admin.ModelAdmin):
    search_fields = ['first_name', 'last_name',]
    list_filter = [ 'instrument']
    list_display = ('first_name', 'last_name', 'instrument')
    inlines = [AlbumInline]

admin.site.register(Musician, MusicianAdmin)


class AlbumAdmin(admin.ModelAdmin):
    date_hierarchy = 'release_date'
    search_fields = ['name']
    list_filter = [ 'num_stars']
    list_display = ('name', 'release_date', 'num_stars')

admin.site.register(Album, AlbumAdmin)


class UsersAdmin(admin.ModelAdmin):
    search_fields = ['login', 'user_name', 'user_code', 'email', 'activity']
    list_filter = [ 'activity', 'role']
    list_display = ('login', 'user_name', 'user_code', 'email', 'activity', 'role')

admin.site.register(Users, UsersAdmin)
