;; ===============================
;; Tramp configuration
;; ===============================

;; (add-to-list 'load-path "~/.emacs.d/tramp")
(require 'tramp)
;; (setq tramp-verbose 10)

;; remote path
;; (add-to-list 'tramp-remote-path "/sbin/")
;; (add-to-list 'tramp-remote-path "/usr/local/opt/python/current/bin")
;; (add-to-list 'tramp-remote-process-environment "JAVA_HOME=/opt/java")

;; Running remote programs that create local X11 windows
;; (add-to-list 'tramp-remote-process-envirmonment
;;              (format "DISPLAY=%s" (getenv "DISPLAY")))

(setq password-cache-expiry nil)

(if (>= emacs-major-version 23)
    (progn
      (message "Load tramp config for Emacs %d.%d" emacs-major-version emacs-minor-version)
      (setq tramp-default-method "rsync")
      (setq tramp-encoding-shell "/bin/bash"))
    (progn   ;; else, for emacs 22
      (message "Load old tramp config for Emacs %d.%d" emacs-major-version emacs-minor-version)
      (eval-after-load "tramp"
        '(progn
          (setq tramp-default-user "zcai")
          (setq tramp-default-method "ssh")
          (add-to-list 'tramp-methods
           '("ssh"
             (tramp-connection-function tramp-open-connection-rsh)
             (tramp-login-program "ssh")
             (tramp-copy-program nil)
             (tramp-remote-sh "/bin/bash")
             (tramp-login-args ("-e" "none"))
             (tramp-copy-args nil)
             (tramp-copy-keep-date-arg nil)
             (tramp-password-end-of-line nil)))))))
