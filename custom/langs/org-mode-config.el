
(setq org-replace-disputed-keys t)
(setq org-support-shift-select t)

(setq org-log-done 'time)

(setq org-hide-leading-stars t)
(setq org-odd-levels-only t)
(setq org-return-follows-link t)

(define-key org-mode-map (kbd "C-c l") 'org-store-link)
(define-key org-mode-map (kbd "C-c a") 'org-agenda)

(define-key org-mode-map (kbd "C-S-f") 'org-shiftright)
(define-key org-mode-map (kbd "C-S-b") 'org-shiftleft)
(define-key org-mode-map (kbd "C-S-p") 'org-shiftup)
(define-key org-mode-map (kbd "C-S-n") 'org-shiftdown)

(define-key org-mode-map (kbd "S-<right>") 'windmove-right)
(define-key org-mode-map (kbd "S-<left>")  'windmove-left)
(define-key org-mode-map (kbd "S-<up>")    'windmove-up)
(define-key org-mode-map (kbd "S-<down>")  'windmove-down)

(setq-local show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace nil 'local)
