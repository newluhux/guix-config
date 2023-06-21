(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; performance
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil)

;; font
(add-to-list 'default-frame-alist '(font . "unifont-10"))

;; theme
(load-theme 'modus-operandi)

;; disable startup interface
(setq inhibit-startup-screen t)

;; disable some bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; ivy mode
(ivy-mode 1)

;; my blog
(require 'ox-publish)
(defvar blog-path (concat (getenv "HOME") "/work/blog"))
(defvar blog-base-directory (concat blog-path "/org/"))
(defvar blog-publishing-directory (concat blog-path "/"))

(setq org-html-metadata-timestamp-format "%Y-%m-%d")
(setq
 org-publish-project-alist
 `(("blog"
    :base-extension "org"
    :base-directory ,blog-base-directory
    :publishing-directory ,blog-publishing-directory
    :publishing-function org-html-publish-to-html
    :recursive t

    ;; Disable some defaults
    :html-link-home ""
    :html-link-up ""
    :html-head-include-default-style nil
    :html-head-include-scripts nil
    :html-preamble nil
    :html-postamble nil

    ;; Custom options
    :headline-levels 4
    :language "en"
    :html-html5-fancy t
    :with-date t
    :with-emphasize t              ; *:t
    :with-smart-quotes t           ; *:t
    :with-sub-superscript nil      ; ^:nil
    :with-toc nil                  ; toc:nil
    :section-numbers nil           ; num:nil
    :html-postamble "<p>Last updated: %C</p>"
    :html-wrap-src-lines t)))

;; telegram
(setq telega-proxies
      (list
       '(:server "127.0.0.1" :port 7891 :enable t
                 :type (:@type "proxyTypeSocks5"))))

;; code style
(setq c-default-style "linux")

;; lsp mode
(setq lsp-keymap-prefix "s-l")
(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp)
(setq lsp-idle-delay 0.1)

;; company mode
(setq company-idle-delay 0.0
      company-minimum-prefix-length 2)
(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'c-mode-hook #'company-mode)
(add-hook 'lisp-mode-hook #'company-mode)
(add-hook 'scheme-mode-hook #'company-mode)

;; yasnippet
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'c-mode-hook #'yas-minor-mode)
(add-hook 'lisp-mode-hook #'yas-minor-mode)
(add-hook 'scheme-mode-hook #'yas-minor-mode)

;; GNU Guix
(with-eval-after-load 'geiser-guile
 (add-to-list 'geiser-guile-load-path "~/src/guix"))
(with-eval-after-load 'yasnippet
 (add-to-list 'yas-snippet-dirs "~/src/guix/etc/snippets/yas"))
