;; ===============================
;; Tramp configuration
;; ===============================

(require 'tramp)
(setq tramp-verbose 10)

;; remote path
(add-to-list 'tramp-remote-path "/sbin/")
;; (add-to-list 'tramp-remote-process-environment "JAVA_HOME=/opt/java")


;; Running remote programs that create local X11 windows
;; (add-to-list 'tramp-remote-process-environment
;;              (format "DISPLAY=%s" (getenv "DISPLAY")))

(if (>= emacs-major-version 23)
    (progn 
      (message "Load config for emacs (23) %ds" emacs-major-version)
      (setq tramp-default-method "sshx")
      (setq tramp-encoding-shell "/bin/bash"))
    ;; else, for emacs 22
    (progn 
      (message "Load config for emacs (22) %ds" emacs-major-version)
      (eval-after-load "tramp"
        '(progn
          (setq tramp-default-user "zcai")
          (setq tramp-default-method "sshx")
          (add-to-list 'tramp-methods
           '("ssh" 
             (tramp-connection-function tramp-open-connection-rsh) 
             (tramp-login-program "ssh") 
             (tramp-copy-program nil) 
             (tramp-remote-sh "/bin/bash") 
             (tramp-login-args ("-e" "none")) 
             (tramp-copy-args nil) 
             (tramp-copy-keep-date-arg nil) 
             (tramp-password-end-of-line nil)))))
      ))

