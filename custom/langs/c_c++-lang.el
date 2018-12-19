;; -*- mode: Emacs-Lisp -*-
;; C/C++ configurations

(add-hook 'c++-mode-hook  #'(lambda ()
                              (irony-mode +1)
                              (electric-pair-mode +1)
                              (setq show-trailing-whitespace t)))

(add-hook 'c-mode-hook    #'(lambda ()
                              (irony-mode +1)
                              (electric-pair-mode +1)
                              (setq show-trailing-whitespace t)))

(add-hook 'objc-mode-hook #'(lambda ()
                              (irony-mode +1)
                              (electric-pair-mode +1)
                              (setq show-trailing-whitespace t)))


(add-hook 'cuda-mode-hook #'(lambda ()
                              ;; (irony-mode +1)
                              (electric-pair-mode +1)
                              (setq show-trailing-whitespace t)))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook #'(lambda () (setq show-trailing-whitespace t)))

(set-variable 'c-default-style "stroustrup")

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
