# Create your models here.

import datetime

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

# Create your models here.

class Course(models.Model):
	course_id = models.CharField(max_length = 10, primary_key = True)
	course_title = models.CharField(max_length = 100)
	def __str__(self):
		return self.course_id

class Instance(models.Model):
	SEMESTER = (
        ('Autumn', 'Autumn'),
        ('Spring', 'Spring'),
    )
	course = models.ForeignKey(Course, on_delete=models.CASCADE)
	section_id = models.CharField(max_length = 10)
	semester = models.CharField(max_length = 20, choices = SEMESTER)
	year = models.IntegerField(default = 2018)

	def __str__(self):
		return str(self.course) + " - " + str(self.section_id) + " - " + str(self.semester) + " - " + str(self.year)

class Takes(models.Model):
	GRADE = (
        ('AA', 'AA'),
        ('AB', 'AB'),
        ('BB', 'BB'),
        ('BC', 'BC'),
        ('CC', 'CC'),
        ('CD', 'CD'),
        ('DD', 'DD'),
        ('FR', 'FR'),
        ('DX', 'DX'),
        ('NA', 'NA'),
    )
	student = models.ForeignKey(User, on_delete=models.CASCADE)
	instance = models.ForeignKey(Instance, on_delete=models.CASCADE)
	grade = models.CharField(max_length = 20, choices = GRADE, default = 'NA')
	class Meta:
		unique_together = (("instance", "student"),)
	def __str__(self):
		return str(self.student) + " - " + str(self.instance)

class Teaches(models.Model):
	instructor = models.ForeignKey(User, on_delete=models.CASCADE)
	instance = models.ForeignKey(Instance, on_delete=models.CASCADE)
	class Meta:
		unique_together = (("instructor", "instance"),)
	def __str__(self):
		return str(self.instructor) + " - " + str(self.instance)

class Assists(models.Model):
	assistant = models.ForeignKey(User, on_delete=models.CASCADE)
	instance = models.ForeignKey(Instance, on_delete=models.CASCADE)
	class Meta:
		unique_together = (("assistant", "instance"),)
	def __str__(self):
		return str(self.assistant) + " - " + str(self.instance)

class Exam(models.Model):
	instance = models.ForeignKey(Instance, on_delete=models.CASCADE)
	exam_name = models.CharField(max_length = 20)
	weightage = models.DecimalField(decimal_places=2, max_digits=5)
	exam_graded = models.BooleanField(default=False)
	class Meta:
		unique_together = (("instance", "exam_name"),)
	def __str__(self):
		crs = self.instance.course
		return str(crs.course_id)+'-'+str(self.exam_name)

class Question(models.Model):
	exam = models.ForeignKey(Exam, on_delete=models.CASCADE)
	qn_number = models.CharField(max_length=20)
	full_marks = models.DecimalField(max_digits=5, decimal_places=1)
	class Meta:
		unique_together = (("exam", "qn_number"),)
	def __str__(self):
		crs = self.exam.instance.course
		return str(crs.course_id)+'-'+str(self.exam.exam_name)+'-'+str(self.qn_number)

class Attempt(models.Model):
	question = models.ForeignKey(Question, on_delete=models.CASCADE)
	# instance = models.ForeignKey(Instance, on_delete=models.CASCADE)
	# exam = models.ForeignKey(Exam, on_delete=models.CASCADE)
	# qn_id = models.CharField(max_length = 20)
	student = models.ForeignKey(User, on_delete=models.CASCADE, related_name='stud_id')
	assistant = models.ForeignKey(User, on_delete=models.CASCADE, related_name='ta_id')
	Marks = models.DecimalField(max_digits=5, decimal_places=1)
	# full_marks = models.DecimalField(max_digits=5,decimal_places=1)
	pdf = models.CharField(max_length=256)
	page_number = models.IntegerField()
	num_pages = models.IntegerField(default=1)
	attempt_graded = models.BooleanField(default=False)
	def __str__(self):
		qn = self.question
		return str(self.student)+'-'+str(qn)
	
# class Question(models.Model):
#     question_text = models.CharField(max_length=200)
#     pub_date = models.DateTimeField('date published')
#     def __str__(self):
#     	return self.question_text
#     # def __str__(self):
#     # 	return self.question_text
#     def was_published_recently(self):
#         return self.pub_date >= timezone.no() - datetime.timedelta(days=1)


# class Choice(models.Model):
#     question = models.ForeignKey(Question, on_delete=models.CASCADE)
#     choice_text = models.CharField(max_length=200)
#     votes = models.IntegerField(default=0)
#     def __str__(self):
#     	return self.choice_text
	# def __str__(self):
	# 	return self.choice_text

