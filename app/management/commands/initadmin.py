
from django.core.management.base import BaseCommand, CommandError


class Command(BaseCommand):

    def handle(self, *args, **options):
        if Account.objects.count() == 0:
            for user in settings.ADMINS:
                username = 'wasuaje'
                email = 'wasuaje@gmail.com'
                password = 'B4rc3l0n4!'
                print('Creating account for %s (%s)' % (username, email))
                admin = Account.objects.create_superuser(
                    email=email, username=username, password=password)
                admin.is_active = True
                admin.is_admin = True
                admin.save()
        else:
            print('Admin accounts can only be initialized if no Accounts exist')
