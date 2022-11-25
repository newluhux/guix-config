(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(load-theme 'modus-operandi)
(add-to-list 'default-frame-alist
             '(font . "Terminus-8"))
(setq warning-suppress-types '((comp)))

(setq default-input-method 'rime)
