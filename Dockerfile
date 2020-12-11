FROM breakpad:latest

# RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# RUN yum -y install python36 python36-pip dos2unix git

# Install requirements
COPY requirements.txt requirements.txt
RUN python3 -m pip install -r requirements.txt
RUN rm -rf requirements.txt


# workdir and user
WORKDIR /oopsypad
# USER 0

COPY . .
RUN cp -rf  /breakpad/* /oopsypad/oopsypad/bin/

ENV PYTHONPATH=/oopsypad

ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8

ENV OOPSY_HOST=http://localhost:8000
# ENV OOPSY_ENV=dev

RUN dos2unix /oopsypad/start.sh\
 /oopsypad/oopsy_run_server.sh\
 /oopsypad/oopsy_celery_worker.sh\
 /oopsypad/oopsy_admin.sh\
 /oopsypad/oopsy_crash_report.sh\
 /oopsypad/oopsy_symfile.sh

EXPOSE 8000

VOLUME ["/oopsypad/oopsypad/symbols"]
VOLUME ["/oopsypad/oopsypad/dumps"]

ENTRYPOINT ["/bin/sh"]
CMD ["/oopsypad/start.sh"]
