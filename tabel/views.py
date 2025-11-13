from django.http import HttpResponseRedirect
from django.shortcuts import render
# from dvsr.models import Employerxpo, TabelDataView, Event1Xpo
from dvsr.models import Container, Osn19mView, Roof9mView, Korpus9mView, Osn10mView, Roof10mView, Korpus10mView, Osn12mView, Roof12mView, Korpus12mView, Osn14mView, Roof14mView, Korpus14mView

from dvsr.models import Container
from django_pandas.io import read_frame
import pandas as pd
# from datetime import date

MODELS_MAPPING = {
    '9':  (Osn9mView, Roof9mView, Korpus9mView),
    '10': (Osn10mView, Roof10mView, Korpus10mView),
    '12': (Osn12mView, Roof12mView, Korpus12mView),
    '14': (Osn14mView, Roof14mView, Korpus14mView)
}

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
            container_length = request.POST['GetName'].strip()

            try:
                OsnModel, RoofModel, KorpusModel = MODELS_MAPPING[Container.container_length]
            
                query = Container.objects.filter(containerLength=Container.container_length)
                container_base = OsnModel.objects.all()
                container_roof = RoofModel.objects.all()
                container_korpus = KorpusModel.objects.all()                
                
                form = request.POST['GetName']
                formList = form.rsplit(" ")
                empNumberFromList = str(formList[0])
                query = Container.objects.all().filter(containerLength=Container.container_length)
                container_base = Osn10mView.objects.all()   
                container_roof = Roof10mView.objects.all()
                container_korpus = Korpus10mView.objects.all()
                context = {'form': Container.container_length,
                            'query': query, 
                            'container_base': container_base, 
                            'container_roof': container_roof, 
                            'container_korpus': container_korpus}

                return render(request, 'employee.html', context)
        
            except KeyError:
            # Обработка случая, когда длина не найдена в мэппинге
                return render(request, 'employee.html', {
                'error': f'Модели для контейнера длиной {container_length} не найдены'})
            

# def manageDataFrame(dataframe):
            
#             df_cut = dataframe.loc[dataframe.Time >= '1/1/2023']
#             df_cut['Day'] = df_cut.Time.dt.day
#             # print(df_cut.head())
#             # df_cut = df_cut['Detail'].str
            
#             df_cut = df_cut.loc[20:, df_cut.Detail]
#             print(df_cut)

#             return 1



# def get_name(request):
#     if request.method == 'POST':
#         if 'GetName' in request.POST:
#             form = request.POST['GetName']
#             formList = form.rsplit(" ")
#             empNumberFromList = str(formList[0])
#             query = Container.objects.all().filter(containerLength = empNumberFromList)
#             container_base = Osn10mView.objects.all() 
#             container_roof = Roof10mView.objects.all()
#             container_korpus = Korpus10mView.objects.all()
#             # df = read_frame(query)
#             # print(df)
#             # df.to_csv('dataframe.csv', encoding='utf-8-sig', index=False)
#             # manageDataFrame(df)
#             # containerId = models.IntegerField(db_column='idcontainer', primary_key=True)
#             # containerLength = models.IntegerField(db_column='ContainerLength')
#             # containerWidth = models.IntegerField(db_column='ContainerWidth')
#             # containerHeight = models.IntegerField(db_column='ContainerHeight')
#             context = {'form': form,
#                     'query': query, 
#                     'container_base': container_base, 
#                     'container_roof': container_roof, 
#                     'container_korpus': container_korpus}

#             return render(request, 'employee.html', context)