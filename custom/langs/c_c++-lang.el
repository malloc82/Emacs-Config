;; -*- mode: Lisp -*-
;; C/C++ configurations
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
              'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
              'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(set-variable 'c-default-style "stroustrup")
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; ============================================================
;;  indentation
;; ------------------------------------------------------------
;; (add-hook 'c-mode-common-hook
;;           #'(lambda ()
;;               (turn-on-font-lock)
;;               (c-set-offset 'substatement-open 0)
;;               (c-set-offset 'case-label '+)
;;               ;;(c-set-offset 'arglist-cont-nonempty c-lineup-arglist))
;;               (setq show-trailing-whitespace t)))
;; ============================================================
