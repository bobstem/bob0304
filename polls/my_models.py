from django.db import models

class Musician(models.Model):
    first_name = models.CharField('Имя', max_length=50)
    last_name = models.CharField('Фамилия', max_length=50)
    instrument = models.CharField('На чем играем', max_length=100)
    def __str__(self):
        return self.last_name

class Album(models.Model):
    artist = models.ForeignKey(Musician, verbose_name="Выберите артиста", on_delete=models.CASCADE)
    name = models.CharField('Название альбома', max_length=100)
    release_date = models.DateField('Когда вышел')
    num_stars = models.IntegerField(default=0)

    def __str__(self):
        return self.name


class Users(models.Model):
    login = models.CharField(max_length=50)
    pwd = models.CharField(max_length=50, blank=True, null=True)
    role = models.CharField('Тип', max_length=10, blank=True, null=True)
    user_code = models.CharField('Код', max_length=30, blank=True, null=True)
    user_name = models.CharField('Имя', max_length=255, blank=True, null=True)
    email = models.CharField(max_length=150, blank=True, null=True)
    phone = models.CharField(max_length=100, blank=True, null=True)
    activity = models.CharField('Активность', max_length=1, blank=True, null=True)
    clients = models.CharField(max_length=1, blank=True, null=True)
    show_name_strg = models.CharField(max_length=1, blank=True, null=True)
    show_orig_price = models.CharField(max_length=1, blank=True, null=True)
    activate_hash = models.CharField(max_length=100, blank=True, null=True)
    columns = models.IntegerField(blank=True, null=True)
    hide_art = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'users'
    def __str__(self):
        return self.login

class TablePsPrice1C(models.Model):
    id = models.BigAutoField(primary_key=True)
    source = models.CharField(max_length=12)
    id_product = models.CharField(max_length=255)
    supplier = models.CharField(max_length=255)
    sort = models.IntegerField()
    time_update = models.DateTimeField()
    brand = models.CharField(max_length=255)
    brand_clean = models.CharField(max_length=255)
    article = models.CharField(max_length=255)
    article_clean = models.CharField(max_length=255)
    description = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    delivery_days = models.SmallIntegerField()
    belong = models.CharField(max_length=255)
    code_photo = models.CharField(max_length=255)
    comments = models.CharField(max_length=255)
    unit = models.CharField(max_length=255)
    weight = models.DecimalField(max_digits=8, decimal_places=3)
    quantity_pack = models.SmallIntegerField()
    control_quantity_pack = models.SmallIntegerField()
    terms_of_sale = models.CharField(max_length=255)
    search = models.TextField()
    cross_articles = models.TextField()
    analogues = models.TextField()
    full_description = models.TextField()
    categories = models.TextField()
    components = models.TextField()
    barcodes = models.TextField()
    suppliers_goods = models.TextField()
    goods_group = models.TextField()
    comments_additional = models.TextField()

    class Meta:
        managed = False
        db_table = 'table_ps_price_1c'
    def __str__(self):
        return self.article
