from django.http import HttpResponseRedirect, Http404, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic

# from .models import Course, Takes, Teaches, Assists

def login(request):
	# if request.method != 'POST':
	# 	raise Http404('Only POSTs are allowed')
	User = request.user
	if User.is_authenticated:
		request.session['user_id'] = User.id
		# return render(request, '/course')
		return HttpResponseRedirect('/game/home');
	else:
		return render(request, 'not_logged.html')
	# try:
	# 	m = Member.objects.get(username=request.POST['username'])
	# 	if m.password == request.POST['password']:
	# 		request.session['member_id'] = m.id
	# 		return HttpResponseRedirect('/you-are-logged-in/')
	# except Member.DoesNotExist:
	# 	return HttpResponse("Your username and password didn't match.")
    # request.session['member_id'] = m.id