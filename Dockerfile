FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

ENV BASH_ENV=/etc/profile

COPY requirements.txt ./

RUN apt update && apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
      build-essential \
      fftw-dev \
      gcc \
      gfortran \
      git \
      openmpi-bin openmpi-common libopenmpi-dev \
      python3-dev \
      python3-full \
      python3-pip

RUN useradd apes
USER apes
WORKDIR /home/apes
COPY requirements.txt ./
RUN python3 -m venv --system-site-packages venv
RUN source venv/bin/activate
RUN venv/bin/pip install -r requirements.txt
