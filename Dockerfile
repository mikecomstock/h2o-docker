FROM phusion/baseimage

MAINTAINER Mike Comstock "mcomstock@prosper.com"

RUN apt-get update
RUN apt-get install -y unzip openjdk-7-jre

RUN curl 'http://s3.amazonaws.com/h2o-release/h2o/rel-kolmogorov/3/h2o-2.4.4.3.zip' > /root/h2o.zip
RUN unzip /root/h2o.zip -d /root

RUN mkdir /etc/service/h2o
ADD h2o.sh /etc/service/h2o/run

EXPOSE 54321

CMD ["/sbin/my_init"]
