;; -*- mode: Emacs-Lisp -*-
;; MatLab

;; (autoload 'matlab-mode "matlab.elc" "Enter Matlab mode." t)
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)

(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")
(setq matlab-fill-code nil)
(setq show-trailing-whitespace t)
