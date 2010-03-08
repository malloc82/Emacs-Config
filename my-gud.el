;; ===================================================================
;; Add color to the current GUD line (obrigado google)
;; ===================================================================

(defvar gud-overlay
  (let* ((ov (make-overlay (point-min) (point-min))))
    (overlay-put ov 'face 'secondary-selection)
    ov)
  "Overlay variable for GUD highlighting.")

(defadvice gud-display-line (after my-gud-highlight act)
           "Highlight current line."
           (let* ((ov gud-overlay)
                  (bf (gud-find-file true-file)))
             (save-excursion
                 (set-buffer bf)
                   (move-overlay ov (line-beginning-position) (line-end-position)
                                   (current-buffer)))))

(defun gud-kill-buffer ()
  (if (eq major-mode 'gud-mode)
    (delete-overlay gud-overlay)))

(add-hook 'kill-buffer-hook 'gud-kill-buffer)


;; =================================
;; GDB configuration 
;; =================================

;; (require 'gud)
;; (if (>= emacs-major-version 22)
;;     (progn
;;       (message "Loading GDB-ui")
;;       (require 'gdb-ui)))

;; (if (>= emacs-major-version 23)
;;     ;; (progn
;;     ;;   (setq gud-gdb-command-name "gdbtui -nw --annotat=3"))
;;     (progn
;;       (setq gud-gdb-command-name "gdb --annotat=3")))

(setq gdb-many-windows t)
(setq gdb-show-main t)
(setq gdb-use-separate-io-buffer t)

;;(add-hook 'gdb-mode-hook '(lambda () (require 'gdb-highlight)))

(add-hook 'gud-mode-hook
          '(lambda ()
            (local-set-key [home]        ; move to beginning of line, after prompt
             'comint-bol)
            (local-set-key [up]          ; cycle backward through command history
             '(lambda () (interactive)
               (if (comint-after-pmark-p)
                   (comint-previous-input 1)
                   (previous-line 1))))
            (local-set-key [down]        ; cycle forward through command history
             '(lambda () (interactive)
               (if (comint-after-pmark-p)
                   (comint-next-input 1)
                   (forward-line 1))))
            ))
