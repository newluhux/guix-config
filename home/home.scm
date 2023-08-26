(use-modules
 (gnu home)
 (gnu home services)
 (gnu home services shells)
 (gnu services)
 (guix gexp))

(load "../manifest/luhui.scm")

(home-environment
 (packages %luhui-packages)
 (services
  (list
   (service home-zsh-service-type
            (home-zsh-configuration
             (environment-variables
              '(("PAGER" . "less")
                ("EDITOR" . "editor")
                ("XKB_DEFAULT_LAYOUT" . "us")
                ("XKB_DEFAULT_OPTIONS" . "ctrl:nocaps")))
             (zshrc (list (local-file ".zshrc" "zshrc")))))

   (simple-service 'my-config-file
                   home-files-service-type
                   `((".emacs" ,(local-file ".emacs" "emacs"))
                     (".zprofile" ,(local-file ".zprofile" "zprofile"))
                     (".zshrc" ,(local-file ".zshrc" "zshrc"))
                     (".cwmrc" ,(local-file ".cwmrc" "cwmrc"))
                     (".xinitrc" ,(local-file ".xinitrc" "xinitrc"
                                                #:recursive? #t))
                     (".clang-format" ,(local-file ".clang-format"
						   "clang-format"))
                     (".config/sakura/sakura.conf"
                      ,(local-file ".config/sakura/sakura.conf"
				   "sakura.conf"))
                     ("bin/terminal" ,(local-file "bin/terminal"
                                                #:recursive? #t))
                     ("bin/editor" ,(local-file "bin/editor"
                                                #:recursive? #t))))
   (simple-service 'ccache-setup
                   home-files-service-type
                   `(("bin/gcc" ,(file-append ccache "/bin/ccache"))
                     ("bin/c++" ,(file-append ccache "/bin/ccache"))
                     ("bin/g++" ,(file-append ccache "/bin/ccache")))))))

