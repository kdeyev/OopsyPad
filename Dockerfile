FROM breakpad:latest

# RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# RUN yum -y install python36 python36-pip dos2unix git
RUN python3 -m pip install flask\
 flask-admin\
 flask-mongoengine\
 flask-httpauth\
 flask-security\
 redis\
 celery==4.4.7\
 python-dateutil\
 gunicorn\
 requests\
 raven\
 email_validator


# workdir and user
WORKDIR /OopsyPad
# USER 0

COPY . .

# install OopsyPad
RUN python3 -m pip install .

EXPOSE 8000

ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8

ENV OOPSY_HOST=http://localhost:8000

RUN dos2unix /OopsyPad/start.sh
ENTRYPOINT ["/bin/sh"]
CMD ["/OopsyPad/start.sh"]
