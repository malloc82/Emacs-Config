;; -*- mode: Lisp -*-

;; Timer
(defvar *emacs-load-start* (current-time))

;; Basic setup

(when (eq system-type 'darwin)
  (setq ns-command-modifier 'meta)
  (setq ns-alternate-modifier 'none))

(setq current-path (getenv "PWD"))
(cd "~/.emacs.d/custom") ;; all sub dir will be added to the load-path

(dolist (path `(,(expand-file-name "~/.emacs.d/custom")
                ,(expand-file-name "~/.emacs.d/vendor")
                "PACKAGE_DIRECTORY"))
  (add-to-list 'load-path path))

(load-library "env")

(when (>= emacs-major-version 24)
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/custom/themes"))
  (require 'package)
  (dolist (repo '(("gnu"          . "http://elpa.gnu.org/packages/")
                  ("marmalade"    . "http://marmalade-repo.org/packages/")
                  ;; ("melpa"        . "http://melpa.milkbox.net/packages/") ;; snapshots
                  ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
    (add-to-list 'package-archives repo))
  (setq package-pinned-archives '((clojure-mode . "melpa-stable")
                                  (cider        . "melpa-stable")))
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
 '(global-hl-line-mode t)
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(column-number-mode t)
 '(custom-enabled-themes '(dark-night-white))
 '(custom-safe-themes
   (quote
    ("0cd5946c51bf9a44212db12dc802cd616c37ab7ec6e70dcf4da06ce9ac19360e" ;; dark-night-gray
     "b4f25520a8e15ee3a81b932e32f0694bd51a0505c91537948bbdfb97e298a84e" ;; dark-night-white
     "d9c7b4341ddd9e78a1116f925a586f789aa613888053710fb5956a815e84183f" ;; radiance
     default)))
 '(fci-rule-color "#383838")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(scroll-bar-mode t))

(custom-set-faces
 `(default ,(cond
             ((eq system-type 'gnu/linux)
              '((t (:family "ProggyCleanTT" :foundry "unknown" :slant normal :weight normal :height 136 :width normal))))
             ((eq system-type 'darwin)
              '((t (:font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))))))

