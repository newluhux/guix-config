FROM fedora:latest

ENV DEBIAN_FRONTEND noninteractive

RUN dnf update -y && \
    dnf install -y \
    bc bison bzip2 ca-certificates ccache clang cmake cpio curl cvs diffutils \
    file findutils flex gawk gcc gettext git gkermit grep gzip lrzsz mercurial \
    python2 rsync screen sed subversion swig tar time tmux chrpath util-linux \
    wget  python3 diffstat lz4 gcc-g++ unzip xsltproc xz zstd less binwalk \
    ckermit neovim cscope openssh dropbear sparse indent gnupg bison zip curl \
    ncurses xsltproc unzip fontconfig lzma repo patch arm-none-eabi-gcc-cs \
    binutils-arm-linux-gnu gcc-arm-linux-gnu gcc-c++-arm-linux-gnu perl \
    gcc-riscv64-linux-gnu gcc-c++-riscv64-linux-gnu binutils-riscv64-linux-gnu \
    ncurses-devel

RUN rm -r /var/cache/ccache
