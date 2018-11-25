from django.contrib import admin

# Register your models here.
from .models import *

# Register your models here.
admin.site.register(Course)
admin.site.register(Takes)
admin.site.register(Teaches)
admin.site.register(Assists)
admin.site.register(Instance)
admin.site.register(Exam)
admin.site.register(Attempt)
admin.site.register(Question)