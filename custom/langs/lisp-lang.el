;; -*- mode: emacs-lisp -*-

;; ===========================
;; Lisp Mode
;; ===========================

(require 'paredit)
(defun paredit-escape (char)
  ;; I'm too lazy to figure out how to do this without a separate
  ;; interactive function.
  
  ;;  This was removed in later version of paredit
  (interactive "cEscaping character...")
  (if (eq char 127)                     ; The backslash was a typo, so
      t                                 ; the luser wants to delete it.
      (insert char)                     ; (Is there a better way to
      nil))                             ; express the rubout char?
                                        ; ?\^? works, but ugh...)

(defsubst add-lisp-paredit (mode-type)
  (define-key mode-type (kbd "(") 'paredit-open-parenthesis)
  (define-key mode-type (kbd ")") 'paredit-close-parenthesis)
  (define-key mode-type (kbd "[") 'paredit-open-square)
  (define-key mode-type (kbd "]") 'paredit-close-square)
  (define-key mode-type (kbd "M-0") 'paredit-escape) ;; also try : \

  (define-key mode-type (kbd "\"") 'paredit-doublequote)
  (define-key mode-type (kbd "\\") 'paredit-backslash)
  
  (define-key mode-type (kbd "RET") 'paredit-newline)
  (define-key mode-type (kbd "<return>") 'paredit-newline)
  ;; (define-key mode-type (kbd "C-j") 'newline) ;; conflict with 
  
  ;; nb: this assumes dvorak key layout
  ;; (define-key mode-type (kbd "C-h") 'backward-sexp) ;; use C-M-<left>
  ;; (define-key mode-type (kbd "C-n") 'forward-sexp)  ;; use C-M-<right>
  ;; (define-key mode-type (kbd "C-k") 'kill-sexp)
  (define-key mode-type (kbd "C-t") 'transpose-sexps)
  (define-key mode-type (kbd "C-M-t") 'transpose-chars)
  (define-key mode-type (kbd "C-M-k") 'paredit-kill)
  ;; (define-key mode-type (kbd "C-'") 'paredit-splice-sexp)
  (define-key mode-type (kbd "C-M-l") 'paredit-recentre-on-sexp)
  (define-key mode-type (kbd "C-,") 'paredit-backward-slurp-sexp)
  (define-key mode-type (kbd "C-.") 'paredit-forward-slurp-sexp)
  (define-key mode-type (kbd "C-<") 'paredit-backward-barf-sexp)
  (define-key mode-type (kbd "C->") 'paredit-forward-barf-sexp)
  ;; (define-key mode-type (kbd "C-/") 'backward-up-list)
  (define-key mode-type (kbd "C-=") 'down-list)
  ;; this may seem strange, but i often use the C-<whatever> motion
  ;; commands in sequence to reformat code and having to take a finger off of control
  ;; to add a return is a pain
  (define-key mode-type (kbd "C-<return>") 'paredit-newline)
  
  (define-key mode-type (kbd "C-c .") 'etags-select-find-tag)
  )

;; (dolist (mode `((lisp-mode-hook    ,lisp-mode-map)
;;                 (emacs-lisp-hook   ,emacs-lisp-mode-map)
;;                 ;; (scheme-mode-hook  ,scheme-mode-map)
;;                 ;; (inferior-scheme-mode-hook  ,inferior-scheme-mode-map)
;;                 ))
;;     (add-hook (car mode)
;;               `(lambda ()
;;                  (add-lisp-paredit ,(cadr mode)))))

(add-hook 'lisp-mode-hook
          #'(lambda ()
              (setq show-trailing-whitespace t)
              (add-lisp-paredit lisp-mode-map)
              (load-library "cl-slime-settings.el")
              (slime-mode 1)))

(add-hook 'lisp-interaction-mode-hook
          #'(lambda ()
              (add-lisp-paredit lisp-interaction-mode-map)))

(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()
              (add-lisp-paredit emacs-lisp-mode-map)))

(add-hook 'scheme-mode-hook
          #'(lambda ()
              (add-lisp-paredit scheme-mode-map)
              (load-library "my-scheme")))

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "(") 'paredit-open-parenthesis)
              (define-key eshell-mode-map (kbd ")") 'paredit-close-parenthesis)
              (define-key eshell-mode-map (kbd "M-0") 'paredit-escape) ;; also try : \

              (define-key eshell-mode-map (kbd "\"") 'paredit-doublequote)
              (define-key eshell-mode-map (kbd "\\") 'paredit-backslash)
              
              (define-key eshell-mode-map (kbd "C-t") 'transpose-sexps)
              (define-key eshell-mode-map (kbd "C-M-t") 'transpose-chars)
              (define-key eshell-mode-map (kbd "C-M-k") 'paredit-kill)
              ;; (define-key eshell-mode-map (kbd "C-'") 'paredit-splice-sexp)
              (define-key eshell-mode-map (kbd "C-M-l") 'paredit-recentre-on-sexp)
              (define-key eshell-mode-map (kbd "C-,") 'paredit-backward-slurp-sexp)
              (define-key eshell-mode-map (kbd "C-.") 'paredit-forward-slurp-sexp)
              (define-key eshell-mode-map (kbd "C-<") 'paredit-backward-barf-sexp)
              (define-key eshell-mode-map (kbd "C->") 'paredit-forward-barf-sexp)
              ;; (define-key eshell-mode-map (kbd "C-/") 'backward-up-list)
              (define-key eshell-mode-map (kbd "C-=") 'down-list)
              ;; this may seem strange, but i often use the C-<whatever> motion
              ;; commands in sequence to reformat code and having to take a finger off of control
              ;; to add a return is a pain
              (define-key eshell-mode-map (kbd "C-<return>") 'paredit-newline)
              ))

(add-hook 'slime-mode-hook
          #'(lambda ()
              (add-lisp-paredit slime-mode-map)
              (font-lock-add-keywords 'slime-mode '(("(\\|)" . 'esk-paren-face)))))

(add-hook 'slime-repl-mode-hook
          #'(lambda ()
              (define-key slime-repl-mode-map (kbd "(") 'paredit-open-parenthesis)
              (define-key slime-repl-mode-map (kbd ")") 'paredit-close-parenthesis)
              (define-key slime-repl-mode-map (kbd "[") 'paredit-open-square)
              (define-key slime-repl-mode-map (kbd "]") 'paredit-close-square)
              (define-key slime-repl-mode-map (kbd "{") 'paredit-open-curly)
              (define-key slime-repl-mode-map (kbd "}") 'paredit-close-curly)
              (define-key slime-repl-mode-map (kbd "M-0") 'paredit-escape) ;; also try : \
              
              (define-key slime-repl-mode-map (kbd "\"") 'paredit-doublequote)
              (define-key slime-repl-mode-map (kbd "\\") 'paredit-backslash)))

;; (add-hook 'inferior-scheme-mode-hook
;;           '(lambda ()
;;              (add-lisp-paredit inferior-scheme-mode-map)))
