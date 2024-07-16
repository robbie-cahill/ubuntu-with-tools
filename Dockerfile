FROM ubuntu:24.04
RUN apt-get update
RUN apt-get install -y \
    vim \
    git \
    curl \
    git \
    nodejs \
    npm \
    bzip2 \
    gzip \
    jq 
    
RUN adduser ubuntu sudo    

USER ubuntu

WORKDIR /home/ubuntu