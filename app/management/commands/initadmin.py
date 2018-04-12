
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User


class Command(BaseCommand):

    def handle(self, *args, **options):

        username = 'wasuaje'
        email = 'wasuaje@gmail.com'
        password = 'B4rc3l0n4!'
        print('Creating account for %s (%s)' % (username, email))
        User.objects.filter(email=email).delete()
        admin = User.objects.create_superuser(
            email=email, username=username, password=password)
        admin.is_active = True
        admin.is_admin = True
        admin.save()
