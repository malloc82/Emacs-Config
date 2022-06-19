;; -*- mode: Emacs-Lisp -*-

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
  (define-key mode-type (kbd "(") 'paredit-open-round)
  (define-key mode-type (kbd ")") 'paredit-close-round)
  (define-key mode-type (kbd "[") 'paredit-open-square)
  (define-key mode-type (kbd "]") 'paredit-close-square)
  (define-key mode-type (kbd "{") 'paredit-open-curly)
  (define-key mode-type (kbd "}") 'paredit-close-curly)
  (define-key mode-type (kbd "M-0") 'paredit-escape) ;; also try : \

  (define-key mode-type (kbd "\"") 'paredit-doublequote)
  (define-key mode-type (kbd "\\") 'paredit-backslash)

  (if (or (equal mode-type 'emacs-lisp-mode-map)
          (equal mode-type 'lisp-interaction-mode-map))
      (define-key mode-type (kbd "C-<return>")   'paredit-newline)
    (define-key mode-type (kbd "C-j")          'paredit-newline))
  (define-key mode-type (kbd "C-<backspace>")  'delete-backward-char)
  (define-key mode-type (kbd "M-<backspace>>") 'paredit-backward-kill-word)
  (define-key mode-type (kbd "C-M-<right>")    'forward-sexp)
  (define-key mode-type (kbd "C-M-<left>")     'backward-sexp)
  (define-key mode-type (kbd "DEL")            'paredit-backward-delete)
  ;; nb: this assumes dvorak key layout
  ;; (define-key mode-type (kbd "C-h") 'backward-sexp) ;; use C-M-<left>
  ;; (define-key mode-type (kbd "C-n") 'forward-sexp)  ;; use C-M-<right>
  ;; (define-key mode-type (kbd "C-k") 'kill-sexp)
  ;; (define-key mode-type (kbd "C-t") 'transpose-sexps)
  ;; (define-key mode-type (kbd "C-M-t") 'transpose-chars)
  (define-key mode-type (kbd "C-M-k") 'paredit-kill)
  ;; (define-key mode-type (kbd "C-'") 'paredit-splice-sexp)
  ;; (define-key mode-type (kbd "C-M-l") 'paredit-recentre-on-sexp)
  ;; (define-key mode-type (kbd "C-,") 'paredit-backward-slurp-sexp)
  ;; (define-key mode-type (kbd "C-.") 'paredit-forward-slurp-sexp)
  ;; (define-key mode-type (kbd "C-<") 'paredit-backward-barf-sexp)
  ;; (define-key mode-type (kbd "C->") 'paredit-forward-barf-sexp)
  ;; (define-key mode-type (kbd "C-/") 'backward-up-list)
  ;; (define-key mode-type (kbd "C-=") 'down-list)
  ;; this may seem strange, but i often use the C-<whatever> motion
  ;; commands in sequence to reformat code and having to take a finger off of control
  ;; to add a return is a pain
  ;; (define-key mode-type (kbd "C-<return>") 'paredit-newline)

  ;; (define-key mode-type (kbd "C-c .") 'etags-select-find-tag)
  (define-key mode-type (kbd "C-M-b")         'paredit-backward)
  (define-key mode-type (kbd "C-M-d")         'paredit-forward-down)
  (define-key mode-type (kbd "C-M-f")         'paredit-forward)
  (define-key mode-type (kbd "C-M-n")         'paredit-forward-up)
  (define-key mode-type (kbd "C-M-p")         'paredit-backward-down)
  (define-key mode-type (kbd "C-M-u")         'paredit-backward-up)
  (define-key mode-type (kbd "M-\"")          'paredit-meta-doublequote)
  (define-key mode-type (kbd "M-(")           'paredit-wrap-round)
  (define-key mode-type (kbd "M-)")           'paredit-close-round-and-newline)
  (define-key mode-type (kbd "M-;")           'paredit-comment-dwim)
  (define-key mode-type (kbd "M-?")           'paredit-convolute-sexp)
  (define-key mode-type (kbd "M-J")           'paredit-join-sexps)
  (define-key mode-type (kbd "M-S")           'paredit-split-sexp)
  (define-key mode-type (kbd "M-d")           'paredit-forward-kill-word)
  (define-key mode-type (kbd "M-q")           'paredit-reindent-defun)
  (define-key mode-type (kbd "M-r")           'paredit-raise-sexp)
  (define-key mode-type (kbd "M-s")           'paredit-splice-sexp)
  (define-key mode-type (kbd "M-DEL")         'paredit-backward-kill-word)
  (define-key mode-type (kbd "ESC <C-left>")  'paredit-backward-slurp-sexp)
  (define-key mode-type (kbd "ESC <C-right>") 'paredit-backward-barf-sexp)
  (define-key mode-type (kbd "ESC <down>")    'paredit-splice-sexp-killing-forward)
  (define-key mode-type (kbd "ESC <up>")      'paredit-splice-sexp-killing-backward))

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
              (paredit-mode)
              ;; (add-lisp-paredit lisp-mode-map)
              (load-library "cl-slime-settings.el")
              (slime-mode 1)))

(add-hook 'lisp-interaction-mode-hook
          #'(lambda ()
              (add-lisp-paredit lisp-interaction-mode-map)
              (define-key lisp-interaction-mode-map (kbd "C-j") 'eval-print-last-sexp)))


(add-hook 'scheme-mode-hook
          #'(lambda ()
              (setq show-trailing-whitespace t)
              (paredit-mode)
              (add-lisp-paredit scheme-mode-map)
              (load-library "my-scheme")))

;; (add-hook 'eshell-mode-hook
;;           #'(lambda ()
;;               (paredit-mode)
;;               (add-lisp-paredit scheme-mode-map)))

(add-hook 'slime-mode-hook
          #'(lambda ()
              (paredit-mode)
              (add-lisp-paredit slime-mode-map)
              (font-lock-add-keywords 'slime-mode '(("(\\|)" . 'esk-paren-face)))))

(add-hook 'slime-repl-mode-hook
          #'(lambda ()
              (paredit-mode)
              (add-lisp-paredit slime-repl-mode-map)))

;; (add-hook 'inferior-scheme-mode-hook
;;           '(lambda ()
;;              (add-lisp-paredit inferior-scheme-mode-map)))
