from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.http import JsonResponse

from django.core.serializers.json import DjangoJSONEncoder
from django.core import serializers
import json

from django.db.models import Avg, Max, Min, Sum

from .models import *
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
import PyPDF2
import os
from django.conf import settings
import sys
from django.core.files.storage import FileSystemStorage
if sys.version_info >= (3, 6):
    import zipfile
else:
    import zipfile36 as zipfile

def course_list(request):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	user = User.objects.get(id = user_id)

	instance_ids =[]
	instance_ids.extend(Teaches.objects.values_list('instance_id', flat = True).filter(instructor_id = user_id))
	instance_ids.extend(Takes.objects.values_list('instance_id', flat = True).filter(student_id = user_id))
	instance_ids.extend(Assists.objects.values_list('instance_id', flat = True).filter(assistant_id = user_id))
		
	course_list = Instance.objects.filter(id__in = instance_ids).order_by('course_id').order_by('-year').order_by('-semester')

	context = {'course_list': course_list}
	return render(request, 'course/course_list.html', context)

def exams(request,course_instance_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	user = User.objects.get(id = user_id)
	stud_cid = []
	inst_cid = []
	ta_cid = []
	course = Instance.objects.get(pk = course_instance_id)
	# course = instance1.course
	exams = Exam.objects.filter(instance_id = course_instance_id)
	inst_cid.extend(Teaches.objects.filter(instance_id = course_instance_id).filter(instructor_id = user_id))
	stud_cid.extend(Takes.objects.filter(instance_id = course_instance_id).filter(student_id = user_id))
	ta_cid.extend(Assists.objects.filter(instance_id = course_instance_id).filter(assistant_id = user_id))
	
	context = {'course':course, 'instructor':inst_cid, 'assistant':ta_cid, 'student':stud_cid, 'exams' : exams, 'ciid':course_instance_id}

	return render(request, 'course/exam_list.html', context)

def add_exam_view(request, course_instance_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	course_inst = Instance.objects.get(pk=course_instance_id)
	# coures_inst_id= course_inst.objects.values_list('id', flat=True)
	# request has exam_name and weightage
	if Exam.objects.filter(instance=course_inst, exam_name=request.POST['ex_name']).exists():
		return redirect('exam_list', course_instance_id=course_inst.id)

	newexam = Exam(instance=course_inst, exam_name=request.POST['ex_name'], weightage=request.POST['ex_wt'])
	newexam.save()
	return redirect('exam_list', course_instance_id=course_inst.id)
	# return exams(request, course_inst.id)

def toggle_exam_visibility(request):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	exam = Exam.objects.get(pk=request.POST['ex_id'])
	new_stat = request.POST['visible']
	# print("new_stat", new_stat)
	exam.exam_graded = (new_stat == 'true')
	exam.save()
	return JsonResponse({'newstate':exam.exam_graded})

def attempt_list(request, qn_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	attempts = Attempt.objects.filter(question_id=qn_id, assistant_id=request.user.id)
	context = {'attempt_list': attempts}
	# print(attempts)
	return render(request, 'course/attempt_list.html', context)

def ta_qnlist(request, user_id, ex_id):
	ex_obj = Exam.objects.get(pk=ex_id)
	# course = ex_obj.instance
	# exam_name = 
	print("ex_id = ", ex_id, "user_id = ", user_id)
	# exam_weight = Exam.objects.values_list('weightage', flat=True).get(pk=ex_id)
	attempts = Attempt.objects.filter(question__exam_id=ex_id, assistant_id=user_id)
	qn_list = Question.objects.filter(exam_id=ex_id).order_by('qn_number')
	num_ques = qn_list.count()
	tot_marks = qn_list.aggregate(Sum('full_marks'))
	print("num_ques = ", num_ques, " tot_marks = ", tot_marks)
	tot_marks = tot_marks['full_marks__sum']
	print("num_ques = ", num_ques, " tot_marks = ", tot_marks)
	# total_marks = Question.objects.filter(exam_id = ex_id).count()
	# print("num_ques" = num_ques)
	print(attempts)
	# context = {'attempt_list': attempts}
	context = {'question_list':qn_list,'role':'ta', 'exam':ex_obj,'num_ques':num_ques, 'tot_marks':tot_marks}
	# print("attempts:", attempts)

	return render(request, 'course/qn_list.html', context)

def get_ta_from_course(instance_id):
	return  Assists.objects.filter(instance_id=instance_id)

# def prof_qnlist(request, user_id, ex_id):

# 	exam=Exam.objects.get(id=ex_id)
# 	ta_list = get_ta_from_course(exam.instance.id)
# 	exam_weight = Exam.objects.values_list('weightage', flat=True).get(pk=ex_id)
# 	attempts = Attempt.objects.filter(question__exam_id=ex_id, assistant_id=user_id)
# 	qns = Question.objects.values_list('qn_number', 'full_marks').filter(exam_id=ex_id)
# 	qn_list = Question.objects.filter(exam_id=ex_id).order_by('qn_number')
# 	# qns = Attempt.objects.values_list('qn_id', flat=True).filter(exam_id=ex_id).distinct()
# 	# context = {'attempt_list':attempts, 'qn_list':qns, 'ex_id':ex_id, 'ex_wt':exam_weight, 'is_prof':True}
# 	num_graded = attempts.filter(attempt_graded=True).count()
# 	# num_attempts = attempts.count()
# 	context = {'question_list':qn_list, 'ex_id':ex_id, 'ex_wt':exam_weight, 'is_prof':True, 'num_graded':num_graded ,'ta_list':ta_list,'ta_list_py':ta_list}#, 'num_attempts':num_attempts}
# 	print(ta_list)

# 	no_json_list = ['question_list', 'ex_id','ex_wt', 'is_prof', 'num_graded', 'ta_list_py']
# 	for key in context.keys():
# 		if (key in no_json_list):
# 			continue
# 		context[key] = serializers.serialize('json', context[key])#, fields=('id', 'student_id', 'student__username', 'attempt_graded', 'pdf', 'page_number'))
# 	return render(request, 'course/qn_list.html', context)

def prof_qnlist(request, user_id, ex_id):
	exam=Exam.objects.get(id=ex_id)
	ta_list = get_ta_from_course(exam.instance.id)
	ex_obj = Exam.objects.get(pk=ex_id)
	# course = ex_obj.instance
	# exam_weight = Exam.objects.values_list('weightage', flat=True).get(pk=ex_id)
	attempts = Attempt.objects.filter(question__exam_id=ex_id, assistant_id=user_id)
	qn_list = Question.objects.filter(exam_id=ex_id).order_by('qn_number')
	num_ques = qn_list.count()
	tot_marks = qn_list.aggregate(Sum('full_marks'))
	print("num_ques = ", num_ques, " tot_marks = ", tot_marks)
	tot_marks = tot_marks['full_marks__sum']
	print("num_ques = ", num_ques, " tot_marks = ", tot_marks)
	num_graded = attempts.filter(attempt_graded=True).count()
	# qns = Attempt.objects.values_list('qn_id', flat=True).filter(exam_id=ex_id).distinct()
	# context = {'question_list':qn_list, 'ex_id':ex_id, 'ex_wt':exam_weight, 'is_prof':True, 'num_graded':num_graded ,'ta_list':ta_list,'ta_list_py':ta_list}#, 'num_attempts':num_attempts}
	context = {'question_list':qn_list,'num_graded':num_graded, 'role':'prof', 'exam':ex_obj, 'num_ques':num_ques, 'tot_marks':tot_marks, 'ta_list':ta_list,'ta_list_py':ta_list}
	print("attempts:", attempts)
	# print("exam_weight", exam_weight, "is_prof", context["is_prof"])
					# 'question_list','num_graded', 'role', 'exam', 'num_ques', 'tot_marks','ta_list_py'
	# no_json_list = ['question_list', 'ex_id','ex_wt', 'is_prof', 'num_graded', 'ta_list_py']
	no_json_list = ['question_list','num_graded', 'role', 'exam', 'num_ques', 'tot_marks','ta_list_py']
	for key in context.keys():
		if (key in no_json_list):
			continue
		context[key] = serializers.serialize('json', context[key])#, fields=('id',
	return render(request, 'course/qn_list.html', context)


def add_qn_view(request, ex_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	course_instance = Exam.objects.values_list('instance', flat=True).get(pk=ex_id)
	# for each row matching in takes, add the question
	if Question.objects.filter(exam_id=ex_id, qn_number=request.POST['qn_id']).exists():
		return redirect('qn_list', ex_id=ex_id)
	question = Question(exam_id=ex_id, qn_number=request.POST['qn_id'], full_marks=request.POST['tot_marks'])
	question.save()
	takes_stud = Takes.objects.values_list('student_id', flat=True).filter(instance=course_instance)
	# if Attempt.objects.filter()
	for stud in takes_stud:
		attempt = Attempt(question_id=question.id, student_id=stud, assistant_id=user_id, Marks=0.0, pdf='none_inserted.pdf', page_number=0)
		# attempt = Attempt(question__exam__instance__id=course_instance, question__exam_id=ex_id, question__qn_number=request.POST['qn_id'], student_id=stud, assistant_id=user_id, Marks=0.0, question__full_marks=request.POST['tot_marks'], pdf='none_inserted.pdf', page_number=0)
		attempt.save()
	return redirect('qn_list', ex_id=ex_id)

def stud_qnlist(request, user_id, ex_id):
	ex_obj = Exam.objects.get(pk=ex_id)
	# course = ex_obj.instance
	print("ex_id = ", ex_id, "user_id = ", user_id)
	# exam_weight = Exam.objects.values_list('weightage', flat=True).get(pk=ex_id)
	attempts = Attempt.objects.filter(question__exam_id=ex_id, student_id=user_id)
	qn_list = Question.objects.filter(exam_id=ex_id).order_by('qn_number')
	num_ques = qn_list.count()
	tot_marks = qn_list.aggregate(Sum('full_marks'))
	print("num_ques = ", num_ques, " tot_marks = ", tot_marks)
	tot_marks = tot_marks['full_marks__sum']
	print("num_ques = ", num_ques, " tot_marks = ", tot_marks)
	# print(attempts)
	# context = {'attempt_list': attempts}
	context = {'attempt_list': attempts,'role':'student', 'exam':ex_obj, 'num_ques':num_ques, 'tot_marks':tot_marks}

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

def stud_attempt(request, attempt_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	attempt = Attempt.objects.get(pk=attempt_id)
	user_id = request.session['user_id']
	attempts = Attempt.objects.filter(question__exam=attempt.question.exam, student_id=user_id).order_by('question')
	num_attempts = attempts.count()
	question_nos = attempts.values('question_id', 'question__qn_number')
	qn_nos_list = [[v["question_id"], v["question__qn_number"]] for v in question_nos]
	print('attempts:', attempts)
	index = attempts.filter(question__lt=attempt.question).count()
	context = {'index': index, 'num_attempts':num_attempts, 'attempts':attempts, 'qn_nos_list':qn_nos_list}
	no_json_list = ['index', 'num_attempts', 'qn_nos_list']#['attempt', 'num_ungrd', 'num_grd', 'index_g', 'index_ug', 'active', 'sname_list']
	for key in context.keys():
		if (key in no_json_list):
			continue
		context[key] = serializers.serialize('json', context[key])
	return render(request, 'course/stud_attempt.html', context)

def ta_attempt(request, attempt_id):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	# print("request.POST", request.POST)
	if 'send_json' in request.POST:
		send_json = True
	else:
		send_json = False

	user_id = request.session['user_id']
	attempt = Attempt.objects.get(pk=attempt_id)
	question = attempt.question
	attempts = Attempt.objects.filter(question=question, assistant_id=user_id).order_by('student_id')
	graded_attempts = attempts.filter(attempt_graded=True)

	# graded_attempts = attempts.values_list('id', 'student_id', 'student__username', 'attempt_graded', 'pdf', 'page_number').filter(attempt_graded=True)
	ungraded_attempts = attempts.filter(attempt_graded=False)
	snames = attempts.values('student_id', 'student__username')
	sname_list = [(v["student_id"], v["student__username"]) for v in snames]
	num_graded = graded_attempts.count()
	num_ungraded = ungraded_attempts.count()
	index_g = graded_attempts.filter(student_id__lt=attempt.student_id).count()
	index_ug = ungraded_attempts.filter(student_id__lt=attempt.student_id).count()
	if (attempt.attempt_graded):
		index_ug = 0
		active=1
	else:
		index_g = 0
		active=0
	context = {"grd_att": graded_attempts, "ungrd_att": ungraded_attempts,
	"num_grd":num_graded, "num_ungrd":num_ungraded, "index_g":index_g,
	"index_ug":index_ug, 'active':active, 'sname_list':json.dumps(sname_list)}
	no_json_list = ['attempt', 'num_ungrd', 'num_grd', 'index_g', 'index_ug', 'active', 'sname_list']
	for key in context.keys():
		if (key in no_json_list):
			continue
		context[key] = serializers.serialize('json', context[key])#, fields=('id', 'student_id', 'student__username', 'attempt_graded', 'pdf', 'page_number'))

	if not send_json:
		return render(request, 'course/ta_attempt.html', context)
	return JsonResponse(context)

def get_my_pdf(request):#, page_number, pdf_path, num_of_page=1):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.POST['stud_id']
	# print('#'*40)
	page_number = int(request.POST['page_number'])
	pdf_path = request.POST['pdf_path']
	pdf_path = os.path.join(settings.BASE_DIR, pdf_path)
	print("pdf_path", pdf_path)
	if not os.path.isfile(pdf_path):
		print("not found")
		return JsonResponse({'status':False})
	# print("page_number:", page_number, "pdf_path", pdf_path)
	num_of_page = int(request.POST['num_pages'])
	# page_number, pdf_path = 0, 'pdfs/2.pdf'
	# print("current wrkng dir", os.getcwd())
	outfile_path = str(user_id) + "temp.pdf"
	with open(pdf_path, 'rb') as pdf:
		reader = PyPDF2.PdfFileReader(pdf)
		writer = PyPDF2.PdfFileWriter()
		for i in range(num_of_page):
			writer.addPage(reader.getPage(page_number + i))
		# page = reader.getPage(page_number+ num_of_page -1)
		# page.cropBox.lowerLeft  = (0, 600)
		# page.cropBox.upperRight = (1000, 1000)
		# writer.addPage(page)
		# outfile_path = str(user_id) +"temp.pdf"
		with open("static/" + outfile_path, 'wb') as outfile:
			writer.write(outfile)
	pdf.closed
	# context = {'url':outfile_path}
	return JsonResponse({'url': outfile_path, 'status':True})
# def attempt_desc(request, qn_id):
# 	if not request.user.is_authenticated:
# 		return HttpResponseRedirect('/accounts/login')
# 	user_id = request.session['user_id']


# def attempt_desc(request, qn_id):
# 	if not request.user.is_authenticated:
# 		return HttpResponseRedirect('/accounts/login')
# 	user_id = request.session['user_id']

def ta_marks_update_view(request):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	attempt_id = request.POST['attempt_id']
	# user_id = request.session['user_id']
	attempt = Attempt.objects.get(pk=attempt_id)
	if 'grade_cond' not in request.POST:
		grade_cond = False
	else:
		grade_cond = (request.POST['grade_cond']=="true")
	if (grade_cond):
		# print("grade_cond = ", grade_cond)
		attempt.attempt_graded = True
	Marks = float(request.POST['marks'])
	# print("marks: ", Marks)
	attempt.Marks = Marks
	attempt.save()
	return ta_attempt(request, attempt_id)
	return JsonResponse({'success':True})
	# return ta_attempt(request, attempt_id)

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
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	exam = Exam.objects.get(pk=ex_id)
	course_instance_id = exam.instance_id
	exam.delete()
	return redirect('exam_list', course_instance_id=course_instance_id)

def del_question(request, qn_id):
	# TODO: add it to url, reload at client side
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	question = Question.objects.get(pk=qn_id)
	exam_id = question.exam.id
	question.delete()
	return redirect('qn_list', ex_id=exam_id)
	return JsonResponse({'status':True})

def upload_file(request):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	# print("upload_file"+'#'*20)
	# print("request.POST:", request.POST)
	# print("request.FILES:", request.FILES)
	# print("request.POST['ex_id']", request.POST['ex_id'])
	if not request.POST['ex_id']:
		return JsonResponse({'status': False})
	ex_id = request.POST['ex_id']
	print("ex_id", ex_id)
	if request.method == 'POST' and request.FILES['myfile']:
		myfile = request.FILES['myfile']
		newtardir = os.path.join('tars', str(ex_id))
		newpdfdir = os.path.join('pdfs', str(ex_id))
		os.makedirs(newtardir, exist_ok=True)
		os.makedirs(newpdfdir, exist_ok=True)
		fs = FileSystemStorage(location=newtardir)
		# print("here$$$$$$$$$")
		# print("filename = ", myfile.name)
		fn = os.path.join(newtardir, myfile.name)
		print("fn", fn)
		filename = fs.save(myfile.name, myfile)
		with zipfile.ZipFile(fn, 'r') as z:
			z.extractall(newpdfdir)
		os.remove(fn)
		filenames = sorted(os.listdir(newpdfdir))
    	# filenames = [os.path.join(newpdfdir, filename) for filename in filenames]

		for file in filenames:
			name = file[:-4]
			attempts = Attempt.objects.filter(student_id = name, question__exam_id = ex_id).order_by('question_id')
			count = 1
			for attempt in attempts:
				attempt.pdf = os.path.join(newpdfdir, file)
				# print("path: " attempt.pdf_path)
				attempt.page_number = count
				attempt.save()
				count += 1
			
		# uploaded_file_url = fs.url(filename)
		return JsonResponse({'status':True})
	return JsonResponse({'status': False})

# def upload_file(request):
# 	if request.method == 'POST':
#         form = UploadFileForm(request.POST, request.FILES)
#         if form.is_valid():
#             handle_uploaded_file(request.FILES['file'])
#             return JsonResponse({'status': True})
#     else:
#         form = UploadFileForm()
#     return render(request, 'upload.html', {'form': form})

def qn_adm_view(request):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	do_grade = (request.POST['do_grade'] == '2')
	if (do_grade):
		return qn_adm_view_helper(request)
	do_grade = (request.POST['do_grade'] == '1')
	qn_id = request.POST['qn_id']
	ex_id = Question.objects.values_list('exam_id', flat=True).get(pk=qn_id)
	attempts = Attempt.objects.filter(question_id=qn_id)
	course_inst = Question.objects.get(id=qn_id).exam.instance
	ta_list_raw = Assists.objects.values_list('assistant_id', flat=True).filter(instance=course_inst)
	num_tas = ta_list_raw.count()
	# num_tas = attempts.values_list('assistant_id').distinct().count()
	attempts = attempts.filter(attempt_graded=False)
	# print("attempts", attempts)
	ta_list = [ta for ta in ta_list_raw]
	if (do_grade):
		ta_list.append(user_id)
		num_tas += 1
	cnt = 0
	# print("ta_list:", ta_list)
	for attempt in attempts:
		attempt.assistant_id = ta_list[cnt]
		cnt = (cnt + 1) % num_tas
		attempt.save()
	return question_list(request, ex_id)

def qn_adm_view_helper(request):
	if not request.user.is_authenticated:
		return HttpResponseRedirect('/accounts/login')
	user_id = request.session['user_id']
	qn_id = request.POST['qn_id']
	ex_id = Question.objects.values_list('exam_id', flat=True).get(pk=qn_id)
	attempts = Attempt.objects.filter(question_id=qn_id)
	course_inst = Question.objects.get(id=qn_id).exam.instance
	ta_list_raw = request.POST['ta_lists']
	# print(ta_list_raw)
	ta_list=[]

	if(ta_list_raw=="[]"):
		ta_list=[]
	else:
		ta_list=list(map(int, ta_list_raw[1:-1].split(',')))
	# print(ta_list_raw)
	num_tas = len(ta_list)
	# print(num_tas)
	attempts = attempts.filter(attempt_graded=False)
	if (request.POST['prof']=='1'):
		# print("prof present")
		ta_list.append(user_id)
		num_tas += 1
	cnt = 0
	for attempt in attempts:
		attempt.assistant_id = ta_list[cnt]
		cnt = (cnt + 1) % num_tas
		attempt.save()
	return question_list(request, ex_id)
