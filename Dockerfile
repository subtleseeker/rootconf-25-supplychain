FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Add BCC official APT repository
RUN apt-get update && apt-get install -y \
    curl gnupg ca-certificates lsb-release && \
    echo "deb [trusted=yes] https://repo.iovisor.org/apt jammy main" | tee /etc/apt/sources.list.d/iovisor.list

# Install BCC and dependencies
RUN apt-get update && apt-get install -y \
    python3-bcc \
    bpfcc-tools \
    python3-pip \
    iproute2 \
    git \
    --no-install-recommends && \
    apt-get clean

COPY supplychain-detect.py /app/supplychain-detect.py
WORKDIR /app

CMD ["python3", "supplychain-detect.py"]
