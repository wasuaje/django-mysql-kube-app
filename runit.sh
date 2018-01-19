#!/usr/bin/bash
python manage.py migrate
uwsgi --ini conf.ini
