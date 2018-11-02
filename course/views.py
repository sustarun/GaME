from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from .models import *
from django.contrib.auth.models import User, Group
from django.contrib.auth import authenticate

def course_list(request):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	user = User.objects.get(id = user_id)
	groups = user.groups.all()
	instance_ids =[]
	for group in groups:
		print(group.name)
		if(str(group.name) == 'Instructor'):
			instance_ids.extend(Teaches.objects.values_list('instance_id', flat = True).filter(instructor_id = user_id))
		elif(group.name == 'Student'):
			# print("here")
			instance_ids.extend(Takes.objects.values_list('instance_id', flat = True).filter(student_id = user_id))
		elif(group.name == 'Assistant'):
			instance_ids.extend(Assists.objects.values_list('instance_id', flat = True).filter(assistant_id = user_id))
	print(instance_ids)
	# course_list = Instance.objects.select_related('course__course_title').filter(id__in = instance_ids)
	course_list = Instance.objects.filter(id__in = instance_ids)
	print(course_list)
	# all_courses = Course.objects.all()
	context = {'course_list': course_list}
	return render(request, 'course/course_list.html', context)

def exams(request, course_id):
	context = {'exam_list': ['quiz1','quiz2'], 'course_id': course_id}
	return render(request, 'course/exams.html', context)