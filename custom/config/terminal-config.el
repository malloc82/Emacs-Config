;; -*- mode: Lisp -*- 
;; Terminal inside emacs

(require 'multi-term)
(setq multi-term-program "/bin/bash")
(setq multi-term-switch-after-close nil)

(defun last-term-buffer (l)
  "Return most recently used term buffer."
  (when l
	(if (eq 'term-mode (with-current-buffer (car l) major-mode))
	    (car l) (last-term-buffer (cdr l)))))

(defun get-term ()
  "Switch to the term buffer last used, or create a new one if
    none exists, or if the current buffer is already a term."
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
	(if (or (not b) (eq 'term-mode major-mode))
	    (multi-term)
        (switch-to-buffer b))))

;; ;; used to change case sensitive for search including find-tag
;; (set-default 'case-fold-search nil)

;; (add-hook 'term-exec-hook 
;;             (lambda () 
;;               (set-buffer-process-coding-system 'binary 'binary)))

