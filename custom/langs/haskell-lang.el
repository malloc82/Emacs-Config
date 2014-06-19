
(require 'haskell-mode)

(defun my-haskell-mode-save-buffer ()
  (interactive)
  (save-buffer)
  (inferior-haskell-load-file))

(turn-on-haskell-doc-mode)
(turn-on-haskell-indent)
(define-key haskell-mode-map (kbd "C-x C-s") 'my-haskell-mode-save-buffer)
