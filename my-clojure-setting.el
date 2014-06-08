;; Load and configure clojure-mode
(require 'clojure-mode)
(require 'paredit)
(message "loading clojure settings ... ")

;; ;; Load a major mode for editing Clojure code.
;; ;; (add-to-list 'load-path "/path/to/clojure-mode/checkout")
;; (require 'clojure-test-mode) ;; requires slime
;; (font-lock-add-keywords 'clojure-mode '(("(\\|)" . 'esk-paren-face)))

(defsubst add-clojure-paredit (mode-type)
  ;; (define-key mode-type (kbd "(") 'paredit-open-parenthesis)
  ;; (define-key mode-type (kbd ")") 'paredit-close-parenthesis)
  ;; (define-key mode-type (kbd "[") 'paredit-open-square)
  ;; (define-key mode-type (kbd "]") 'paredit-close-square)
  ;; (define-key mode-type (kbd "{") 'paredit-open-curly)
  ;; (define-key mode-type (kbd "}") 'paredit-close-curly)
  (define-key mode-type (kbd "M-0") 'paredit-escape) ;; also try : \

  (define-key mode-type (kbd "\"") 'paredit-doublequote)
  (define-key mode-type (kbd "\\") 'paredit-backslash)

  ;; ;; Can't have these for clojure mode 
  ;; (define-key mode-type (kbd "RET") 'paredit-newline)
  ;; (define-key mode-type (kbd "<return>") 'paredit-newline)
  ;; (define-key mode-type (kbd "C-j") 'newline) ;; conflict with 
  (define-key mode-type (kbd "M-<backspace>") 'delete-backward-char)
  (define-key mode-type (kbd "C-M-<right>")   'forward-sexp)
  (define-key mode-type (kbd "C-M-<left>")    'backward-sexp)
  ;; (define-key mode-type (kbd "C-<return>") 'paredit-newline)  

  ;; ;; nb: this assumes dvorak key layout
  ;; ;; (define-key mode-type (kbd "C-k") 'kill-sexp)
  ;; (define-key mode-type (kbd "C-t") 'transpose-sexps)
  ;; (define-key mode-type (kbd "C-M-t") 'transpose-chars)
  ;; (define-key mode-type (kbd "C-M-k") 'paredit-kill)
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

(add-hook 'clojure-mode-hook
          #'(lambda ()
              (enable-paredit-mode)
              (add-clojure-paredit clojure-mode-map)))

(add-hook 'cider-repl-mode-hook
          #'(lambda ()
              (enable-paredit-mode)
              (add-clojure-paredit  cider-repl-mode-map)))

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
     'cider-repl-mode `(("(\\|)" . 'esk-paren-face)))))

