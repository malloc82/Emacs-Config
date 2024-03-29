;; Load and configure clojure-mode
(require 'clojure-mode)
(require 'paredit)
(message "loading clojure settings ... ")

;; ;; Load a major mode for editing Clojure code.
;; ;; (add-to-list 'load-path "/path/to/clojure-mode/checkout")
;; (require 'clojure-test-mode) ;; requires slime
;; (font-lock-add-keywords 'clojure-mode '(("(\\|)" . 'esk-paren-face)))

(defsubst paredit-extension (mode-type)
  (define-key mode-type (kbd "M-0") 'paredit-escape) ;; also try : \
  ;; ;; Can't have these for clojure mode
  ;; (define-key mode-type (kbd "RET") 'paredit-newline)
  ;; (define-key mode-type (kbd "<return>") 'paredit-newline)
  ;; (define-key mode-type (kbd "C-j") 'newline) ;; conflict with
  (define-key mode-type (kbd "C-<backspace>")    'delete-backward-char)
  ;; (define-key mode-type (kbd "M-<backspace>>")   'paredit-backward-kill-word)
  ;; (define-key mode-type (kbd "C-M-<right>")      'forward-sexp)
  ;; (define-key mode-type (kbd "C-M-<left>")       'backward-sexp)
  ;; (define-key mode-type (kbd "C-<return>") 'paredit-newline)

  ;; ;; nb: this assumes dvorak key layout
  ;; (define-key mode-type (kbd "C-k") 'kill-sexp)
  ;; (define-key mode-type (kbd "C-t") 'transpose-sexps)
  ;; (define-key mode-type (kbd "C-M-t") 'transpose-chars)
  (define-key mode-type (kbd "C-M-k") 'paredit-kill)
  ;; ;; (define-key mode-type (kbd "C-'") 'paredit-splice-sexp)
  ;; (define-key mode-type (kbd "C-M-l") 'paredit-recentre-on-sexp)
  ;; (define-key mode-type (kbd "C-,") 'paredit-backward-slurp-sexp)
  ;; (define-key mode-type (kbd "C-.") 'paredit-forward-slurp-sexp)
  ;; (define-key mode-type (kbd "C-<") 'paredit-backward-barf-sexp)
  ;; (define-key mode-type (kbd "C->") 'paredit-forward-barf-sexp)
  ;; ;; (define-key mode-type (kbd "C-/") 'backward-up-list)
  ;; (define-key mode-type (kbd "C-=") 'down-list)
  ;; ;; this may seem strange, but i often use the C-<whatever> motion
  ;; ;; commands in sequence to reformat code and having to take a finger off of control
  ;; ;; to add a return is a pain
  ;; (define-key mode-type (kbd "C-c .") 'etags-select-find-tag)
  )

;; (require 'ac-nrepl)
;; ;; **BAD** cause clojure mode very sluggish to use
;; (add-hook 'cider-mode-hook 'ac-nrepl-setup)
;; (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-repl-mode))

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(setq company-idle-delay nil) ; never start completions automatically

(global-set-key (kbd "C-M-i") #'company-complete) ; use M-TAB, a.k.a. C-M-i, as manual trigger
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook      #'cider-company-enable-fuzzy-completion)


(add-hook 'clojure-mode-hook
          #'(lambda ()
              (setq show-trailing-whitespace t)
              (eldoc-mode)
              (enable-paredit-mode)
              (paredit-extension clojure-mode-map)
              ;; (lsp)
              ))

(add-hook 'cider-repl-mode-hook
          #'(lambda ()
              (eldoc-mode)
              (enable-paredit-mode)
              (add-to-list 'paredit-space-for-delimiter-predicates
                           'clojure-space-for-delimiter-p
                           'clojure-no-space-after-tag)
              (rainbow-delimiters-mode)
              (paredit-extension  cider-repl-mode-map)
              ;; (lsp)
              ))

;; (add-hook 'clojurescript-mode-hook 'lsp)

(eval-after-load 'clojure-mode
  '(progn
    (font-lock-add-keywords
     'clojure-mode `(("(\\(fn\\>\\)"
                      (0 (progn (compose-region (match-beginning 1)
                                                (match-end 1) "ƒ")
                                nil)))
                     ("(\\|)" . 'esk-paren-face)))))

(eval-after-load 'cider-repl-mode
  '(progn
    (font-lock-add-keywords
     'cider-repl-mode `(("(\\(fn\\>\\)"
                         (0 (progn (compose-region (match-beginning 1)
                                                   (match-end 1) "ƒ")
                                   nil)))
                        ("(\\|)" . 'esk-paren-face)))))

;; (eval-after-load 'cider-repl-mode
;;   '(progn
;;     (font-lock-add-keywords
;;      'cider-repl-mode `(("(\\|)" . 'esk-paren-face)))))

(setq cider-repl-use-clojure-font-lock t)
(setq nrepl-hide-special-buffers t)
(setq cider-popup-stacktraces nil)


;; ;; lsp setup
;; (setq lsp-clojure-custom-server-command '("bash" "-c" "/usr/local/bin/clojure-lsp"))
;; (setq gc-cons-threshold (* 100 1024 1024)
;;       read-process-output-max (* 1024 1024)
;;       treemacs-space-between-root-nodes nil
;;       company-minimum-prefix-length 1
;;       lsp-lens-enable nil
;;       lsp-signature-auto-activate nil
;;       ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
;;       ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
;;       )
