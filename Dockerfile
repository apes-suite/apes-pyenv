FROM debian:bookworm-slim

SHELL ["/bin/bash", "-c"]

ARG ENV_VERSION
ENV ENV_VERSION=${ENV_VERSION}
ENV BASH_ENV=/etc/profile
ENV VIRTUAL_ENV=/opt/apes/venv
ENV PIP_DOWNLOAD_CACHE=${VIRTUAL_ENV}/.pip/cache
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV FC=mpif90

RUN apt update && apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
      build-essential \
      gcc \
      gfortran \
      git \
      libfftw3-dev \
      openmpi-bin openmpi-common libopenmpi-dev \
      pkg-config \
      python3-dev \
      python3-full \
      python3-pip \
      util-linux && \
    useradd apes

COPY requirements.txt /tmp/
RUN python3 -m venv --system-site-packages $VIRTUAL_ENV && \
    $VIRTUAL_ENV/bin/pip install -r /tmp/requirements.txt && rm /tmp/requirements.txt
COPY helper/env-freeze $VIRTUAL_ENV/bin/
