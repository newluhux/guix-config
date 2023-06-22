(use-modules
 (gnu home)
 (gnu home services)
 (gnu home services shells)
 (gnu services)
 (guix gexp))

(load "../manifest/x230.scm")

(home-environment
 (packages %x230-packages)
 (services
  (list
   (service home-zsh-service-type
            (home-zsh-configuration
             (environment-variables
              '(("PAGER" . "less")
                ("EDITOR" . "ec")
                ("XKB_DEFAULT_LAYOUT" . "us")
                ("XKB_DEFAULT_OPTIONS" . "ctrl:nocaps")))
             (zshrc
              (list (local-file ".zshrc" "zshrc")))))

   (simple-service 'my-config-file
                   home-files-service-type
                   `((".emacs" ,(local-file ".emacs" "emacs"))
                     (".clang-format" ,(local-file ".clang-format"
						   "clang-format"))
                     (".config/foot/foot.ini"
                      ,(local-file ".config/foot/foot.ini"
				   "foot.ini"))
                     (".putty/sessions/Default%20Settings"
                      ,(local-file
                        ".putty/sessions/Default%20Settings" "puttyrc"))
                     ("bin/startup" ,(local-file "bin/startup" #:recursive? #t))
                     ("bin/ec" ,(local-file "bin/ec" #:recursive? #t)))))))

