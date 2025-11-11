from django.http import HttpResponseRedirect
from django.shortcuts import render
# from dvsr.models import Employerxpo, TabelDataView, Event1Xpo
from dvsr.models import Container, Osn10mView, Roof10mView, Korpus10mView

from dvsr.models import Container
from django_pandas.io import read_frame
import pandas as pd
# from datetime import date

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
            container_base = Osn10mView.objects.all() 
            container_roof = Roof10mView.objects.all()
            container_korpus = Korpus10mView.objects.all()
            # df = read_frame(query)
            # print(df)
            # df.to_csv('dataframe.csv', encoding='utf-8-sig', index=False)
            # manageDataFrame(df)
            # containerId = models.IntegerField(db_column='idcontainer', primary_key=True)
            # containerLength = models.IntegerField(db_column='ContainerLength')
            # containerWidth = models.IntegerField(db_column='ContainerWidth')
            # containerHeight = models.IntegerField(db_column='ContainerHeight')
            context = {'form': form,
                    'query': query, 
                    'container_base': container_base, 
                    'container_roof': container_roof, 
                    'container_korpus': container_korpus}

            return render(request, 'employee.html', context)

# def manageDataFrame(dataframe):
            
#             df_cut = dataframe.loc[dataframe.Time >= '1/1/2023']
#             df_cut['Day'] = df_cut.Time.dt.day
#             # print(df_cut.head())
#             # df_cut = df_cut['Detail'].str
            
#             df_cut = df_cut.loc[20:, df_cut.Detail]
#             print(df_cut)

#             return 1
