from django.urls import path

from . import views

urlpatterns = [
    # ex: /polls/
    path('home', views.course_list, name='course_list'),
    path('<str:course_id>/exams', views.exams, name='exam_list'),
    # ex: /polls/5/
    # path('<string:course_id>/', views.course_detail, name='course_detail'),
    # ex: /polls/5/results/
    # path('<int:question_id>/results/', views.results, name='results'),
    # # ex: /polls/5/vote/
    # path('<int:question_id>/vote/', views.vote, name='vote'),
]