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
    ncurses-devel python3-pip python3-wheel python3-setuptools dtc libfdt-devel\
    uboot-tools python2-devel python3-devel make glibc-devel cpp texinfo \
    perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum \
    socat python3-pexpect which cpio python3-GitPython python3-jinja2 SDL-devel\
    rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare perl-File-Copy \
    perl-locale hostname glibc-langpack-en openssl-devel elfutils-libelf-devel \
    elfutils-devel elfutils python3-libfdt python3-pyelftools lzop gnutls-devel\
    xxd android-tools bmap-tools parted kmod mtools openocd gdb llvm \
    libserialport-devel pulseview qt-creator qt-creator-doc \
    clang-tools-extra graphviz mandoc man-pages kernel-headers \
    perf valgrind glibc-static glibc-utils


RUN rm -r /var/cache/ccache
