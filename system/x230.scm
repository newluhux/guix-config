(use-modules
 (gnu)
 (gnu system nss)
 (guix utils)
 (hui packages embedded)
 (hui services proxy)
 (hui services games)
 (hui packages linux)
 (hui packages proxy))
(use-service-modules desktop xorg virtualization docker sddm networking linux
                     dns)
(use-package-modules certs linux gnome wm radio admin embedded rsync shells)


(operating-system
  (kernel-loadable-modules
   (list
    ch341-i2c-spi-gpio-linux-module))
  (kernel-arguments (list "modprobe.blacklist=dvb_usb_rtl28xxu"))

  (host-name "x230")
  (timezone "Hongkong")
  (locale "en_US.utf8")

  (keyboard-layout (keyboard-layout "us" #:options '("ctrl:nocaps")))

  (bootloader (bootloader-configuration
               (bootloader grub-bootloader)
               (targets '("/dev/sda"))
               (keyboard-layout keyboard-layout)))

  (file-systems (append
                 (list (file-system
                         (device (uuid "d3b00ed3-660d-48c5-92ea-aa1e883bb02f"))
                         (mount-point "/")
                         (type "btrfs"))
                       (file-system
                         (device (uuid "0E88-577E" 'fat))
                         (mount-point "/sdcard")
                         (type "vfat")))
                 %base-file-systems))

  (swap-devices (list (swap-space
                       (target "/swapfile"))))

  (users (cons (user-account
                (name "luhui")
                (comment "Lu Hui")
                (group "users")
                (shell (file-append zsh "/bin/zsh"))
                (supplementary-groups '("wheel" "netdev" "cdrom" "docker"
                                        "audio" "video" "dialout" "kvm")))
               %base-user-accounts))

  (packages
   (append
    (list
     nss-certs le-certs
     singularity
     rsync
     btrfs-progs)
    %base-packages))

  (services
   (cons*
    (service minetest-service-type)
    (service clash-service-type
             (clash-configuration
              (config-file "/etc/clash/config.yaml")))
    (service docker-service-type)
    (service singularity-service-type)
    (service qemu-binfmt-service-type
             (qemu-binfmt-configuration
              (platforms
               (lookup-qemu-platforms
                "arm" "aarch64" "riscv64"))))
    (udev-rules-service 'libsigrok libsigrok)
    (udev-rules-service 'rtl-sdr rtl-sdr)
    (udev-rules-service 'xfel xfel)
    (udev-rules-service 'openocd openocd)
    (service tor-service-type
             (tor-configuration
              (config-file (plain-file "tor-config"
                                       "Socks5Proxy 127.0.0.1:7891\n"))))
    (service dnsmasq-service-type
             (dnsmasq-configuration
              (tftp-enable? #t)
              (tftp-root "/share")))
    (service zram-device-service-type
             (zram-device-configuration
              (size "2G")
              (compression-algorithm 'zstd)
              (priority 100)))
    (modify-services %desktop-services
      (delete gdm-service-type)
      (guix-service-type
       config =>
       (guix-configuration
        (inherit config)
        (substitute-urls
         (append (list "https://mirrors.sjtug.sjtu.edu.cn/guix")
                 %default-substitute-urls))))
      (elogind-service-type
       config =>
       (elogind-configuration
        (handle-lid-switch 'ignore))))))

  (name-service-switch %mdns-host-lookup-nss))
