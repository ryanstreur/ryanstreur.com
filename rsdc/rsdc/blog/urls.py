from django.urls import include, path

from .views import PostDetail, PostList

app_name = "blog"

urlpatterns = [
    path("", PostList.as_view(), name="post_list"),
    path("<int:pk>", PostDetail.as_view(), name="post_detail"),
]
