FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl gnupg lsb-release ca-certificates

# Add BCC official repo
RUN echo "deb [trusted=yes] https://repo.iovisor.org/apt focal main" | tee /etc/apt/sources.list.d/iovisor.list

# Update with BCC repo and install packages
RUN apt-get update && apt-get install -y \
    bpfcc-tools \
    python3-bcc \
    python3-pip \
    git \
    iproute2 \
    gcc \
    make \
    clang \
    libelf-dev \
    libpcap-dev \
    zlib1g-dev \
    llvm \
    libclang-dev \
    --no-install-recommends && apt-get clean

COPY supplychain-detect.py /app/supplychain-detect.py

WORKDIR /app

CMD ["python3", "supplychain-detect.py"]
