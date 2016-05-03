Icinga2 on Docker

Run

git clone git@github.com:maradwan/docker_icinga2.git
docker build -t icinga2/master .

docker run -h icinga.master -d -p 10022:22 -p 8080:80 icinga2/master

