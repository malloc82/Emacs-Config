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
 '(ansi-color-names-vector ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-enabled-themes (quote (dark-night)))
 '(custom-safe-themes (quote ("e16dde57bd700fad0930fac2e83b24a6f452cbeba4e0084dab8954ff9b2782e8" "8b231ba3e5f61c2bb1bc3a2d84cbd16ea17ca13395653566d4dfbb11feaf8567" default)))
 '(fci-rule-color "#383838"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "ProggyCleanTT" :foundry "unknown" :slant normal :weight normal :height 136 :width normal)))))

