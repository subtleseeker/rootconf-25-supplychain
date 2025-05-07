FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bpfcc-tools \
    linux-headers-$(uname -r) \
    python3-pip \
    python3-bcc \
    curl \
    git \
    iproute2 \
    gcc \
    make \
    clang \
    libbpf-dev \
    libelf-dev \
    libpcap-dev \
    llvm \
    zlib1g-dev \
    libclang-dev \
    --no-install-recommends && \
    apt-get clean

COPY tracer.py /app/supplychain-detect.py

WORKDIR /app

CMD ["python3", "supplychain-detect.py"]
