;; Emacs's environment

(normal-top-level-add-subdirs-to-load-path)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; (setenv "LD_LIBRARY_PATH" (concat "/usr/local/lib/:/opt/local/lib/" (getenv "LD_LIBRARY_PATH")))
(setenv "PYTHONPATH" (concat (getenv "PYTHONPATH") ":~/.emacs.d/"))

(setenv "SCIPY_PIL_IMAGE_VIEWER" "feh")

;; for asdf load path
;; (setenv "CL_SOURCE_REGISTRY" (concat "~/Courses/Paradigms of AI Programming:"
;;                                      "~/repos/ITA-Rebus"))

;; for java
(setenv "JAVA_HOME" "/usr/java/default")
