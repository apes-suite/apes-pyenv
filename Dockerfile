ARG UBUNTU_VERSION=latest
FROM ubuntu:${UBUNTU_VERSION}

SHELL ["/bin/bash", "-c"]

ENV BASH_ENV=/etc/profile

RUN apt update && apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
      build-essential \
      gcc \
      gfortran \
      git \
      libfftw3-dev \
      openmpi-bin openmpi-common libopenmpi-dev \
      python3-dev \
      python3-full \
      python3-pip

RUN useradd apes
USER apes
ENV APES_HOME=/home/apes
WORKDIR $APES_HOME
COPY requirements.txt ./
ENV VIRTUAL_ENV=$APES_HOME/venv
RUN python3 -m venv --system-site-packages $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN $VIRTUAL_ENV/bin/pip install -r requirements.txt
CMD ["/bin/bash", "-i"]
