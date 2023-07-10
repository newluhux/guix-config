(use-modules (gnu) (guix profiles))
(use-package-modules python guile scheme)

(define-public %script-packages
  (list python guile-3.0 s9fes))

(packages->manifest %script-packages)
