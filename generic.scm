(use-modules (gnu))
(use-service-modules networking
                     ssh
                     desktop
                     xorg
                     docker
                     dbus
                     sound
                     virtualization
                     nix)
(use-package-modules certs
                     wm
                     terminals
                     linux
                     ncurses
                     disk
                     tmux
                     code
                     image
                     xdisorg
                     fonts
                     gnuzilla
                     chromium
                     ssh
                     video
                     password-utils
                     gnupg
                     ntp
                     version-control
                     plan9
                     virtualization
                     curl
                     emacs
                     emacs-xyz
                     image-viewers
                     pdf
                     file-systems
                     cdrom
                     package-management
                     rsync
                     compression
                     admin
                     hardware
                     kde-multimedia)

(define-public generic-os
  (operating-system
    (host-name "generic")
    (timezone "UTC")
    (locale "en_US.utf8")
    (keyboard-layout (keyboard-layout "us"
                                      #:options '("ctrl:nocaps")))
    (bootloader (bootloader-configuration
                  (bootloader grub-bootloader)
                  (targets '("/dev/sdX"))))
    (file-systems (cons* (file-system
                           (device "/dev/sdX1")
                           (mount-point "/")
                           (type "ext4")) %base-file-systems))
    (skeletons `((".bashrc" ,(local-file ".bashrc" "bashrc"))
                 (".bash_profile" ,(local-file ".bash_profile" "bash_profile"))
                 (".config/hikari" ,(local-file ".config/hikari" "hikari"
                                                #:recursive? #t))
                 (".config/foot" ,(local-file ".config/foot" "foot"
                                              #:recursive? #t))
                 (".gitconfig" ,(local-file ".gitconfig" "gitconfig"
                                            #:recursive? #t))
                 (".emacs" ,(local-file ".emacs" "emacs"))))

    (users (cons* (user-account
                    (name "luhui")
                    (comment "LuHui")
                    (group "users")
                    (supplementary-groups '("wheel" "audio"
                                            "video"
                                            "seat"
                                            "dialout"
                                            "input"
                                            "cdrom"
                                            "kvm"
                                            "libvirt"
                                            "docker"))) %base-user-accounts))
    (packages (cons* nss-certs
                     hikari
                     foot
                     grim
                     wl-clipboard
                     bemenu
                     font-gnu-unifont
                     font-terminus
                     alsa-utils
                     ncurses
                     btrfs-progs
                     dosfstools
                     rsync
                     curl
                     openssh
                     dropbear
                     tmux
                     picocom
                     cscope
                     ungoogled-chromium/wayland
                     icecat
                     ffmpeg
                     libva
                     intel-vaapi-driver
                     password-store
                     gnupg
                     pinentry-tty
                     powertop
                     ntp
                     mosh
                     git
                     singularity
                     drawterm
                     virt-manager
                     emacs
                     emacs-telega
                     emacs-rime
                     imv
                     mupdf
                     k3b
                     cdrtools
                     dvd+rw-tools
                     udftools
                     nix
                     squashfs-tools-ng
                     stress-ng
                     memtester
                     powertop
                     cpupower
                     %base-packages))
    (services
     (cons* (service dhcp-client-service-type)
            (service tor-service-type)
            (service gpm-service-type)
            (service seatd-service-type)
            (service alsa-service-type)
            (service pulseaudio-service-type)
            (screen-locker-service hikari "hikari-unlocker")
            (service libvirt-service-type)
            (service virtlog-service-type)
            (service docker-service-type)
            (service singularity-service-type)
            (service nix-service-type)
            (dbus-service)
            (udisks-service)
            (service qemu-binfmt-service-type
                     (qemu-binfmt-configuration (platforms (lookup-qemu-platforms
                                                            "arm"
                                                            "aarch64"
                                                            "mipsel"
                                                            "mips64el"
                                                            "riscv"
                                                            "riscv64"
                                                            "powerpc"
                                                            "powerpc64"))))
            %base-services))))

generic-os
