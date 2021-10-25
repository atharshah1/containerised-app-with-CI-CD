FROM python:3.8.12-alpine 
RUN mkdir /home/appdir
WORKDIR /home/appdir
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add --no-cache mariadb-dev
RUN pip3 install virtualenv
ADD . /home/appdir/
RUN virtualenv .
RUN source bin/activate
ADD requirements.txt /home/appdir/
RUN pip install -r requirements.txt
ENV DOCKER_FILE=1221

