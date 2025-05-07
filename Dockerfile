FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install build tools and deps
RUN apt-get update && apt-get install -y \
    bison build-essential cmake flex git libedit-dev \
    libllvm14 llvm-14-dev libclang-14-dev python3-distutils \
    zlib1g-dev libelf-dev libfl-dev clang gcc-multilib \
    iproute2 python3-pip curl wget ca-certificates \
    --no-install-recommends && apt-get clean

# Install BCC from source
RUN git clone --recursive https://github.com/iovisor/bcc.git /opt/bcc && \
    cd /opt/bcc && \
    mkdir build && cd build && \
    cmake .. && make -j$(nproc) && make install && cmake -DPYTHON_CMD=python3 .. && make -C src/python install

# Optional: Clean up
RUN rm -rf /opt/bcc

# Copy your BCC Python script
COPY supplychain-detect.py /app/supplychain-detect.py
WORKDIR /app

CMD ["python3", "supplychain-detect.py"]
