FROM ubuntu:14.04

# Basic packages
RUN apt-get update \
  && apt-get install -y sudo wget curl python openssh-server 

# Create user
RUN useradd mohamed -d /home/mohamed \
&& usermod --password password mohamed \
&& echo "mohamed ALL=(ALL) ALL" >> /etc/sudoers.d/mohamed


## Install Icinga2
RUN wget -O - http://packages.icinga.org/icinga.key | apt-key add - \
&&  echo 'deb http://packages.icinga.org/ubuntu icinga-trusty main' > /etc/apt/sources.list.d/icinga-main-trusty.list \
&&  apt-get update \
&&  apt-get install -y icinga2 icinga2-classicui

RUN echo 'icingaadmin:$apr1$vWZrfwD4$.Ocs0.iOAZnfcH2stYsGM.' > /etc/icinga2-classicui/htpasswd.users


# supervisord
RUN wget http://peak.telecommunity.com/dist/ez_setup.py;python ez_setup.py \
  && easy_install supervisor
ADD files/supervisord.conf /etc/supervisord.conf

CMD ["supervisord"]

EXPOSE 22 80 
