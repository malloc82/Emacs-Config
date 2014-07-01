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
 '(custom-enabled-themes (quote (dark-night-white)))
 '(custom-safe-themes (quote ("0b92b1fa0eac7a74667f75c44858533b6f3dfddcaeaa5c3dc702f05f55b430c1" "8af501792712f057e3327bc9015ade564947e7f7788b6bd816bd2333082e26d9" default)))
 '(fci-rule-color "#383838")
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(cond
  ((eq system-type 'gnu/linux)
   (custom-set-faces
    '(default ((t (:family "ProggyCleanTT" :foundry "unknown" :slant normal :weight normal :height 136 :width normal))))))
  ((eq system-type 'darwin)
   (custom-set-faces
    '(default ((t (:font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))))))
