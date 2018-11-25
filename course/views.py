from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic
from django.http import JsonResponse

from .models import *
from django.contrib.auth.models import User
from django.contrib.auth import authenticate

def course_list(request):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	user = User.objects.get(id = user_id)

	instance_ids =[]
	instance_ids.extend(Teaches.objects.values_list('instance_id', flat = True).filter(instructor_id = user_id))
	instance_ids.extend(Takes.objects.values_list('instance_id', flat = True).filter(student_id = user_id))
	instance_ids.extend(Assists.objects.values_list('instance_id', flat = True).filter(assistant_id = user_id))
	
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
	
	context = {'instructor':inst_cid, 'assistant':ta_cid, 'student':stud_cid, 'exams' : exams, 'ciid':course_instance_id}

	return render(request, 'course/exam_list.html', context)

def add_exam_view(request, course_instance_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	course_inst = Instance.objects.get(pk=course_instance_id)
	# coures_inst_id= course_inst.objects.values_list('id', flat=True)
	# request has exam_name and weightage
	newexam = Exam(instance=course_inst, exam_name=request.POST['ex_name'], weightage=request.POST['ex_wt'])
	newexam.save()
	return exams(request, course_inst.id)

def toggle_exam_visibility(request, user_id, ex_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	exam = Exam.objects.get(pk=ex_id)
	exam.exam_graded = not exam.exam_graded
	exam.save()
	return JsonResponse({'newstate':exam.exam_graded})

def ta_qnlist(request, user_id, ex_id):
	print("ex_id = ", ex_id, "user_id = ", user_id)
	exam_weight = Exam.objects.values_list('weightage', flat=True).get(pk=ex_id)
	attempts = Attempt.objects.filter(question__exam_id=ex_id, assistant_id=user_id)
	print(attempts)
	# context = {'attempt_list': attempts}
	context = {'attempt_list': attempts,'role':'ta', 'ex_wt':exam_weight}
	# print("attempts:", attempts)

	return render(request, 'course/qn_list.html', context)

def prof_qnlist(request, user_id, ex_id):
	exam_weight = Exam.objects.values_list('weightage', flat=True).get(pk=ex_id)
	attempts = Attempt.objects.filter(question__exam_id=ex_id, assistant_id=user_id)
	qns = Question.objects.values_list('qn_number', 'full_marks').filter(exam_id=ex_id)
	# qns = Attempt.objects.values_list('qn_id', flat=True).filter(exam_id=ex_id).distinct()
	context = {'attempt_list':attempts, 'qn_list':qns, 'ex_id':ex_id, 'ex_wt':exam_weight, 'is_prof':True}
	print("attempts:", attempts)
	print("exam_weight", exam_weight, "is_prof", context["is_prof"])
	return render(request, 'course/qn_list.html', context)

def add_qn_view(request, ex_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	course_instance = Exam.objects.values_list('instance', flat=True).get(pk=ex_id)
	# for each row matching in takes, add the question
	question = Question(exam_id=ex_id, qn_number=request.POST['qn_id'], full_marks=request.POST['tot_marks'])
	question.save()
	takes_stud = Takes.objects.values_list('student_id', flat=True).filter(instance=course_instance)
	for stud in takes_stud:
		attempt = Attempt(question_id=question.id, student_id=stud, assistant_id=user_id, Marks=0.0, pdf='none_inserted.pdf', page_number=0)
		# attempt = Attempt(question__exam__instance__id=course_instance, question__exam_id=ex_id, question__qn_number=request.POST['qn_id'], student_id=stud, assistant_id=user_id, Marks=0.0, question__full_marks=request.POST['tot_marks'], pdf='none_inserted.pdf', page_number=0)
		attempt.save()
	return prof_qnlist(request, user_id, ex_id)

def stud_qnlist(request, user_id, ex_id):
	print("ex_id = ", ex_id, "user_id = ", user_id)
	exam_weight = Exam.objects.values_list('weightage', flat=True).get(pk=ex_id)
	attempts = Attempt.objects.filter(question__exam_id=ex_id, student_id=user_id)
	# print(attempts)
	# context = {'attempt_list': attempts}
	context = {'attempt_list': attempts,'role':'student', 'ex_wt':exam_weight}

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
	instance_idd = Exam.objects.values_list('instance_id', flat=True).get(id=ex_id)
	isTA = Assists.objects.filter(instance_id=instance_idd, assistant_id=user_id).exists()
	print("isTA", isTA)
	if isTA:
		# if not exam_graded:
			# return render(request, 'course/qn_list.html', {})
		return ta_qnlist(request, user_id, ex_id)
	else:
		isProf = Teaches.objects.filter(instance_id=instance_idd, instructor_id=user_id).exists()
		if isProf:
			return prof_qnlist(request, user_id, ex_id)
		else:
			if not exam_graded:
				return render(request, 'course/qn_list.html', {})
			return stud_qnlist(request, user_id, ex_id)

def prof_exam_admin(request, ex_id, qn_num):
	# wanna grade? html
	# checkbox for graded 
	# box to show how many graded
	# button for distribute
	print("prof_exam_admin:qn_num", qn_num, "ex_id", ex_id)
	attempts = Attempt.objects.filter(question__exam_id=ex_id, question__qn_number=qn_num)
	num_graded = attempts.filter(attempt_graded=True).count()
	num_attempts = attempts.count()
	context = {'attemps':attempts, 'num_graded':num_graded, 'num_attempts':num_attempts, 'ex_id':ex_id, 'qn_id':qn_num}
	return render(request, 'course/qn_adm.html', context)

def qn_adm_view(request, ex_id, qn_num):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	do_grade = (request.POST['do_grade'] == '1')
	attempts = Attempt.objects.filter(question__exam_id=ex_id, question__qn_number=qn_num)
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

def stud_attempt(request, attempt_id):
	attempt = Attempt.objects.get(pk=attempt_id)
	context = {'attempt': attempt}
	return render(request, 'course/stud_attempt.html', context)

def ta_attempt(request, attempt_id):
	attempt = Attempt.objects.get(pk=attempt_id)
	context = {'attempt': attempt}
	return render(request, 'course/ta_attempt.html', context)

# def attempt_desc(request, qn_id):
# 	if not request.user.is_authenticated:
# 		return HttpResponseRedirect('/accounts/login')
# 	user_id = request.session['user_id']

def ta_marks_update_view(request, attempt_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	# user_id = request.session['user_id']
	attempt = Attempt.objects.get(pk=attempt_id)
	grade_cond = (request.POST['grade_cond']=="1")
	print("grade_cond = ", grade_cond, "request.POST['grade_cond']", request.POST['grade_cond'])
	if (grade_cond):
		print("grade_cond = ", grade_cond)
		attempt.attempt_graded = True
	Marks = float(request.POST['marks'])
	print("marks: ", Marks)
	attempt.Marks = Marks
	attempt.save()
	return ta_attempt(request, attempt_id)

def weightage_update_view(request, ex_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	exam = Exam.objects.get(pk=ex_id)
	new_weightage = request.POST['weightage']
	exam.weightage = new_weightage
	exam.save()
	return prof_qnlist(request, user_id, ex_id)

def del_exam(request, ex_id):
	exam = Exam.objects.get(pk=ex_id)
	course_instance_id = exam.instance_id
	exam.delete()
	return exams(request, course_instance_id)
