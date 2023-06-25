(use-modules (gnu) (guix profiles)
 (hui packages embedded)
 (hui packages engineering))
(use-package-modules
 man linux elf code version-control gdb embedded qt bash
 engineering android admin build-tools cmake haskell-apps
 java ccache file hexedit bison flex hexedit scheme python-xyz
 bootloaders llvm wine license disk shells shellutils glib
 gtk spice attr xdisorg gl image containers libusb ncurses firmware
 pulseaudio sdl networking compression gettext ninja perl pkg-config
 python sphinx texinfo pcre virtualization)

(define-public %qemu-dev-packages
  (list
   bash-minimal dtc glib gtk+
   ipxe-qemu
   libaio
   libcacard                    ;smartcard support
   attr libcap-ng               ;VirtFS support
   libdrm
   libepoxy
   libjpeg-turbo
   libpng
   libseccomp
   libslirp
   liburing
   libusb                       ;USB pass-through support
   mesa
   ncurses
   openbios-qemu-ppc
   opensbi-qemu
   ;; ("pciutils" ,pciutils)
   pixman
   pulseaudio
   sdl2
   seabios-qemu
   sgabios
   spice
   usbredir
   util-linux
   vde2
   virglrenderer

   ;; Formats to support for .qcow2 (and possibly other) compression.
   zlib
   (list zstd "lib")
   acpica
   bison
   flex
   gettext-minimal
   (list glib "bin")               ;gtester, etc.
   meson
   ninja
   perl
   pkg-config
   python-wrapper
   python-sphinx
   python-sphinx-rtd-theme
   texinfo
   ;; The following static libraries are required to build
   ;; the static output of QEMU.
   (list glib "static")
   (list pcre "static")
   (list zlib "static")))

(define-public %develop-packages
  (append 
   (list
    (list glibc "static") mandoc man-pages
    linux-libre-headers patchelf qt-creator
    gdb clang-toolchain cscope indent
    git gnu-make adb fastboot xfel shellcheck
    openocd blisp bear openixcard
    python-extract-dtb cmake cutter-rizin
    rizin (list openjdk "jdk") abootimg
    binwalk strace ltrace perf ccache file
    bvi bison flex dtc u-boot-tools pluseview hexedit
    ufbterm wine64 licensecheck mtd-utils bmaptools
    zsh zsh-completions sicp i2c-tools qemu)
   %qemu-dev-packages))


(packages->manifest %develop-packages)
