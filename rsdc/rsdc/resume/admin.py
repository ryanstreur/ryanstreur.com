from django.contrib import admin

from .models import (
    Responsibility,
    Skill,
    Job,
)

@admin.register(Responsibility)
class ResponsibilityAdmin(admin.ModelAdmin):
    pass

@admin.register(Skill)
class SkillAdmin(admin.ModelAdmin):
    pass

@admin.register(Job)
class JobAdmin(admin.ModelAdmin):
    pass
