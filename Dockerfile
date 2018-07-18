FROM ubuntu:16.04
MAINTAINER florian.pereme@altran.com

RUN apt-get update  && apt-get install -y python3-pip python3-dev 
RUN cd /usr/local/bin && ln -s /usr/bin/python3 python 
RUN pip3 install --upgrade pip 
RUN pip install flask == 0.12.4 
RUN pip install bokeh == 0.12.5 
RUN pip install numpy 
RUN pip install pandas 
RUN pip install pickle 
RUN pip install copy 
RUN pip install itertools 
RUN pip install doctest


 
  
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN echo 'root:medica' | chpasswd

EXPOSE 5000 50006 80 8080 8082 22
CMD /usr/sbin/sshd -D
