(use-modules (gnu) (guix profiles) (hui packages dict))

(define-public %dict-packages
  (list ))

(packages->manifest %dict-packages)
