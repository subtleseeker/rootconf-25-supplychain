FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install base tools
RUN apt-get update && apt-get install -y \
    curl gnupg lsb-release ca-certificates

# Add BCC repo for focal (Ubuntu 20.04)
RUN echo "deb [trusted=yes] https://repo.iovisor.org/apt focal main" > /etc/apt/sources.list.d/iovisor.list

# Install BCC and Python bindings
RUN apt-get update && apt-get install -y \
    python3-bcc \
    bpfcc-tools \
    python3-pip \
    iproute2 \
    git \
    --no-install-recommends && apt-get clean

# Copy your Python eBPF script
COPY supplychain-detect.py /app/supplychain-detect.py
WORKDIR /app

CMD ["python3", "supplychain-detect.py"]
