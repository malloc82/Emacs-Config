;; -*- mode: Lisp -*-

;; Timer
(defvar *emacs-load-start* (current-time))

;; Basic setup

(if (string= system-type "darwin")
    (progn
      (setq ns-command-modifier 'meta)
      (setq ns-alternate-modifier 'none)))

(setq current-path (getenv "PWD"))
(cd "~/.emacs.d/custom") ;; all sub dir will be added to the load-path 

(dolist (path `(,(expand-file-name "~/.emacs.d")
                ,(expand-file-name "~/.emacs.d/custom")
                ,(expand-file-name "~/.emacs.d/vendor")
                "PACKAGE_DIRECTORY"))
  (add-to-list 'load-path path))

(load-library "env")

(when (>= emacs-major-version 24)
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/custom/themes"))
  (require 'package)
  (dolist (repo '(("gnu"       . "http://elpa.gnu.org/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("melpa"     . "http://melpa.milkbox.net/packages/")))
    (add-to-list 'package-archives repo))
  (package-initialize))

(load-library "keys")

(if (eq current-path nil)
    (cd "~/.")
    (cd current-path))

;; Feature setup
(dolist (config-file '("functions"
                       "general"
                       "faces"
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
 '(column-number-mode t)
 '(custom-enabled-themes (quote (dark-night)))
 '(custom-safe-themes (quote ("e16dde57bd700fad0930fac2e83b24a6f452cbeba4e0084dab8954ff9b2782e8" "8b231ba3e5f61c2bb1bc3a2d84cbd16ea17ca13395653566d4dfbb11feaf8567" default)))
 '(fci-rule-color "#383838")
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(cond ((string= system-type "gnu/linux")
       (custom-set-faces
        '(default ((t (:family "ProggyCleanTT" :foundry "unknown" :slant normal :weight normal :height 136 :width normal))))))
      ((string= system-type "darwin")
       (custom-set-faces
        '(default ((t (:font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))))))
