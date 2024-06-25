FROM --platform=arm64 ubuntu:22.04

RUN set -o xtrace && \
    apt-get update && \
    apt-get install -y vim net-tools && \
    apt-get install -y curl openssh-server ca-certificates perl && \
    ln -fs /usr/share/zoneinfo/Europe/Monaco /etc/localtime && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash

RUN EXTERNAL_URL="http://gitlab.example.com" apt-get install -y gitlab-ee=17.0.2-ee.0
