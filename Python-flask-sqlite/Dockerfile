FROM ubuntu:16.04
MAINTAINER florian.pereme@altran.com

RUN apt-get update 
RUN apt-get install -y python3-pip python3-dev openssh-server git
RUN cd /usr/local/bin && ln -s /usr/bin/python3 python 
RUN pip3 install --upgrade pip 


RUN pip3 install bokeh==0.12.15 \
certifi==2018.4.16 \
chardet==3.0.4 \
click==6.7 \
cycler==0.10.0 \
Flask==1.0.2 \
Flask-WTF==0.14.2 \
idna==2.7 \
itsdangerous==0.24 \
Jinja2==2.10 \
kiwisolver==1.0.1 \
MarkupSafe==1.0 \
matplotlib==2.2.2 \
numpy==1.14.5 \
packaging==17.1 \
pandas==0.23.3 \
pscript==0.5.5 \
pyparsing==2.2.0 \
python-dateutil==2.7.3 \
pytz==2018.5 \
PyYAML==3.13 \
requests==2.19.1 \
six==1.11.0 \
SQLAlchemy==1.2.10 \
tornado==5.1 \
urllib3==1.23 \
Werkzeug==0.14.1 \
WTForms==2.2.1

RUN apt-get install -y sqlite3 libsqlite3-dev

RUN mkdir /db
RUN /usr/bin/sqlite3 /db/test.db
CMD /bin/bash
  
RUN mkdir -p /var/run/sshd
RUN echo 'root:medica' | chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config


EXPOSE 5000 50006 80 8080 8082 22
CMD /usr/sbin/sshd -D
