;; -*- mode: Lisp -*- 
;; Compilation settings 

(setq compilation-scroll-output t)

;; (defun cc-goto-first-error (buffer exit-condition)
;;   (with-current-buffer buffer 
;;     (goto-char (point-min)) 
;;     (compilation-next-error 1)))
;; (add-to-list 'compilation-finish-functions 'cc-goto-first-error) 

;; (setq compilation-auto-jump-to-first-error nil)

(dolist (mode '(c-mode-hook
                c++-mode-hook
                objc-mode-hook
                cuda-mode-hook
                ;; lisp-mode-hook
                ;; emacs-lisp-mode-hook
                python-mode-hook
                cperl-mode-hook
                matlab-mode-hook
                gas-mode-hook
                php-mode-hook
                javascript-mode-hook
                clojure-mode-hook
                latex-mode-hook))
  (add-hook mode
            #'(lambda ()
                (setq compilation-auto-jump-to-first-error t))))

(dolist (mode '(package-menu-mode-hook))
  (add-hook mode #'(lambda () (setq compilation-auto-jump-to-first-error nil))))
