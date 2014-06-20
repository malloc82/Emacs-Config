;; -*- mode: Lisp -*-
;; Auto completion settings

(require 'auto-complete-config)
(let ((path (m-expand-file-path "dict" "~/.emacs.d/elpa/auto-complete*")))
  (when path
    (add-to-list 'ac-dictionary-directories path)))
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
    auto-complete-mode (lambda ()
                         (if (not (minibufferp (current-buffer)))
                             (auto-complete-mode 1))))
(real-global-auto-complete-mode t)

