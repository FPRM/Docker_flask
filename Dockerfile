FROM ubuntu:16.04
MAINTAINER florian.pereme@altran.com

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
  && pip3 install flask = 0.12.4
  && pip3 install bokeh = 0.12.5
  && pip3 install numpy
  && pip3 install pandas
  && pip3 install pickle
  && pip3 install copy
  && pip3 install itertools
  && pip3 install doctest


 
  
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN echo 'root:medica' | chpasswd

EXPOSE 5000 50006 80 8080 8082 22
CMD /usr/sbin/sshd -D
