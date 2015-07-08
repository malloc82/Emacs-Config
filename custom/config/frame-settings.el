;; -*- mode: Lisp -*-
;; Frame settings

;; (setq special-display-buffer-names '("*compilation*"
;;                                      "*ASCII*"
;;                                      "*Process List*"
;;                                      "*Buffer List*"
;;                                      "*TeX Help*"
;;                                      "*Async Shell Command*"))

(setq special-display-buffer-names '("*compilation*"))
(setq special-display-regexps '("\\*magit-diff:[^*]+\\*"))
(setq special-display-function
      (lambda (buffer &optional args)
        (when (one-window-p)
          (split-window nil nil t)
          (get-buffer-window buffer 0))
        ;; (switch-to-buffer buffer)
        ))
(setq display-buffer-reuse-frames t)
(setq pop-up-frames nil)
(setq pop-up-windows nil)

(add-to-list
 'display-buffer-alist
 '("\\*compilation\\*" . (display-buffer-reuse-window
                          . ((reusable-frames . t)))))
