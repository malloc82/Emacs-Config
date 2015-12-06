;; -*- mode: Lisp -*-
;; Auto completion settings

(eval-after-load "auto-complete"
  '(progn
     (defun ac-prefix-default ()
       "Same as `ac-prefix-symbol' but ignore a number prefix."
       (let ((start (ac-prefix-symbol)))
         (when (and start
                  (not (string-match "^\\(?:0[xX][0-9A-Fa-f]+\\|[0-9]+\\)$"
                                     (buffer-substring-no-properties start (point)))))
           start)))
     ))
(require 'auto-complete-config)
(let ((path (find-expand-file-path "~/.emacs.d/elpa/auto-complete*" "dict")))
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

