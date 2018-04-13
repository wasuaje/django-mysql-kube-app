# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.core.files.storage import default_storage

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.db.models.fields.files import FieldFile
from django.views.generic import FormView
from django.views.generic.base import TemplateView
from django.contrib import messages
from django.http import HttpResponse

#from .forms import ContactForm, FilesForm, ContactFormSet
from django.shortcuts import render
from app.models import Contact, Signup

# Create your views here.


class HomePageView(TemplateView):
    template_name = 'app/index.html'
    #con = Contact.objects.all()
    #sig = Signup.objects.all()
    #print(sig, con)

    def get_context_data(self, **kwargs):
        context = super(HomePageView, self).get_context_data(**kwargs)
        #messages.info(self.request, 'hello http://wasuaje.com.com')
        return context


def contact(request):
    template_name = 'app/index.html'
    mess = ''
    if request.method == 'POST':
        # Code block for POST request
        name = request.POST["name"]
        email = request.POST["email"]
        subject = request.POST["subject"]
        message = request.POST["message"]
        con = Contact(name=name, email=email,
                      subject=subject, message=message)
        con.save()
        if con.pk:
            mess = 'OK'
        else:
            mess = 'FAIL'
    else:
        # Code block for GET request (will also match PUT, HEAD, DELETE, etc)
        mess = 'FAIL'

    return HttpResponse(mess)


def signup(request):
    template_name = 'app/index.html'
    mess = ''
    if request.method == 'POST':
        # Code block for POST request
        email = request.POST["email2"]
        con = Signup(email=email)
        con.save()
        if con.pk:
            mess = 'OK'
        else:
            mess = 'FAIL'
    else:
        mess = 'FAIL'
        # Code block for GET request (will also match PUT, HEAD, DELETE, etc)
    return HttpResponse(mess)
