FROM python:3.6

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        mysql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY ./app ./project ./conf.ini ./

EXPOSE 8080
CMD ["python", "manage.py", "migrate"]
CMD ["uwsgi", "--ini", "conf.ini"]
