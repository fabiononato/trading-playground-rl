FROM python:3.6.8-jessie

MAINTAINER My Name <email@company.com>

ARG http_proxy
ARG https_proxy
ARG no_proxy

ADD Container-Root /

RUN export http_proxy=$http_proxy; export https_proxy=$https_proxy; export no_proxy=$no_proxy; /setup.sh; rm -f /setup.sh

# Install wget
RUN apt-get update \
    && apt-get install -y build-essential mpich libpq-dev


# Manual requirements
RUN pip install -r /requirements.txt

WORKDIR /wd

CMD /startup.sh
