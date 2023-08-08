(use-modules (gnu) (guix profiles) (hui packages embedded))
(use-package-modules ssh terminals admin screen tmux networking virtualization
                     linux bittorrent engineering)

(define-public %connect-packages
  (list
   openssh picocom lrzsz ek eksw screen tmux iperf ckermit gkermit ukermit
   putty virt-manager usbip-utils bluez qbittorrent minicom))

(packages->manifest %connect-packages)
