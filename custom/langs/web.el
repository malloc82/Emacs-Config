;; -*- mode: Emacs-Lisp -*-
;; Web related langauges

;; ===========================
;; HTML/CSS stuff
;; ===========================
(setq html-mode-hook 'turn-off-auto-fill)
(autoload 'css-mode "css-mode")

;; take any buffer and turn it into an html file,
;; including syntax hightlighting
;; (require 'htmlize)

;; ===========================
;; JavaScript
;; ===========================
(add-hook 'javascript-mode-hook
          '(autoload 'javascript-mode "javascript" nil t))

