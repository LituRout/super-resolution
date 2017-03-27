FROM nvidia/cuda:8.0-cudnn5-devel

MAINTAINER Patrick Hagerty

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        libcurl3-dev \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python-dev \
        rsync \
        software-properties-common \
        unzip \
        vim \
        wget \ 
        eog \
        zip \
        zlib1g-dev \
        libopencv-dev \
        python-opencv \
        build-essential autoconf libtool libcunit1-dev \
        libproj-dev libgdal-dev libgeos-dev libjson0-dev vim python-gdal \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fSsL -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        scipy \
        sklearn \
        tensorflow-gpu \
        && \
    python -m ipykernel.kernelspec

# Set up our notebook config.
WORKDIR /root

# TensorBoard
RUN ["/bin/bash"]
