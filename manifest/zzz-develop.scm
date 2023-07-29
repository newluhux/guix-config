(use-modules (gnu) (guix profiles)
 (hui packages embedded)
 (hui packages engineering))
(use-package-modules
 man linux elf code version-control gdb embedded qt bash engineering android
 admin build-tools cmake haskell-apps java ccache file hexedit bison flex
 hexedit scheme python-xyz bootloaders llvm wine license disk shells shellutils
 glib gtk spice attr xdisorg gl image containers libusb ncurses firmware
 pulseaudio sdl networking compression gettext ninja perl pkg-config python
 sphinx texinfo pcre virtualization algebra pciutils plan9 commencement
 gawk forth)

(define-public %qemu-dev-packages
  (list
   bash-minimal dtc glib gtk+ ipxe-qemu libaio libcacard
   attr libcap-ng libdrm libepoxy libjpeg-turbo libpng libseccomp
   libslirp liburing libusb mesa ncurses openbios-qemu-ppc opensbi-qemu
   pciutils pixman pulseaudio sdl2 seabios-qemu sgabios spice usbredir
   util-linux vde2 virglrenderer zlib (list zstd "lib") acpica bison flex
   gettext-minimal (list glib "bin") meson ninja perl pkg-config python-wrapper
   python-sphinx python-sphinx-rtd-theme texinfo
   (list glib "static") (list pcre "static") (list zlib "static")))

(define-public %qt-dev-packages
  (list
   qttools qttranslations qt5compat qtbase qtsvg qtdeclarative qtshadertools
   qtsvg))

(define-public %zzz-develop-packages
  (append 
   %qemu-dev-packages %qt-dev-packages
   (list
    (list glibc "static") linux-libre-headers indent git gnu-make adb
    mandoc man-pages sicp patchelf qt-creator gdb gcc-toolchain cscope
    fastboot xfel shellcheck blisp bear openixcard python-extract-dtb cmake
    (list openjdk "jdk") abootimg binwalk strace ltrace perf ccache file bvi
    bison flex dtc u-boot-tools pluseview-next hexedit wine64 licensecheck
    mtd-utils bmaptools zsh-completions i2c-tools qemu gforth)))

(packages->manifest %zzz-develop-packages)
