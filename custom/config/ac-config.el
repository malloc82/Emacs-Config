;; -*- mode: Lisp -*-
;; Auto completion settings

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140618.2217/dict")
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
    auto-complete-mode (lambda ()
                         (if (not (minibufferp (current-buffer)))
                             (auto-complete-mode 1))))
(real-global-auto-complete-mode t)

