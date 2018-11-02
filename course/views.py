from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

from .models import *
# from .models import Course, Takes, Teaches, Assists, Instance
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
			print("here")
			instance_ids.extend(Takes.objects.values_list('instance_id', flat = True).filter(student_id = user_id))
		elif(group.name == 'Assistant'):
			instance_ids.extend(Assists.objects.values_list('instance_id', flat = True).filter(assistant_id = user_id))
	print(instance_ids)
	course_list = Instance.objects.filter(id__in = instance_ids)
	all_courses = Course.objects.all()
	context = {'course_list': course_list, 'all_courses': all_courses}
	return render(request, 'course/course_list.html', context)

def ta_qnlist(user_id, ex_id, instance_idd):
	return

def prof_qnlist(user_id, ex_id, instance_idd):
	return

def stud_qnlist(user_id, ex_id, instance_idd):
	return

def question_list(request, ex_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	# Find the designation:
		# get the exam object. use it to find the instance id #
		# scan the assists relation where instance id and user_id match
		# if exists, then TA
		# scan the teaches relation where instance id and user_id match
		# if exists, then prof
		# else: student (can verify the takes relation)
	# if prof/ta:
		# filter attempt object using exam_instance_id and ta_id
		# and show whatever you want
	# else:
		# filter attempt object using exam_instance_id and student_id
		# and show whatever you want
	instance_idd = Exam.objects.get(id=ex_id).values_list('instance_id', flat=True)
	isTA = Assists.objects.filter(instance_id=instance_idd, assistant_id=user_id).exists()
	if isTA:
		return ta_qnlist(user_id, ex_id, instance_idd)
	else:
		isProf = Teaches.objects.filter(instance_id=instance_idd, instructor_id=user_id).exists()
		if isProf:
			return prof_qnlist(user_id, ex_id, instance_idd)
		else:
			return stud_qnlist(user_id, ex_id, instance_idd)
