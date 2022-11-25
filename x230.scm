(use-modules (gnu))
(load "generic.scm")
(define x230-os
  (operating-system
   (inherit generic-os)
   (host-name "x230")
   (bootloader (bootloader-configuration
		(bootloader grub-bootloader)
		(targets '("/dev/sdb"))))
   (file-systems (cons* (file-system
			 (device (uuid "20864681-98ff-4f29-af3e-6adefa8458aa"))
			 (mount-point "/")
			 (type "btrfs")
			 (options "compress=zstd"))
			(file-system
			 (device (uuid "804d55b3-be92-4f12-bbd9-8f1aaba764f9"))
			 (mount-point "/vm")
			 (type "btrfs")
			 (options "compress=zstd")) %base-file-systems))
   (swap-devices
    (list (swap-space
	   (target (uuid "0aeb6ada-6450-4084-a1c1-a4f97257aea2")))
	  (swap-space
	   (target (uuid "5cf101bb-564a-46a9-b9b8-57c19cda2772")))))))

x230-os
