(require 'org-ref)
(require 'org-tempo)
(require 'doi-utils)
(require 'ox-md)

(setq exec-path (append exec-path '("/Library/TeX/texbin")))
(load "auctex.el" nil t t)

(electric-pair-mode)
(setq-local electric-pair-inhibit-predicate
            (lambda (c)
                (if (char-equal c ?<) t (electric-pair-default-inhibit c))))

(setq org-blank-before-new-entry '((heading) (plain-list-item)))
(setq org-latex-prefer-user-labels t)

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

(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex  . t)
   (C      . t)
   (python . t)))


(setq-local show-trailing-whitespace t)


;; source: https://emacs.stackexchange.com/questions/34561/summing-properties-across-subheadings-org-mode
(defun org-sum-grade-in-labs ()
  "Add up all the Grade properties of headings underneath the current one
   The total is written to the Total property of this heading"
  (interactive)
  (org-entry-put (point) "Total"
                 (number-to-string
                  (let ((total 0))
                    (save-excursion
                      (org-map-tree
                       (lambda ()
                         (let ((n (org-entry-get (point) "Grade")))
                           (when (stringp n)
                             (setq total (+ total (string-to-number n))))))))
                    total))))


(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))

(advice-add 'org-archive-default-command :after #'org-save-all-org-buffers)

;; (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
