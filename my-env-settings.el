
;; Emacs's environment 
(setenv "PATH" (concat "~/Installed/bin:"
                       "/opt/local/bin:"
                       "/usr/texbin:"
                       "/usr/local/cuda/bin:"
                       "/usr/local/bin:"
                       "~/Racket/bin:"
                       "/opt/local/libexec/git-core:"
                       "~/.lein/bin/:"
                       (getenv "PATH")))

;; (setenv "LD_LIBRARY_PATH" (concat "/usr/local/lib/:/opt/local/lib/" (getenv "LD_LIBRARY_PATH")))
(setenv "PYTHONPATH" (concat (getenv "PYTHONPATH")
                             ":~/.emacs.d/"))

(setenv "SCIPY_PIL_IMAGE_VIEWER" "feh")

;; (setenv "PATH" (concat "/usr/local/opt/python/current/:"
;;                        (getenv "PATH")))

;; for asdf load path
;; (setenv "CL_SOURCE_REGISTRY" (concat "~/Courses/Paradigms of AI Programming:"
;;                                      "~/repos/ITA-Rebus"))
