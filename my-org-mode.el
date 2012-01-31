
(require 'org)

(add-hook 'org-mode-hook
          #'(lambda ()
              ;; (add-to-list 'load-path "~/.emacs.d/org-mode")
              ;; (require 'org-install)
              (define-key org-mode-map "\C-cl" 'org-store-link)
              (define-key org-mode-map "\C-ca" 'org-agenda)
              ;; unset keys for switching buffers
              (define-key org-mode-map (kbd "M-S-<right>") nil)
              (define-key org-mode-map (kbd "M-S-<left>")  nil)
              (define-key org-mode-map (kbd "M-S-<up>")    nil)
              (define-key org-mode-map (kbd "M-S-<down>")  nil)
              ;; new bindings for above functions
              (define-key org-mode-map (kbd "M-S-l") 'org-shiftmetaright)
              (define-key org-mode-map (kbd "M-S-h") 'org-shiftmetaleft)
              (define-key org-mode-map (kbd "M-S-k") 'org-shiftmetaup)
              (define-key org-mode-map (kbd "M-S-j") 'org-shiftmetadown)

              
              ;;(setq org-log-done t)
              (setq org-log-done 'time)
              ;;(setq org-log-done 'note)

              ;; (add-hook 'org-mode-hook 
              ;;           (lambda () (setq truncate-lines nil)))

              (setq org-hide-leading-stars t)
              (setq org-odd-levels-only t)
              (setq org-return-follows-link t)
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
              ))

