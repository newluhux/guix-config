(use-modules (gnu) (guix profiles))
(use-package-modules xorg wm xdisorg qt kde-frameworks terminals)


(define-public %graphic-packages
  (list
   dwl foot bemenu wl-clipboard
   xset xsetroot xkbset xrdb xkill xclip
   qt5ct breeze-icons))

(packages->manifest %graphic-packages)
