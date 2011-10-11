;; ~/.emacs.d/init.el

;; Emacs's environment 
(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH") ":/usr/texbin:/usr/local/cuda/bin:/usr/local/bin:~/Racket/bin:/opt/local/libexec/git-core"))

(setenv "LD_LIBRARY_PATH" (concat "/usr/local/lib64" (getenv "LD_LIBRARY_PATH")))

(if (string= system-type "darwin")
    (progn
      (setq ns-command-modifier 'meta)
      (setq ns-alternate-modifier 'none)))
;; ==========================================================
;; Load path
;; ==========================================================

;; (require 'cl)

;; Timer Part1
(defvar *emacs-load-start* (current-time))

;; ===========================
;; Used for ~/.emacs
;; ===========================
(setq current-path (getenv "PWD"))
(cd "~/.emacs.d/")

(add-to-list 'load-path "~/.emacs.d/")

(normal-top-level-add-subdirs-to-load-path)

(dolist (path '("/usr/local/bin/"
                "/opt/local/bin/"
                "/usr/local/cuda/bin"
                "/usr/texbin"
                "~/racket/bin"))
  (add-to-list 'exec-path path))

(cond ((string= system-type "darwin")
       (add-to-list 'load-path "/Library/Python/2.6/site-packages/Pymacs")
       (require 'growl)
       (growl "Emacs" "Loading init.el ... "))
      
      ((string= system-type "gnu/linux")
       (add-to-list 'load-path "~/lib/python2.7/site-packages/Pymacs"))
      )

(setq turn-on-follow-mouse t)

(dolist (config-file '("my-keys" "my-backup" "my-mouse" "my-dired.el"
                       "my-eshell" "my-abbrev" "my-tramp" "my-org-mode"
                       "my-syntax" "my-behaviour" "my-color"
                       "my-gud" "my-utils"
                       ;; "my-desktop"
                       ;; "my-mail"
                       "my-slime"))
  (load-library config-file))

;; version control
;; (require 'mercurial)
(require 'emacs-lock)

(if (eq current-path nil)
    (cd "~/.")
    (cd current-path))

;; tab completion for compile command for <=emacs22.3
(when (< emacs-major-version 23)
  (require 'shell-command)
  (shell-command-completion-mode))

(require 'ascii)
(require 'multi-term)
(setq multi-term-program "/bin/bash")
(setq multi-term-switch-after-close nil)

(setq desktop-enable-save-on-exit nil)

;; start emacs server: 
;; (server-force-delete)
;; (if (>= emacs-major-version 23)
;;     (server-force-delete))
;; (server-start)

;; Timer Part2
(message "My init.el loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                           (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
(if (string= system-type "darwin")
    (growl "Emacs" (format "My init.el loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                                       (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))))

(message "Emacs version = %ds" emacs-major-version)
(message "Emacs is running on: %s" system-type)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(default-truncate-lines nil t)
 '(display-time-mode t)
 '(large-file-warning-threshold nil)
 '(paren-sexp-mode nil)
 '(show-paren-mode t)
 '(truncate-partial-width-windows nil))

(eshell)