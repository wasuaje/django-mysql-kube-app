from django.db import models

# Create your models here.


class Contact(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    subject = models.CharField(blank=True, null=True, max_length=100)
    message = models.CharField(max_length=500)
    created_on = models.DateTimeField('created_on', auto_now_add=True)

    def __str__(self):
        return self.name


class Signup(models.Model):
    email = models.EmailField(max_length=100)
    created_on = models.DateTimeField('created_on', auto_now_add=True)

    def __str__(self):
        return self.email
