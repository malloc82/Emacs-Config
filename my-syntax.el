
;; (setq mode-list '(c-mode-hook
;;                   c++-mode-hook
;;                   objc-mode-hook
;;                   cuda-mode-hook
;;                   lisp-mode-hook
;;                   emacs-lisp-mode-hook
;;                   python-mode-hook
;;                   cperl-mode-hook
;;                   matlab-mode-hook
;;                   gas-mode-hook
;;                   php-mode-hook
;;                   javascript-mode-hook))


(let ((mlist '(c-mode-hook
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
               javascript-mode-hook)))
  (dolist (mode mlist)
    (add-hook mode
              #'(lambda ()
                  (setq compilation-auto-jump-to-first-error t)
                  (outline-minor-mode 1)))))

(add-hook 'cuda-mode-hook
          #'(lambda ()
              (yas/minor-mode 1)))

;; =================================
;; python-mode configuration
;; =================================

(require 'python-mode)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))

(add-hook 'python-mode-hook
       	  '(lambda ()
             (unless (and (boundp '*my-python-loaded*) *my-python-loaded*)
               (message "loading python-mode ......... ")
               (load-library "my-python")
               (setq *my-python-loaded* t))))

