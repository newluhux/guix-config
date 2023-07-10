(use-modules (gnu) (guix profiles))
(use-package-modules algebra bash gawk shells linux compression man)

(define-public %aaa-base-packages
 (list
  zsh bash bc coreutils util-linux gawk psmisc tar grep sed gzip xz zstd
  bzip2 procps mandoc))

(packages->manifest %aaa-base-packages)
