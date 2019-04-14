FROM ubuntu:latest

#Install Python3 and add it to the bin folder and upgrade to latest version of pip

WORKDIR /app

RUN apt update && apt -y upgrade \
    && apt install -y wget unzip python3-pip python3-venv build-essential libssl-dev \
    libffi-dev python3-dev libxml2-dev libxslt1-dev libpq-dev groff libjpeg-dev libfreetype6-dev zlib1g-dev \
    && pip3 install awscli --upgrade

ENV LANG en_US.utf8


#Install Terraform Binary
RUN wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
RUN unzip terraform_0.11.13_linux_amd64.zip && mv terraform /usr/local/bin/





