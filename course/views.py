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
			print("here")
			instance_ids.extend(Takes.objects.values_list('instance_id', flat = True).filter(student_id = user_id))
		elif(group.name == 'Assistant'):
			instance_ids.extend(Assists.objects.values_list('instance_id', flat = True).filter(assistant_id = user_id))
	# print(instance_ids)
	# print(groups)
	course_list = Instance.objects.filter(id__in = instance_ids)
	print(course_list)
	print("hola")
	all_courses = Course.objects.all()
	context = {'course_list': course_list, 'all_courses': all_courses}
	return render(request, 'course/course_list.html', context)

def exams(request,course_instance_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	user = User.objects.get(id = user_id)
	stud_cid = []
	inst_cid = []
	ta_cid = []
	exams = Exam.objects.filter(instance_id = course_instance_id)
	inst_cid.extend(Teaches.objects.filter(instance_id = course_instance_id).filter(instructor_id = user_id))
	stud_cid.extend(Takes.objects.filter(instance_id = course_instance_id).filter(student_id = user_id))
	ta_cid.extend(Assists.objects.filter(instance_id = course_instance_id).filter(assistant_id = user_id))
	
	context = {'instructor':inst_cid, 'assistant':ta_cid, 'student':stud_cid, 'exams' : exams}

	return render(request, 'course/exam_list.html', context)
	print(instance_ids)
	# course_list = Instance.objects.select_related('course__course_title').filter(id__in = instance_ids)
	course_list = Instance.objects.filter(id__in = instance_ids)
	print(course_list)
	# all_courses = Course.objects.all()
	context = {'course_list': course_list}
	return render(request, 'course/course_list.html', context)

def ta_qnlist(request, user_id, ex_id):
	print("ex_id = ", ex_id, "user_id = ", user_id)
	attempts = Attempt.objects.filter(exam_id=ex_id, assistant_id=user_id)
	print(attempts)
	context = {'attempt_list': attempts}
	return render(request, 'course/qn_list.html', context)

def prof_qnlist(request, user_id, ex_id):
	attempts = Attempt.objects.filter(exam_id=ex_id, assistant_id=user_id)
	qns = Attempt.objects.values_list('qn_id', flat=True).filter(exam_id=ex_id).distinct()
	context = {'attempt_list':attempts, 'qn_list':qns, 'ex_id':ex_id}
	return render(request, 'course/qn_list.html', context)

def stud_qnlist(request, user_id, ex_id):
	print("ex_id = ", ex_id, "user_id = ", user_id)
	attempts = Attempt.objects.filter(exam_id=ex_id, student_id=user_id)
	print(attempts)
	context = {'attempt_list': attempts}
	return render(request, 'course/qn_list.html', context)

def question_list(request, ex_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	print("in ql: user_id = ", user_id)
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
	exam_graded = Exam.objects.values_list('exam_graded', flat=True).get(id=ex_id)
	print('exam_graded = ', exam_graded)
	if not exam_graded:
		return render(request, 'course/qn_list.html', {})
	instance_idd = Exam.objects.values_list('instance_id', flat=True).get(id=ex_id)
	isTA = Assists.objects.filter(instance_id=instance_idd, assistant_id=user_id).exists()
	if isTA:
		return ta_qnlist(request, user_id, ex_id)
	else:
		isProf = Teaches.objects.filter(instance_id=instance_idd, instructor_id=user_id).exists()
		if isProf:
			return prof_qnlist(request, user_id, ex_id)
		else:
			return stud_qnlist(request, user_id, ex_id)
# def exams(request, course_id):
# 	context = {'exam_list': ['quiz1','quiz2'], 'course_id': course_id}
# 	return render(request, 'course/exams.html', context)

def prof_exam_admin(request, ex_id, qn_num):
	# wanna grade? html
	# checkbox for graded 
	# box to show how many graded
	# button for distribute
	print("prof_exam_admin:qn_num", qn_num, "ex_id", ex_id)
	attempts = Attempt.objects.filter(exam_id=ex_id, qn_id=qn_num)
	num_graded = attempts.filter(attempt_graded=True).count()
	num_attempts = attempts.count()
	context = {'attemps':attempts, 'num_graded':num_graded, 'num_attempts':num_attempts, 'ex_id':ex_id, 'qn_id':qn_num}
	return render(request, 'course/qn_adm.html', context)

def qn_adm_view(request, ex_id, qn_num):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	do_grade = (request.POST['do_grade'] == '1')
	attempts = Attempt.objects.filter(exam_id=ex_id, qn_id=qn_num)
	course_inst = Exam.objects.get(id=ex_id).instance
	ta_list_raw = Assists.objects.values_list('assistant_id', flat=True).filter(instance=course_inst)
	num_tas = ta_list_raw.count()
	# num_tas = attempts.values_list('assistant_id').distinct().count()
	attempts = attempts.filter(attempt_graded=False)
	print("attempts", attempts)
	ta_list = [ta for ta in ta_list_raw]
	if (do_grade):
		ta_list.append(user_id)
		num_tas += 1
	cnt = 0
	for attempt in attempts:
		attempt.assistant_id = ta_list[cnt]
		cnt = (cnt + 1) % num_tas
		attempt.save()
	return question_list(request, ex_id)

