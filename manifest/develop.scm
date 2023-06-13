(use-modules (gnu) (guix profiles)
 (hui packages embedded)
 (hui packages engineering))
(use-package-modules
 man linux elf code version-control gdb embedded
 engineering android admin build-tools cmake haskell-apps
 java ccache file hexedit bison flex hexedit scheme python-xyz
 bootloaders llvm wine license disk shells shellutils)

(define-public %develop-packages
  (list
   (list glibc "static") mandoc man-pages
   linux-libre-headers patchelf
   gdb clang-toolchain cscope indent
   git gnu-make adb fastboot xfel shellcheck
   openocd blisp bear openixcard
   python-extract-dtb cmake cutter-rizin
   rizin (list openjdk "jdk") abootimg
   binwalk strace ltrace perf ccache file
   bvi bison flex dtc u-boot-tools pluseview hexedit
   ufbterm wine64 licensecheck mtd-utils bmaptools
   zsh zsh-completions sicp))

(packages->manifest %develop-packages)
