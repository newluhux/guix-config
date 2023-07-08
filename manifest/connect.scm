(use-modules (gnu) (guix profiles) (hui packages embedded))
(use-package-modules ssh terminals admin screen tmux networking virtualization
                     linux)

(define-public %connect-packages
  (list
   openssh picocom lrzsz ek eksw screen tmux iperf
   putty virt-manager usbip-utils))

(packages->manifest %connect-packages)
