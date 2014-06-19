;; -*- mode: Lisp -*-

;; Timer
(defvar *emacs-load-start* (current-time))

;; Basic setup

(if (string= system-type "darwin")
    (progn
      (setq ns-command-modifier 'meta)
      (setq ns-alternate-modifier 'none)))

(setq current-path (getenv "PWD"))
(cd "~/.emacs.d/custom")

(add-to-list 'custom-theme-load-path "~/.emacs.d/custom/themes/")
(setq load-path (append '("~/.emacs.d/"
                          "~/.emacs.d/custom/"
                          "~/.emacs.d/vendor/"
                          "PACKAGE_DIRECTORY") load-path))

(load-library "env")

(delete-selection-mode 1)
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize))
(load-library "keys")

(if (eq current-path nil)
    (cd "~/.")
    (cd current-path))

;; Feature setup
(dolist (config-file '("general"
                       "functions"
                       "lang"))
  (load-library config-file))

(message "Emacs config loaded in %ds"
         (destructuring-bind (hi lo ms &optional ps) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
