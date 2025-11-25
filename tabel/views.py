from django.http import HttpResponseRedirect
from django.shortcuts import render
# from dvsr.models import Employerxpo, TabelDataView, Event1Xpo
from dvsr.models import Container, Osn10mView, Roof10mView, Korpus10mView
# Osn10mView, Roof10mView, Korpus10mView, Osn12mView, Roof12mView, Korpus12mView, Osn14mView, Roof14mView, Korpus14mView
from django.apps import apps
from dvsr.models import Container
from django_pandas.io import read_frame
import pandas as pd


def tabel(request):
    containerId = Container.objects.all()
    container_spec = Osn10mView.objects.all() 
    print(containerId)
    print(container_spec)
    context = {'containerId': containerId, 'container_spec': container_spec }
    return render(request, 'tabel.html', context)


def get_name(request):
    if request.method == 'POST':
        if 'GetName' in request.POST:
            form = request.POST['GetName']
            formList = form.rsplit(" ")
            empNumberFromList = str(formList[0])
            query = Container.objects.all().filter(containerLength = empNumberFromList)
            formStr = str(form)
            textToEnter = f"Osn{formStr}mView".replace(" ", "")
            Invoice = apps.get_model(app_label="dvsr", model_name=textToEnter)


            print(type(Osn10mView))
            container_base = Invoice.objects.all() 
            container_roof = Roof10mView.objects.all()
            container_korpus = Korpus10mView.objects.all()
            print('это значение переменной form:', form)
            context = {'form': form,
                    'query': query, 
                    'container_base': container_base, 
                    'container_roof': container_roof, 
                    'container_korpus': container_korpus}

            return render(request, 'employee.html', context)