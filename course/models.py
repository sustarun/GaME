# Create your models here.

import datetime

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User, Group

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
	course_id = models.ForeignKey(Course, on_delete=models.CASCADE)
	section_id = models.CharField(max_length = 10)
	semester = models.CharField(max_length = 20, choices = SEMESTER)
	year = models.IntegerField(default = 2018)

	def __str__(self):
		return str(self.course_id) + " - " + str(self.section_id) + " - " + str(self.semester) + " - " + str(self.year)

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
	student_id = models.ForeignKey(User, on_delete=models.CASCADE)
	instance_id = models.ForeignKey(Instance, on_delete=models.CASCADE)
	grade = models.CharField(max_length = 20, choices = GRADE, default = 'NA')
	def __str__(self):
		return str(self.student_id) + " - " + str(self.instance_id)

class Teaches(models.Model):
	instructor_id = models.ForeignKey(User, on_delete=models.CASCADE)
	instance_id = models.ForeignKey(Instance, on_delete=models.CASCADE)
	def __str__(self):
		return str(self.instructor_id) + " - " + str(self.instance_id)

class Assists(models.Model):
	assistant_id = models.ForeignKey(User, on_delete=models.CASCADE)
	instance_id = models.ForeignKey(Instance, on_delete=models.CASCADE)
	def __str__(self):
		return str(self.assistant_id) + " - " + str(self.instance_id)
