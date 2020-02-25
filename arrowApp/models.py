from django.db import models


# Create your models here.


class User(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30, null=False)
    password = models.CharField(max_length=100, null=False)
    level = models.IntegerField(null=True)


class Customer(models.Model):
    id = models.AutoField(primary_key=True)
    age = models.CharField(max_length=20, null=False)
    sex = models.CharField(max_length=20, null=False)
    emo = models.CharField(max_length=20, null=False)
    od = models.CharField(max_length=20, null=False)
    intention = models.CharField(max_length=20, null=False)
    personality = models.CharField(max_length=20, null=False)
    act = models.CharField(max_length=20, null=False)
    word = models.CharField(max_length=30, null=False)


class Data(models.Model):
    id = models.AutoField(primary_key=True)
    x = models.IntegerField(null=False)
    y = models.IntegerField(null=False)
    word = models.CharField(max_length=30, null=False)
    c_type = models.CharField(max_length=10, null=True)
