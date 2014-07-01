;; -*- mode: Lisp -*-
;; C/C++ configurations
(set-variable 'c-default-style "stroustrup")
;; ============================================================
;;  indentation
;; ------------------------------------------------------------
(add-hook 'c-mode-common-hook
          #'(lambda ()
              (turn-on-font-lock)
              (c-set-offset 'substatement-open 0)
              (c-set-offset 'case-label '+)
              ;;(c-set-offset 'arglist-cont-nonempty c-lineup-arglist))
              (setq show-trailing-whitespace t)))
;; ============================================================
