from django.db import models


class Container(models.Model):
    containerId = models.IntegerField(db_column='idcontainer', primary_key=True)
    containerLength = models.IntegerField(db_column='ContainerLength')
    containerWidth = models.IntegerField(db_column='ContainerWidth')
    containerHeight = models.IntegerField(db_column='ContainerHeight')

    class Meta:
        managed = False
        db_table = 'container'


class Osn10mView(models.Model):
    materials_osn_10m = models.IntegerField(primary_key=True)
    code1c = models.CharField(max_length=255)
    naimenovanie = models.CharField(max_length=255)
    type = models.CharField(max_length=255)  # тип профиля
    gost = models.CharField(max_length=255)
    kolichestvo = models.IntegerField()
    edizmer = models.CharField(max_length=50)
    
    class Meta:
        managed = False  # важно! Django не будет 
        db_table = 'osn_10m_view'

class Roof10mView(models.Model):
    materials_roof_10m = models.IntegerField(primary_key=True)
    code1c = models.CharField(max_length=255)
    naimenovanie = models.CharField(max_length=255)
    type = models.CharField(max_length=255)  # тип профиля
    gost = models.CharField(max_length=255)
    kolichestvo = models.IntegerField()
    edizmer = models.CharField(max_length=50)
    
    class Meta:
        managed = False  # важно! Django не будет 
        db_table = 'roof_10m_view'


class Korpus10mView(models.Model):
    materials_korpus_10m = models.IntegerField(primary_key=True)
    code1c = models.CharField(max_length=255)
    naimenovanie = models.CharField(max_length=255)
    type = models.CharField(max_length=255)  # тип профиля
    gost = models.CharField(max_length=255)
    kolichestvo = models.IntegerField()
    edizmer = models.CharField(max_length=50)
    
    class Meta:
        managed = False  # важно! Django не будет 
        db_table = 'korpus_10m_view'
    # def _str_(self):
    #     return f"{self.naimenovanie} - {self.kolichestvo} {self.edizmer}"

# class Employerxpo(models.Model):
#     oid = models.AutoField(db_column='OID', primary_key=True)  # Field name made lowercase.
#     lastname = models.CharField(db_column='LastName', max_length=100, blank=True, null=True)  # Field name made lowercase.
#     midname = models.CharField(db_column='MidName', max_length=100, blank=True, null=True)  # Field name made lowercase.
#     name = models.CharField(db_column='Name', max_length=100, blank=True, null=True)  # Field name made lowercase.
#     tablenumber = models.CharField(db_column='TableNumber', max_length=100, blank=True, null=True)  # Field name made lowercase.

#     class Meta:
#         managed = False
#         db_table = 'EmployerXPO'


# class Event1Xpo(models.Model):
#     oid = models.AutoField(db_column='OID', primary_key=True)  # Field name made lowercase.
#     detail = models.TextField(db_column='Detail', blank=True, null=True)  # Field name made lowercase.
#     employer2 = models.ForeignKey(Employerxpo, models.DO_NOTHING, db_column='Employer2', blank=True, null=True)  # Field name made lowercase.
#     isrealtime = models.BooleanField(db_column='IsRealtime', blank=True, null=True)  # Field name made lowercase.
#     eventstype = models.IntegerField(db_column='EventsType', blank=True, null=True)  # Field name made lowercase.
#     timeutc2 = models.DateTimeField(db_column='TimeUTC2', blank=True, null=True)  # Field name made lowercase.


#     class Meta:
#         managed = False
#         db_table = 'Event1XPO'


# class TabelDataView(models.Model):
#     EmpId = models.IntegerField(db_column='EmpId', primary_key=True)
#     Name = models.CharField(db_column='Name', max_length=100, blank=True, null=True)
#     MidName = models.CharField(db_column='MidName', max_length=100, blank=True, null=True)
#     LastName = models.CharField(db_column='LastName', max_length=100, blank=True, null=True)
#     Detail = models.TextField(db_column='Detail', blank=True, null=True)
#     Time = models.DateTimeField(db_column='Time', blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = 'TabelDataView'
