;; ===========================
;; Slime configuratuion
;; ===========================
;; SBCL command:
;;      start swank server: (swank:create-server)

(defun load-cl-slime ()
  (message "loading cl-slime settings ... ")
  (defsubst slime-mode-addon (mode-type)
    (define-key mode-type (kbd "TAB") 'slime-indent-and-complete-symbol)
    (define-key mode-type (kbd "C-c TAB") 'slime-complete-form)
    ;; (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
    ;; (define-key slime-mode-map (kbd "C-c TAB") 'slime-complete-form)
    ;; i hate having to take my key off of ctrl for this and i don't use complete-form anyway...
    (define-key mode-type (kbd "C-c C-i") 'slime-inspect)
    ;; (define-key global-map (kbd "M-<f12>") 'slime-selector)
    )

  ;; (defvar *lisp-bin-path* "/opt/local/bin/sbcl")

  (let ((slime-dir "~/Installed/Emacs/slime/")
        (lisp-bin-path (find-expand-file-path nil "sbcl")))

    (when (and (file-directory-p slime-dir)
               (not (null lisp-bin-path)))
      (message "==> Slime is installed, loading slime-mode settings")
      (message "==> Slime path: %s" slime-dir)

      (add-to-list  'load-path  slime-dir)


      (require 'slime)

      ;; REPL does not load automatically, so need to load slime-repl or slime-fancy
      ;; (slime-setup '(slime-repl))
      (slime-setup '(slime-fancy slime-asdf))

      (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
      (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
      ;; Optionally, specify the lisp program you are using. Default is "lisp"
      (setq inferior-lisp-program lisp-bin-path
            lisp-indent-function 'common-lisp-indent-function
            slime-complete-symbol-function 'slime-fuzzy-complete-symbol
            ;;   common-lisp-hyperspec-root ""
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
        `(defun ,name ()
           (interactive)
           (slime, lisp)))

      (defslime-start sbcl lisp-bin-path)

      ;; lisp-mode-addon is defined in my-syntax.el
      (add-hook 'slime-mode-hook
                #'(lambda ()
                    (add-lisp-paredit  slime-mode-map)
                    (slime-mode-addon slime-mode-map)))


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

      (setf slime-save-buffers nil)

      ;; (require 'parenface)

      (require 'bridge)

      (autoload 'install-bridge "bridge" "Install a process bridge." t)

      (setq bridge-hook
            #'(lambda ()
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

      ;; (setq slime-close-parens-at-point t)

      ))

  ;; enable ac-slime, auto-complete for common lisp
  (add-to-list 'load-path "~/.emacs.d/ac-slime")
  (require 'ac-slime)
  (add-hook 'slime-mode-hook 'set-up-slime-ac)

  ;; create and add new words to the dictionary on the fly
  (when (require 'auto-complete-config nil 'noerror)
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-slime/ac-dict")
    (setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")
    (ac-config-default))

  ;; (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
  ;; (eval-after-load "auto-complete"
  ;;   '(add-to-list 'ac-modes 'slime-repl-mode))

  (message "done"))

(when (or (not (boundp '*my-version*))
          (not (equal *my-version* "clojure")))
  (load-cl-slime))
