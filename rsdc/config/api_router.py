from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter

from rsdc.users.api.views import UserViewSet
from rsdc.resume.api.views import JobViewSet, SkillViewSet

if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()

router.register("users", UserViewSet)
router.register("jobs", JobViewSet)
router.register("skills", SkillViewSet)


app_name = "api"
urlpatterns = router.urls
