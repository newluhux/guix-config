(use-modules (guix profiles) (hui packages embedded))

(define-public %mipsel-toolchain
  (list
   gcc-mipsel-elf-toolchain
   gdb-mipsel-elf))

(packages->manifest
 %mipsel-toolchain)
