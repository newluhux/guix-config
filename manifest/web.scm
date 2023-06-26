(use-modules (gnu) (guix profiles) (nongnu packages chrome))
(use-package-modules gnuzilla chromium web-browsers w3m curl)

(define-public %web-packages
  (list icecat ungoogled-chromium w3m links lynx curl
        google-chrome-stable))

(packages->manifest %web-packages)
