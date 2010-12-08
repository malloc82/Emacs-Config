;; ===========================
;; Slime configuratuion
;; ===========================
;; SBCL command:
;;      start swank server: (swank:create-server)


(add-to-list  'load-path      "/Users/zcai/Emacs/slime/")
(defvar *sbcl-bin-path* "/opt/local/bin/sbcl")

(require 'slime)

;; REPL does not load automatically, so need to load slime-repl or slime-fancy
;; (slime-setup '(slime-repl))
(slime-setup '(slime-fancy slime-asdf))

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; Optionally, specify the lisp program you are using. Default is "lisp"
(setq inferior-lisp-program *sbcl-bin-path*
     lisp-indent-function 'common-lisp-indent-function
     slime-complete-symbol-function 'slime-fuzzy-complete-symbol
;      common-lisp-hyperspec-root ""
     slime-startup-animation nil
     slime-enable-evaluate-in-emacs t
     slime-log-events t
     slime-outline-mode-in-events-buffer nil
     slime-repl-return-behaviour :send-only-if-after-complete
     slime-autodoc-use-multiline-p t
     slime-highlight-compiler-notes t
     slime-fuzzy-completion-in-place nil) 

(require 'mic-paren)

(paren-activate)

(setf paren-priority 'close)

(defmacro defslime-start (name lisp)
  '(defun , name ()
    (interactive)
    (slime, lisp)))

(defslime-start sbcl *sbcl-bin-path*)

;; lisp-mode-addon is defined in my-syntax.el
(add-hook 'slime-mode-hook
          '(lambda ()
             (lisp-mode-addon slime-mode-map)))


;; (define-key slime-mode-map (kbd "(") 'paredit-open-parenthesis)
;; (define-key slime-mode-map (kbd ")") 'paredit-close-parenthesis)

;; (define-key slime-mode-map (kbd "\"") 'paredit-doublequote)
;; (define-key slime-mode-map (kbd "\\") 'paredit-backslash)

;; (define-key slime-mode-map (kbd "RET") 'paredit-newline)
;; (define-key slime-mode-map (kbd "<return>") 'paredit-newline)
;; (define-key slime-mode-map (kbd "C-j") 'newline)

;; ;;;; nb: this assumes dvorak key layout
;; ;; (define-key slime-mode-map (kbd "C-h") 'backward-sexp) ;; use C-M-<left>
;; ;; (define-key slime-mode-map (kbd "C-n") 'forward-sexp)  ;; use C-M-<right>
;; ;; (define-key slime-mode-map (kbd "C-k") 'kill-sexp)
;; (define-key slime-mode-map (kbd "C-t") 'transpose-sexps)
;; (define-key slime-mode-map (kbd "C-M-t") 'transpose-chars)
;; (define-key slime-mode-map (kbd "C-M-k") 'paredit-kill)
;; ;; (define-key slime-mode-map (kbd "C-'") 'paredit-splice-sexp)
;; (define-key slime-mode-map (kbd "C-M-l") 'paredit-recentre-on-sexp)
;; (define-key slime-mode-map (kbd "C-,") 'paredit-backward-slurp-sexp)
;; (define-key slime-mode-map (kbd "C-.") 'paredit-forward-slurp-sexp)
;; (define-key slime-mode-map (kbd "C-<") 'paredit-backward-barf-sexp)
;; (define-key slime-mode-map (kbd "C->") 'paredit-forward-barf-sexp)
;; ;; (define-key slime-mode-map (kbd "C-/") 'backward-up-list)
;; (define-key slime-mode-map (kbd "C-=") 'down-list)
;; (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
;; (define-key slime-mode-map (kbd "C-c TAB") 'slime-complete-form)
;; ;;;; this may seem strange, but i often use the C-<whatever> motion
;; ;;;; commands in sequence to reformat code and having to take a finger off of control
;; ;;;; to add a return is a pain
;; (define-key slime-mode-map (kbd "C-<return>") 'paredit-newline)
;; ;;;; i hate having to take my key off of ctrl for this and i don't use complete-form anyway...
;; (define-key slime-mode-map (kbd "C-c C-i") 'slime-inspect)
;; (define-key global-map (kbd "M-<f12>") 'slime-selector)


(setf slime-save-buffers nil)

;; (require 'parenface)

(require 'bridge)

(autoload 'install-bridge "bridge" "Install a process bridge." t)

(setq bridge-hook 
      '(lambda ()
        ;; Example options
        (setq bridge-source-insert nil) ;Don't insert in source buffer
        (setq bridge-destination-insert nil) ;Don't insert in dest buffer
        ;; Handle copy-it messages yourself
        ))

(defvar slime-auto-compile-timer nil)

(defun slime-enable-auto-compile ()
  (setf slime-auto-compile-timer
        (run-with-idle-timer 3 t `(lambda ()
                                    (when (and slime-mode
                                               (slime-sexp-at-point)
                                               (slime-connected-p))
                                      (slime-compile-defun))))))

(defun slime-disable-auto-compile ()
  (cancel-timer slime-auto-compile-timer))

(setf slime-display-edit-hilights nil)

;; setup {} and [] to be treated like ()

(modify-syntax-entry ?\{ "(}" lisp-mode-syntax-table)
(modify-syntax-entry ?\} "){" lisp-mode-syntax-table)
(modify-syntax-entry ?\[ "(]" lisp-mode-syntax-table)
(modify-syntax-entry ?\] ")[" lisp-mode-syntax-table)


(defun slime-repl-clear-buffer ()
  "Delete the entire output generated by the Lisp process."
  (interactive)
  ;; need to add this since we narrow the region...
  (widen)
  (slime-eval-async `(swank:clear-repl-results))
  (set-marker slime-repl-last-input-start-mark nil)
  (let ((inhibit-read-only t))
    (delete-region (point-min) (slime-repl-input-line-beginning-position))
    (goto-char slime-repl-input-start-mark)))



(setf slime-translate-to-lisp-filename-function
      (lambda (file-name)
        (subseq file-name (length "/ssh:zcai@localhost:")))
      slime-translate-from-lisp-filename-function
      (lambda (file-name)
        (concat "/ssh:zcai@localhost:" file-name)))


;(setq slime-close-parens-at-point t)
 

