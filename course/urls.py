from django.urls import path

from . import views

urlpatterns = [
    # ex: /polls/
    path('home', views.course_list, name='course_list'),
    path('<str:course_instance_id>/exams', views.exams, name='exam_list'),
    path('qn/<int:ex_id>/', views.question_list, name='qn_list'),
    path('qn_adm_view/<int:ex_id>/<str:qn_num>', views.qn_adm_view, name='qn_adm_view'),
    path('exams/<int:ex_id>/qn/<str:qn_num>', views.prof_exam_admin, name='prof_exam_admin'),
    # ex: /polls/5/
    # path('<string:course_id>/', views.course_detail, name='course_detail'),
    # ex: /polls/5/results/
    # path('<int:question_id>/results/', views.results, name='results'),
    # # ex: /polls/5/vote/
    # path('<int:question_id>/vote/', views.vote, name='vote'),
]
