(use-modules (gnu) (guix profiles) (hui packages telegram))
(use-package-modules
 image-viewers xdisorg video linux kde-multimedia image wm pdf music)

(define-public %media-packages
  (list
   feh swaybg scrot grim ffmpeg alsa-utils tgs2png k3b
   mupdf zathura zathura-pdf-mupdf cmus))

(packages->manifest %media-packages)
