(use-modules (gnu) (guix profiles) (hui packages font))
(use-package-modules fonts fontutils)

(define-public %font-packages
  (list
   fontconfig font-unscii font-terminus font-gnu-unifont font-google-noto-emoji
   font-dejavu font-wqy-microhei))

(packages->manifest %font-packages)
