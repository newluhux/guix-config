(use-modules (gnu) (guix profiles) (hui packages wm))
(use-package-modules xorg wm xdisorg qt kde-frameworks terminals)


(define-public %graphic-packages
  (list
   cwm sakura xset xsetroot xkbset xrdb xkill xclip xhost
   qt5ct breeze-icons))

(packages->manifest %graphic-packages)
