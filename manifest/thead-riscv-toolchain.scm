(use-modules (guix profiles) (hui packages embedded))

(define-public %thead-riscv-toolchain
  (list
   thead-riscv64-unknown-elf-toolchain))
   

(packages->manifest
 %thead-riscv-toolchain)
