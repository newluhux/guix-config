(use-modules (gnu) (guix profiles))
(use-package-modules emacs emacs-xyz)

(define-public %emacs-packages
  (list
   emacs-next
   emacs-rime emacs-telega emacs-magit emacs-ivy
   emacs-dts-mode))

(packages->manifest %emacs-packages)
