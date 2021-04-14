from django.contrib import admin
from django.db import models

from pagedown.widgets import AdminPagedownWidget

from .models import Post

@admin.register(Post)
class PostAdmin(admin.ModelAdmin):

    view_on_site = True
