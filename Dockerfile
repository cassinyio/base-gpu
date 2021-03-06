# Copyright (c) 2017, Cassiny.io OÜ
# Distributed under the terms of the Modified BSD License.

# https://hub.docker.com/r/nvidia/cuda/
FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04

LABEL maintainer "wow@cassiny.io"

USER root

# Export env settings
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Update and install needed libraries
RUN apt-get -yq update && \
    apt-get -yq --no-install-recommends upgrade && \
    apt-get -yq --no-install-recommends install \
    apt-utils \
    build-essential \
    unzip \
    bzip2 \
    wget \
    git \
    ca-certificates \
    locales \
    fonts-liberation && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen
