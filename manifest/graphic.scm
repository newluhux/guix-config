(use-modules (gnu) (guix profiles) (hui packages wm) (hui packages wallpaper))
(use-package-modules xorg wm xdisorg qt kde-frameworks terminals disk kde-systemtools gnome ocr dunst conky fcitx5)


(define-public %graphic-packages
  (list
   cwm vte sakura xset xsetroot xkbset xrdb xkill xclip xhost
   qt5ct breeze-icons tesseract-ocr setxkbmap libnotify dunst
   freedom-wallpaper conky fcitx5 fcitx5-rime fcitx5-gtk fcitx5-qt
   fcitx5-gtk4 fcitx5-configtool))

(packages->manifest %graphic-packages)
