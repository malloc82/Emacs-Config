;;; parenface.el --- Provide a face for parens in lispy modes.

;; Author: Dave Pearson <davep@davep.org>
;; Version: 1.3
;; Maintainer: Grant Rettke

;; Add a paren-face to emacs and add support for it to the various lisp modes.
;;
;; Based on some code that Boris Schaefer <boris@uncommon-sense.net> posted
;; to comp.lang.scheme in message <87hf8g9nw5.fsf@qiwi.uncommon-sense.net>.
;;
;; Log:
;; Modifications by Grant Rettke <grettke@acm.org>, November 2012 only to add support for editor and REPL modes for:
;; Clojure (and nREPL), IELM, Jess and inferior-jess.
;; 2014-01-01 add support for [] {} by Zhao Wei <kaihaosw@gmail.com>
;;
;; Usage:
;; (eval-after-load 'parenface
;;   (progn
;;     (set-face-foreground 'parenface-paren-face "SteelBlue4")
;;     (set-face-foreground 'parenface-bracket-face "SteelBlue4")
;;     (set-face-foreground 'parenface-curly-face "SteelBlue4")))

(defvar parenface-paren-face 'parenface-paren-face)
(defvar parenface-bracket-face 'parenface-bracket-face)
(defvar parenface-curly-face 'parenface-curly-face)

(defface parenface-paren-face
    '((((class color))
       (:foreground "DimGray")))
  "Face for displaying a paren."
  :group 'faces)

(defface parenface-bracket-face
    '((((class color))
       (:foreground "DimGray")))
  "Face for displaying a bracket."
  :group 'faces)

(defface parenface-curly-face
    '((((class color))
       (:foreground "DimGray")))
  "Face for displaying a curly brace."
  :group 'faces)

(defmacro paren-face-add-support (keywords)
  "Generate a lambda expression for use in a hook."
  `(lambda ()
    (let* ((re0 "(\\|)")
           (re1 "\\[\\|]")
           (re2 "{\\|}")
           (match0 (assoc re0 ,keywords))
           (match1 (assoc re1 ,keywords))
           (match2 (assoc re2 ,keywords)))
      (unless (eq (cdr match0) parenface-paren-face)
        (setq ,keywords (append (list (cons re0 parenface-paren-face)) ,keywords)))
      (unless (eq (cdr match1) parenface-bracket-face)
        (setq ,keywords (append (list (cons re1 parenface-bracket-face)) ,keywords)))
      (unless (eq (cdr match2) parenface-curly-face)
        (setq ,keywords (append (list (cons re2 parenface-curly-face)) ,keywords))))))

(defun paren-face-add-keyword ()
  "Adds paren-face support to the mode."
  (font-lock-add-keywords nil '(("(\\|)" . parenface-paren-face)
                                ("\\[\\|]" . parenface-bracket-face)
                                ("{\\|}" . parenface-curly-face))))

;; Keep the compiler quiet.
(eval-when-compile
  (defvar clojure-font-lock-keywords nil)
  (defvar jess-font-lock-keywords)
  (defvar lisp-font-lock-keywords-2 nil)
  (defvar scheme-font-lock-keywords-2 nil))

(add-hook 'clojure-mode-hook          (paren-face-add-support clojure-font-lock-keywords))
(add-hook 'cider-repl-mode-hook       'paren-face-add-keyword)
(add-hook 'nrepl-mode-hook            'paren-face-add-keyword)
(add-hook 'emacs-lisp-mode-hook       (paren-face-add-support lisp-font-lock-keywords-2))
(add-hook 'ielm-mode-hook             'paren-face-add-keyword)
(add-hook 'inferior-jess-mode-hook    'paren-face-add-keyword)
(add-hook 'jess-mode-hook             (paren-face-add-support jess-font-lock-keywords))
(add-hook 'lisp-interaction-mode-hook (paren-face-add-support lisp-font-lock-keywords-2))
(add-hook 'lisp-mode-hook             (paren-face-add-support lisp-font-lock-keywords-2))
(add-hook 'scheme-mode-hook           (paren-face-add-support scheme-font-lock-keywords-2))
(add-hook 'inferior-scheme-mode-hook  (paren-face-add-support scheme-font-lock-keywords-2))
(add-hook 'cmuscheme-load-hook        (paren-face-add-support scheme-font-lock-keywords-2))
(add-hook 'slime-repl-mode-hook       'paren-face-add-keyword)
(add-hook 'arc-mode-hook              (paren-face-add-support arc-font-lock-keywords-2))
(add-hook 'inferior-arc-mode-hook     (paren-face-add-support arc-font-lock-keywords-2))

(provide 'parenface)

;;; parenface.el ends here
