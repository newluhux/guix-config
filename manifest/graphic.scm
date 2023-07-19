(use-modules (gnu) (guix profiles) (hui packages wm))
(use-package-modules xorg wm xdisorg qt kde-frameworks terminals disk kde-systemtools)


(define-public %graphic-packages
  (list
   cwm rofi konsole xset xsetroot xkbset xrdb xkill xclip xhost
   qt5ct breeze-icons xfe))

(packages->manifest %graphic-packages)
