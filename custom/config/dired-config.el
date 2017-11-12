;; -*- mode: Lisp -*-
;; Dired mode configuration

;; (put 'dired-find-alternate-file 'disabled nil)

(setq-default  dired-use-ls-dired nil)

;; ;Make sure each dired buffer doesn't spawn new dired buffers
;; (defun my-dired-init ()
;;   "Bunch of stuff to run for dired, either immediately or when it's
;;   loaded."
;;   ;; <add other stuff here>
;;   (define-key dired-mode-map [return] 'joc-dired-single-buffer)
;;   (define-key dired-mode-map [mouse-1] 'joc-dired-single-buffer-mouse)
;;   (define-key dired-mode-map "^"
;;     (function
;;      (lambda nil (interactive) (joc-dired-single-buffer "..")))))
;; ;; if dired's already loaded, then the keymap will be bound
;; (if (boundp 'dired-mode-map)
;;     ;; we're good to go; just add our bindings
;;     (my-dired-init)
;;   ;; it's not loaded yet, so add our bindings to the load-hook
;;   (add-hook 'dired-load-hook 'my-dired-init))
;; ;;enable recursive deletion of dirs, but doubly ask if it's not empty.
;; (setq dired-recursive-deletes 'top)


(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            (dired-omit-mode 1)
            (setq dired-omit-files "^\\.?#\\|^\\.[^.].+$")
            (setq dired-omit-extensions
                  (append '(".dvi" ".aux" ".blg" ".toc" ".log"
                            ".fdb_latexmk" ".synctex.gz" ".fls" ".out" ".pdf")
                          dired-omit-extensions))
            ;; (setq dired-omit-files
            ;;       (concat dired-omit-files "\\|^\\..+$"))
            ))

(when (eq system-type 'darwin)
    (setq insert-directory-program "/opt/local/bin/gls"))
;; (setq dired-listing-switches "-alph --color=auto --group-directories-first")
(setq dired-listing-switches "-alph --group-directories-first")

