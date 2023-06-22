(use-modules (gnu) (guix profiles))


(define load-list
  (list
   "archive.scm"
   "connect.scm"
   "develop.scm"
   "dict.scm"
   "emacs.scm"
   "media.scm"
   "font.scm"
   "game.scm"
   "monitor.scm"
   "radio.scm"
   "security.scm"
   "proxy.scm"
   "graphic.scm"
   "script.scm"
   "terminal.scm"
   "web.scm"))

(map load load-list)

(define-public %x230-packages
  (append
   %archive-packages
   %connect-packages
   %develop-packages
   %dict-packages
   %emacs-packages
   %font-packages
   %media-packages
   %monitor-packages
   %game-packages
   %radio-packages
   %security-packages
   %graphic-packages
   %proxy-packages
   %script-packages
   %terminal-packages
   %web-packages))

(packages->manifest %x230-packages)
