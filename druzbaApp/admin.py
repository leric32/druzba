from django.contrib import admin

# Register your models here.

from .models import *

admin.site.register(Activity)
admin.site.register(Comment)
admin.site.register(Type)
admin.site.register(Users)
