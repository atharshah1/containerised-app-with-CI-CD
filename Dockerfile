FROM python:3.8.12-bullseye
RUN mkdir /home/appdir
WORKDIR /home/appdir
ADD . /home/appdir/
RUN pip install -r requirements.txt
RUN chmod +x startup.sh
CMD /home/appdir/startup.sh
