;; ~/.emacs.d/init.el

;; Emacs's environment 
(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH") ":/usr/texbin:/usr/local/cuda/bin:/usr/local/bin:."))
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

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "/Library/Python/2.6/site-packages/Pymacs")

;; ===========================
;; Used for ~/.emacs
;; ===========================
(setq current-path (getenv "PWD"))
(cd "~/.emacs.d/")

(normal-top-level-add-subdirs-to-load-path)

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/")
;; (load "auctex.el" nil t t)

;; (setq exec-path (cons exec-path "/usr/local/bin"))

(add-to-list 'exec-path "/usr/local/bin/")
(add-to-list 'exec-path "/opt/local/bin/")
(add-to-list 'exec-path "/usr/local/cuda/bin")
(add-to-list 'exec-path "/usr/texbin")

(when (string= system-type "darwin")
  (require 'growl)
  (growl "Emacs" "Loading init.el ... "))

(setq turn-on-follow-mouse t)

(load-library "my-keys")
(load-library "my-backup")
(load-library "my-mouse")

(load-library "my-dired.el")
(load-library "my-function")
(load-library "my-abbrev")
(load-library "my-color")
(load-library "my-tramp")
(load-library "my-org-mode")

;; (load-library "my-python")

(load-library "my-gud")
(load-library "my-syntax")
(load-library "my-behaviour")

;; (load-library "my-desktop")

(load-library "my-slime")
;; (load-library "my-mail")

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

(setq desktop-enable-save-on-exit nil)

;; =================================
;; Others stuffs
;; =================================

;;--------------------------------------------------------------
;;--------------------------------------------------------------
;;--------------------------------------------------------------

;; (cond ((file-exists-p "~/emacs/lisp/auto-template.el")
;;        (autoload 'auto-template "~/emacs/lisp/auto-template.el"
;;          "Insert a nice templated file when creating new files")
;;        (add-hook 'find-file-hooks 'auto-template)))

;; (require 'template)
;; (template-initialize)
;; (defconst template-subdirectories '("./" "~/emacs/templates"))


;;; ********************
;;; Load crypt, which is a package for automatically decoding and reencoding
;;; files by various methods - for example, you can visit a .Z or .gz file,
;;; edit it, and have it automatically re-compressed when you save it again.
;;; 
(setq crypt-encryption-type 'gpg   ; default encryption mechanism
      crypt-confirm-password t     ; make sure new passwords are correct
      ;crypt-never-ever-decrypt t  ; if you don't encrypt anything, set this to
                                   ; tell it not to assume that "binary" files
                                   ; are encrypted and require a password.
      )

;; (require 'crypt++)


;; -----new (load "planner")

;; -----new (load "~/.emacs-records")

;;;; records-mode
;; Define key bindings for functions called from outside records mode
;; The preferred binding for records-goto-today - uncomment to use it
(define-key global-map [?\C-c ?n] 'records-goto-today)
(define-key global-map [?\C-c ?-] 'records-underline-line)

;; The Ctrl-x n map
(define-key global-map [?\C-x ?n ?t] 'records-goto-today)
(define-key global-map [?\C-x ?n ?r] 'records-insert-record-region)
(define-key global-map [?\C-x ?n ?b] 'records-insert-record-buffer)
(define-key global-map [?\C-x ?n ?l] 'records-insert-link)
     
;; Hook up to the calendar mode
(add-hook 'calendar-load-hook
     	  (function
     	   (lambda ()
     	     (define-key calendar-mode-map "n"
               'records-calendar-to-record))))

;; Hook up to the latex mode
(add-hook 'LaTeX-mode-hook
          (function
           (lambda ()
             (define-key LaTeX-mode-map "\C-clw" 'records-widen-latex))))

;; Hook to insert a template when a record is inserted.
;; See function records-insert-template
(add-hook 'records-make-record-hook
          (function (lambda ()
            (records-insert-template current-prefix-arg))))
 ;;;*** OPTIONAL ***;;;
     
;; If you like abbrev mode
(add-hook 'records-mode-hooks
          (function
           (lambda ()
            (abbrev-mode 1))))
     
;; If you like to use auto filling and/or filladapt modes while editing text.
;; If you have these functions in the text-mode-hook, then you don't need
;; them here.
(add-hook 'records-mode-hooks
          (function (lambda ()
                      (turn-on-auto-fill)
                      (turn-on-filladapt-mode)
                      )))

;; If you want to always start up in outline mode
(add-hook 'records-mode-hooks 'records-outline-mode)
     
;; ;; Using imenu: imenu will invoke a popup menu of records subjects
;; ;; 1. In Xemacs:
;;    (define-key global-map [(shift button3)] 'imenu)
;; ;; 2. In gnu emacs:
;;    (define-key global-map [(shift mouse-3)] 'imenu)

     ; If you want to be brought to today's record on startup
;;(records-goto-today)
     
;;;; records-mode end

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
 '(default-truncate-lines nil t)
 '(large-file-warning-threshold nil)
 '(paren-sexp-mode nil)
 '(show-paren-mode t)
 '(truncate-partial-width-windows nil))

(when (string= system-type "gnu/linux")
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
 
   ;; On Linux, use this:
   '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 80 :width normal :foundry "unknown" :family "Monaco")))) 
   )
)
