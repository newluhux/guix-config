(use-modules
 (gnu)
 (hui packages embedded) (hui packages linux)
 (hui services proxy))
(use-service-modules
 networking desktop xorg virtualization docker linux)
(use-package-modules
 tmux screen ssh wm radio embedded rsync shells linux certs curl)

(operating-system
  (host-name "x230")
  (timezone "Hongkong")
  (locale "en_US.utf8")

  (kernel-loadable-modules
   (list
    ch341-i2c-spi-gpio-linux-module))
  (kernel-arguments (list "modprobe.blacklist=dvb_usb_rtl28xxu"))

  (keyboard-layout (keyboard-layout "us" #:options '("ctrl:nocaps")))

  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (targets '("/dev/sdb"))
                (keyboard-layout keyboard-layout)))

  (file-systems (cons* (file-system
                        (device (uuid "d09514ce-dc8d-4ab7-81fd-251a6943dbc8"))
                        (mount-point "/")
                        (type "btrfs"))
                       (file-system
                        (device (uuid "d487d913-7c27-40e4-9acf-06723aad65bd"))
                        (mount-point "/boot")
                        (type "ext2"))
                       %base-file-systems))

  (swap-devices
   (list (swap-space
          (target (uuid "6ff8ce0b-84f5-4b11-a4ed-a92fe9c74a72")))))

  (users (cons (user-account
                (name "luhui")
                (comment "Lu Hui")
                (group "users")
                (shell (file-append zsh "/bin/zsh"))
                (supplementary-groups '("wheel" "dialout" "kvm" "cdrom"
                                        "audio" "video")))
               %base-user-accounts))

  (packages
   (cons*
    tmux screen xinitrc-xsession btrfs-progs rsync singularity
    nss-certs le-certs curl
    %base-packages))

  (services
   (cons*
    (extra-special-file "/bin/zsh" (file-append zsh "/bin/zsh"))
    (extra-special-file "/bin/ps" (file-append procps "/bin/ps"))
    (service clash-service-type
             (clash-configuration
              (config-file "/etc/clash/config.yaml")))
    (service qemu-binfmt-service-type
             (qemu-binfmt-configuration
              (platforms
               (lookup-qemu-platforms
                "arm" "aarch64" "riscv64"))))
    (udev-rules-service 'libsigrok libsigrok)
    (udev-rules-service 'rtl-sdr rtl-sdr)
    (service docker-service-type)
    (service singularity-service-type)
    (set-xorg-configuration
     (xorg-configuration
      (keyboard-layout keyboard-layout))
     gdm-service-type)
    %desktop-services)))
