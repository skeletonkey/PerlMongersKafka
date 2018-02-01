FROM erik2029/ubuntu-perl-kafka_api:17-5.26-1.07
LABEL maintainer="tank@jundy.com"

RUN apt-get update; apt-get -y install vim iputils-ping;

ENV PERL5LIB=/code/lib

WORKDIR /code

CMD perl startup.pl

# docker build --rm=false -t kafka_demo .
# docker run -it --rm --name my_demo -v $PMP_BASE_DIR/app/code:/code kafka_demo /bin/bash
# docker exec -it perlmongerskafka_app_1 /bin/bash
