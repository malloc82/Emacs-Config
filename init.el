;; -*- mode: Lisp -*-

;; Timer
(defvar *emacs-load-start* (current-time))

;; Meta key setup
(cond ((eq system-type 'darwin)
       (setq mac-command-modifier 'meta) ; make cmd key do Meta
       (setq mac-option-modifier 'super) ; make opt key do Super
       ;; (setq mac-control-modifier 'control) ; make Control key do Control
       (setq ns-function-modifier 'hyper) ; make Fn key do Hyper
       )
      ((eq system-type 'windows)
       (setq w32-pass-lwindow-to-system nil)
       (setq w32-lwindow-modifier 'super) ; Left Windows key

       (setq w32-pass-rwindow-to-system nil)
       (setq w32-rwindow-modifier 'super) ; Right Windows key

       (setq w32-pass-apps-to-system nil)
       (setq w32-apps-modifier 'hyper) ; Menu/App key
       ))

;; (when (eq system-type 'darwin)
;;   (setq ns-command-modifier 'meta)
;;   (setq ns-alternate-modifier 'none))

(setq current-path (getenv "PWD"))
(cd "~/.emacs.d/custom") ;; all sub dir will be added to the load-path

(dolist (path `(,(expand-file-name "~/.emacs.d/custom")
                ,(expand-file-name "~/.emacs.d/vendor")
                "PACKAGE_DIRECTORY"))
  (add-to-list 'load-path path))

(when (>= emacs-major-version 24)
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/custom/themes"))
  (require 'package)
  (dolist (repo '(("gnu"          . "http://elpa.gnu.org/packages/")
                  ("marmalade"    . "http://marmalade-repo.org/packages/")
                  ;; ("melpa"        . "https://melpa.org/packages/") ;; snapshots
                  ("melpa-stable" . "https://stable.melpa.org/packages/")))
    (add-to-list 'package-archives repo))
  (setq package-pinned-archives '((use-package  . "melpa-stable")
                                  (smex         . "melpa-stable")
                                  (company      . "melpa-stable")
                                  (paredit      . "melpa-stable")
                                  (clojure-mode . "melpa-stable")
                                  (cider        . "melpa-stable")
                                  (use-package  . "melpa-stable")
                                  (python-mode  . "melpa-stable")
                                  (jedi         . "melpa-stable")
                                  (go-mode      . "melpa-stable")
                                  (magit        . "melpa-stable")
                                  (pabbrev      . "gnu")
                                  (elpy         . "https://jorgenschaefer.github.io/packages/")))
  (package-initialize)

  (load "selected-packages")

  (use-package smex :ensure t)
  (use-package company
    :ensure t
    :bind (("C-c /". company-complete))
    :config (global-company-mode))

  (use-package markdown-mode
    :ensure t
    :commands (markdown-mode gfm-mode)
    :mode (("README\\.md\\'" . gfm-mode)
           ("\\.md\\'" . markdown-mode)
           ("\\.markdown\\'" . markdown-mode))
    :init (setq markdown-command "pandoc")))

;; (message "Emacs ELPA loaded in %ds"
;;          (destructuring-bind (hi lo ms &optional ps) (current-time)
;;            (- (+ hi lo)
;;               (+ (first *emacs-load-start*) (second *emacs-load-start*)))))


(load "env") ;; takes 1s to loade
(load "keys")

(if (eq current-path nil)
    (cd "~/.")
  (cd current-path))

(load "functions")
(load "general")  ;; takes 2s to load
(load "faces")
(load "lang") ;; takes 1s to load

(message "Emacs config loaded in %ds"
         (destructuring-bind (hi lo ms &optional ps) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*) (second *emacs-load-start*)))))

(load "custom-vars-and-face")
