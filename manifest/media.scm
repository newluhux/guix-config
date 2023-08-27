(use-modules (gnu) (guix profiles))
(use-package-modules 
 image-viewers xdisorg video linux kde-multimedia image wm pdf music telegram)

(define-public %media-packages
  (list
   feh swaybg scrot grim ffmpeg alsa-utils tgs2png k3b
   mupdf zathura zathura-pdf-mupdf cmus))

(packages->manifest %media-packages)
