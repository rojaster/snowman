FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -qy \
    python3 \
    python3-pip \
    build-essential \
    cmake \
    libboost-dev \
    qt5-default \
    git

COPY . /snowman

WORKDIR /snowman

RUN mkdir -p build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/opt/snowman ../src \
    && make -j$(nproc) install
