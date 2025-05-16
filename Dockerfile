FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    libelf-dev \
    clang \
    llvm \
    iproute2 \
    git \
    bpfcc-tools \
    --no-install-recommends && apt-get clean

RUN pip3 install bcc requests

COPY supplychain-detect.py /app/supplychain-detect.py
WORKDIR /app

CMD ["python3", "openat.py"]
