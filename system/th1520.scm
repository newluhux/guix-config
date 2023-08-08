(use-modules
 (gnu)
 (gnu bootloader u-boot)
 (hui packages linux))
(use-service-modules
 networking ssh linux)
(use-package-modules
 certs tmux ssh curl admin networking linux rsync terminals
 ncurses)

(operating-system
  (host-name "th1520")
  (timezone "Hongkong")
  (locale "en_US.utf8")
  (kernel linux-thead)
  (kernel-arguments (list "console=ttyS0,115200"))
  (initrd-modules (list))
  (firmware (list))
  ;; just generate a extlinux config file
  (bootloader (bootloader-configuration
               (bootloader u-boot-bootloader)
               (targets '("/dev/null"))))
  (file-systems (cons (file-system
                        (device (file-system-label "lpi4a-root"))
                        (mount-point "/")
                        (type "ext4"))
                      %base-file-systems))
  (users (cons (user-account
                (name "luhui")
                (comment "Lu Hui")
                (group "users")
                (supplementary-groups '("wheel" "audio" "video")))
               %base-user-accounts))
  (packages
   (append
    (list nss-certs le-certs tmux curl htop openssh sshfs rsync
          iperf lrzsz picocom tcpdump ncurses)
    %base-packages))
  (services
   (append
    (list
     (service openssh-service-type)
     (service dhcp-client-service-type)
     (service agetty-service-type
              (agetty-configuration
               (extra-options '("-L"))
               (baud-rate "115200")
               (term "vt100")
               (tty "ttyS0"))))
    %base-services)))
