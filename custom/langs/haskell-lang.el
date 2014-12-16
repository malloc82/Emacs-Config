
(turn-on-haskell-doc-mode)
(turn-on-haskell-indent)
(interactive-haskell-mode)

(setq haskell-process-suggest-remove-import-lines t)
(setq haskell-process-auto-import-loaded-modules t)
(setq haskell-process-log t)

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`")     'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c")   'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC")     'haskell-mode-contextual-space)

;; (defun my-haskell-mode-save-buffer ()
;;   (interactive)
;;   (save-buffer)
;;   (inferior-haskell-load-file))
;; (define-key haskell-mode-map (kbd "C-x C-s") 'my-haskell-mode-save-buffer)

