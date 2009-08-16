;; ===============================
;; Tramp configuration
;; ===============================

(if (>= emacs-major-version 23)
    (progn 
      ;; (message "Load config for emacs (23) %ds" emacs-major-version)
      (setq tramp-default-method "ssh")
      (setq tramp-encoding-shell "/bin/bash"))
    ;; else, for emacs 22
    (progn 
      ;; (message "Load config for emacs (22) %ds" emacs-major-version)
      (eval-after-load "tramp"
        '(progn
          ;; (setq tramp-default-user "USERNAME")
          
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
             (tramp-password-end-of-line nil)))))
      ))


;; emacs 22

;; (eval-after-load "tramp"
;;   '(progn
;;     (setq tramp-default-user "USERNAME")
    
;;     (setq tramp-default-method "ssh")
;;     (add-to-list 'tramp-methods
;;      '("ssh" 
;;        (tramp-connection-function tramp-open-connection-rsh) 
;;        (tramp-login-program "ssh") 
;;        (tramp-copy-program nil) 
;;        (tramp-remote-sh "/bin/bash") 
;;        (tramp-login-args ("-e" "none")) 
;;        (tramp-copy-args nil) 
;;        (tramp-copy-keep-date-arg nil) 
;;        (tramp-password-end-of-line nil)))))

;; emacs 23

;; (setq tramp-default-method "ssh")
;; (setq tramp-encoding-shell "/bin/bash")
