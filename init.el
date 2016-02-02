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
                  ("melpa"        . "http://melpa.milkbox.net/packages/") ;; snapshots
                  ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                  ))
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
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (dark-night-gray)))
 '(custom-safe-themes
   (quote
    ("88e7e16a25bc0986f6c769961c21fa92d318ebbfe4d52f1913486cfbcc8bde77" "2e4033c81d9465003246dfcac05220adaf303910d92cbb330c9cbd3e76f14c4f" "b4f25520a8e15ee3a81b932e32f0694bd51a0505c91537948bbdfb97e298a84e" "d9c7b4341ddd9e78a1116f925a586f789aa613888053710fb5956a815e84183f" "d4b1adc34bc0c74bf19daaf499b7350bafc291e43f35e86e50191cd72fcf2edc" "bcf64603c4f487738683539c87378deec176ef27ebb88a14a01e398ce790ec4c" default)))
 '(fci-rule-color "#383838")
 '(global-hl-line-mode t)
 '(package-selected-packages
   (quote
    (clojure-snippets yasnippet yasnippet-bundle workgroups warm-night-theme visible-mark virtualenv use-package undo-tree starter-kit ssh smartparens shell-command scion s rust-mode redo+ rainbow-delimiters quack python-mode parenface pabbrev osx-plist multi-term mic-paren matlab-mode markdown-mode key-chord julia-mode jedi javap-mode javap javadoc-lookup highlight-symbol highlight haskell-mode go-mode ghci-completion ghc framemove frame-fns frame-cmds flymake etags-table etags-select elisp-slime-nav cyberpunk-theme command-frequency color-theme-eclipse clues-theme clojurescript-mode clojure-mode-extra-font-locking bubbleberry-theme base16-theme auctex-latexmk ascii ample-zen-theme ample-theme alect-themes alchemist ac-slime ac-cider ac-c-headers)))
 '(scroll-bar-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:font "-*-Monaco-normal-normal-normal-*-10-*-*-*-m-0-iso10646-1")))))

