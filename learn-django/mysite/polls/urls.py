from django.urls import path
from . import views


urlpatterns = [
    # /
    # path("", views.index, name="index"),
    path("", views.IndexView.as_view(), name="index"),
    # /5/
    # path("<int:question_id>/", views.detail, name="detail"),
    # generic views need the query param to be named pk
    path("<int:pk>/", views.DetailView.as_view(), name="detail"),
    # /5/results/
    # path("<int:question_id>/results/", views.results, name="results"),
    path("<int:pk>/results/", views.ResultsView.as_view(), name="results"),
    # /5/vote
    path("<int:question_id>/vote/", views.vote, name="vote"),
]
