;; -*- mode: Emacs-Lisp -*-
;; Frame settings

;; (setq special-display-buffer-names '("*compilation*"
;;                                      "*ASCII*"
;;                                      "*Process List*"
;;                                      "*Buffer List*"
;;                                      "*TeX Help*"
;;                                      "*Async Shell Command*"))


;; ==================================== OLD SETTINGS ==========================================
;; (setq special-display-buffer-names '("*compilation*" "*Compile-Log*" "*cider-error*"))
;; (setq special-display-regexps '("\\*magit[^*:]*:[^*]*\\*"
;;                                 "\\*cider-repl[^*]*\\*"))
;; (setq special-display-function
;;       (lambda (buffer &optional args)
;;         (when (one-window-p)
;;           (let ((h (frame-height))
;;                 (w (frame-width)))
;;             (if (> w (* h 3))
;;                 (split-window nil nil 'right)
;;                 (split-window nil nil 'below))
;;             (get-buffer-window buffer 0)))
;;         ;; (switch-to-buffer buffer)
;;         ))
;; (setq display-buffer-reuse-frames t)
;; (setq pop-up-frames nil)
;; (setq pop-up-windows nil)

;; (add-to-list
;;  'display-buffer-alist
;;  '("\\*compilation\\*" . (display-buffer-reuse-window
;;                           . ((reusable-frames . t)))))



;; source: https://github.com/manuel-uberti/.emacs.d/blob/1663c6dcd773b1bcf07975819ead98a374557f24/lisp/mu-buffers.el#L44-L87
(setq display-buffer-alist
      `(;; Messages, errors, processes, Calendar in the bottom side window
        (,(rx bos (or "*Apropos"          ; Apropos buffers
                      "*Man"              ; Man buffers
                      "*Help"             ; Help buffers
                      "*Warnings*"        ; Emacs warnings
                      "*Process List*"    ; Processes
                      "*Proced"           ; Proced processes list
                      "*Compile-Log*"     ; Emacs byte compiler log
                      "*compilation"      ; Compilation buffers
                      "*Flycheck errors*" ; Flycheck error list
                      "*Calendar"         ; Calendar window
                      "*env-info"         ; Environment information
                      "*Cargo"            ; Cargo process buffers
                      "*Word"             ; WordNut buffers
                      (and (1+ nonl) " output*"))) ; AUCTeX command output
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . bottom)
         (reusable-frames . visible)
         (window-height . 0.45))
        ;; REPLs on the bottom half
        (,(rx bos (or "*cider-repl"     ; CIDER REPL
                      "*intero"         ; Intero REPL
                      "*idris-repl"     ; Idris REPL
                      "*ielm"           ; IELM REPL
                      "*SQL"))          ; SQL REPL
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . bottom)
         (reusable-frames . visible)
         (window-height . 0.50))
        ;; Open shell in a single window
        (,(rx bos "*shell")
         (display-buffer-same-window)
         (reusable-frames . nil))
        ;; Open PDFs in the right side window
        (,(rx bos "*pdf")
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (reusable-frames . visible)
         (window-width . 0.5))
        ;; Let `display-buffer' reuse visible frames for all buffers. This must
        ;; be the last entry in `display-buffer-alist', because it overrides any
        ;; previous entry with more specific actions.
        ("." nil (reusable-frames . visible))))
