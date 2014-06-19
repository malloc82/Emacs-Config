;; -*- mode: Lisp -*-
;; Frame settings

;; (setq special-display-buffer-names '("*compilation*"
;;                                      "*ASCII*"
;;                                      "*Process List*"
;;                                      "*Buffer List*"
;;                                      "*TeX Help*"
;;                                      "*Async Shell Command*"))

(setq special-display-buffer-names '("*compilation*"))
(setq special-display-function
      (lambda (buffer &optional args)
        (split-window)
        ;; (switch-to-buffer buffer)
        (get-buffer-window buffer 0)))
(setq display-buffer-reuse-frames t)
(setq pop-up-frames nil)
(setq pop-up-windows nil)
