# Icinga2 on Docker for Ubuntu 14.04 


## Requirements

* [Docker]


## Image details

* Based on Ubuntu 14.04
* Icinga 2 , Icinga Web classic , Apache2
* Icinga 2 API
* Default username: icingaadmin , password: password

### Run

Git Docker file

    $ git clone git@github.com:maradwan/docker_icinga2.git

Create the image

    $ docker build -t icinga2 .
    $ docker run -h icinga2 -d -p 10022:22 -p 8080:80 -p 5665:5665 icinga2

### Exec

Attach to a running container using `exec` and the container name.

    $ docker exec -ti icinga2 /bin/bash

### Stop

    $ docker stop icinga2

### Remove

    $ docker rm icinga2


