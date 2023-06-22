(use-modules (gnu) (guix profiles) (hui packages wm))
(use-package-modules xorg wm xdisorg qt kde-frameworks terminals)


(define-public %graphic-packages
  (list
   dwl-hui foot bemenu wl-clipboard
   xset xsetroot xkbset xrdb xkill xclip
   qt5ct breeze-icons))

(packages->manifest %graphic-packages)
