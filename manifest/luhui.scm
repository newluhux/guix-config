(use-modules (gnu) (guix profiles))


(define load-list
  (list
   "aaa-base.scm"
   "archive.scm"
   "connect.scm"
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
   "web.scm"
   "zzz-develop.scm"))

(map load load-list)

(define-public %luhui-packages
  (append
   %aaa-base-packages
   %archive-packages
   %connect-packages
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
   %web-packages
   %zzz-develop-packages))

(packages->manifest %luhui-packages)
