;; Emacs's environment

(normal-top-level-add-subdirs-to-load-path)

;; old way to get env PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH' 2>/dev/null")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when (memq window-system '(x mac ns))
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "JAVA_HOME" "CLASSPATH"))
  (exec-path-from-shell-initialize))

(setenv "PATH" (concat "~/anaconda3/bin:" (getenv "PATH")))

;; (setenv "LD_LIBRARY_PATH" (concat "/usr/local/lib/:/opt/local/lib/" (getenv "LD_LIBRARY_PATH")))
(setenv "PYTHONPATH" (concat (getenv "PYTHONPATH") ":~/.emacs.d/"))

(setenv "SCIPY_PIL_IMAGE_VIEWER" "feh")

;; for asdf load path
;; (setenv "CL_SOURCE_REGISTRY" (concat "~/Courses/Paradigms of AI Programming:"
;;                                      "~/repos/ITA-Rebus"))

;; ;; Java
;; (cond ((string= system-type "gnu/linux")
;;        (setenv "JAVA_HOME" "/usr/java/default"))
;;       ((string= system-type "darwin")
;;        (setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/jdk/Contents/Home")))
