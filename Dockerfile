FROM debian:bookworm-slim

SHELL ["/bin/bash", "-c"]

ENV BASH_ENV=/etc/profile
ENV VIRTUAL_ENV=/opt/apes/venv
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
      python3-pip

RUN python3 -m venv --system-site-packages $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN $VIRTUAL_ENV/bin/pip install -r requirements.txt
COPY helper/env-freeze $VIRTUAL_ENV/bin/
