from django.contrib import admin

from app.models import Contact, Signup


class ContactAdmin(admin.ModelAdmin):
    pass


class SignupAdmin(admin.ModelAdmin):
    pass


admin.site.register(Contact, ContactAdmin)
admin.site.register(Signup, SignupAdmin)
