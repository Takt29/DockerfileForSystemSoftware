FROM ubuntu:latest

SHELL ["/bin/bash", "-c"]

WORKDIR /root

RUN apt update
RUN apt install -y autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev git make

RUN git clone --recursive https://github.com/riscv/riscv-gnu-toolchain
RUN cd riscv-gnu-toolchain &&  ./configure --prefix=/usr/local && make install

RUN apt install -y wget
RUN wget https://download.qemu.org/qemu-4.1.0.tar.xz && tar xf qemu-4.1.0.tar.xz

RUN apt install -y python3 pkg-config
RUN apt install -y build-essential zlib1g-dev pkg-config libglib2.0-dev binutils-dev libboost-all-dev autoconf libtool libssl-dev libpixman-1-dev libpython-dev python-pip python-capstone virtualenv
RUN cd qemu-4.1.0 && ./configure --disable-kvm --disable-werror --prefix=/usr/local --target-list="riscv64-softmmu" && make && make install
