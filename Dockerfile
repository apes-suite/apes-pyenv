FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

ENV BASH_ENV=/etc/profile
WORKDIR /opt/apes

COPY requirements.txt ./

RUN apt update && apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
      build-essential \
      fftw-dev \
      gcc \
      gfortran \
      openmpi-bin openmpi-common libopenmpi-dev \
      python3-dev \
      python3-pip \

RUN pip install --no-cache-dir -r requirements.txt

RUN useradd apes
USER apes
