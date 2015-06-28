;; -*- mode: emacs-lisp -*- 
;; Custom faces

(defface esk-paren-face
    '((((class color) (background dark)) (:foreground "grey50"))
      (((class color) (background light)) (:foreground "grey55")))
  "Face used to dim parentheses."
  :group 'starter-kit-faces)

;; font-lock-number-face
(make-face 'font-lock-number-face)
(setq font-lock-number-face 'font-lock-number-face)
(setq number-mode-list '(c-mode-hook
                         c++-mode-hook
                         lisp-mode-hook
                         clojure-mode-hook
                         emacs-lisp-mode-hook
                         python-mode-hook
                         cperl-mode-hook))
(dolist (mode number-mode-list)
  (add-hook mode
            '(lambda ()
              (font-lock-add-keywords nil
               '(("\\<\\([0-9]+\\([eE][+-]?[0-9]*\\)?\\|0[xX][0-9a-fA-F]+\\|[+-]?[0-9]+\\(.[0-9]*\\)?\\)\\>" .
                  font-lock-number-face))))))
