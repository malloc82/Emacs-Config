
;; (add-to-list 'load-path "~/.emacs.d/org-mode")
;; (require 'org-install)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;;(setq org-log-done t)
(setq org-log-done 'time)
;;(setq org-log-done 'note)

;; (add-hook 'org-mode-hook 
;;           (lambda () (setq truncate-lines nil)))

(setq org-hide-leading-stars t)
(setq org-odd-levels-only t)
    
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "TASK(t)" "ACTIVE(a)" "PENDING(p)" "REVIEW(r)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(d)")
        (sequence "|" "CANCELLED(c)")))

;; TODO        : stuffs need to be done
;; ACTIVE      : currently active
;; TEST        : waiting to be tested
;; PENDING     : suspended task
;; REVIEW      : need to be reviewed  
;; DONE        : finished task
;; CANCELLED   : Cancelled task
;; STUCK       : Cannot be continued 

(setq org-todo-keyword-faces
      '(("TODO"        . org-warning)
        ("TASK"        . org-warning)
        ("ACTIVE"      . (:foreground "red" :weight bold))
        ("PENDING"     . (:foreground "magenta2" :weight bold))
        ("REVIEW"      . (:foreground "dodgerblue" :weight bold))        
        ("STUCK"       . (:foreground "Magenta" :weight bold))
        ("REPORT"      . org-warning)
        ("BUG"         . (:foreground "red" :weight bold))
        ("KNOWNCAUSE"  . (:foreground "dodgerblue" :weight bold))
        ("CANCELLED"   . shadow)))
