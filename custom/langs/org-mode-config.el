(require 'org-ref)
(require 'org-tempo)
(require 'org-pomodoro)
(require 'doi-utils)
;; (require 'ox-md)
(require 'ox-gfm nil t)
(require 'org-bullets)
(org-bullets-mode 1)

;; display '-' as "•"
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; (require 'org-journal)
(setq org-journal-file-format "%Y-Week-%2W.org")
(setq org-journal-file-type 'weekly)

(setq org-hide-emphasis-markers t)

(setq org-bullets-bullet-list
      '("◉"
        "○"
        "●"
        "➤"
        ;; "➩"
        ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶
        ;;  ► • ★ ▸
        ))
(setq exec-path (append exec-path '("/Library/TeX/texbin")))
(setq org-latex-create-formula-image-program 'dvipng)

(load "auctex.el" nil t t)
(turn-on-reftex)

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
;; (setq org-odd-levels-only t)
(setq org-return-follows-link t)

(setq org-agenda-files '("~/Documents/Journal/"))
;; also check: org-agenda-text-search-extra-files
;; (setq org-agenda-text-search-extra-files
;;       '(agenda-archives
;;         "~/org/subdir/textfile1.txt"
;;         "~/org/subdir/textfile1.txt"))

;; source: https://stackoverflow.com/questions/11384516/how-to-make-all-org-files-under-a-folder-added-in-agenda-list-automatically
;;         https://github.com/suvayu/.emacs.d/blob/master/lisp/nifty.el
;;
;; (defun sa-org-find-notes (&optional regexp)
;;   "Run occur on ORG files in the present directory, prompt for REGEXP."
;;   (interactive "MRegexp: ")
;;   (let* ((files (directory-files default-directory t "^[^.#].*\.org"))
;; 	 (regexp (or (unless (equal regexp "") regexp) "{{{\\(todo\\|note\\|mark\\)(")))
;;     (print files)
;;     (sa-multi-occur-files files regexp)))


(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling


(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

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

(setq org-src-tab-acts-natively t)
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


;; org-journal
(setq org-journal-dir "~/Documents/Journal")
(setq org-journal-date-format "%B %d, %A, %Y")
(setq org-journal-enable-agenda-integration t)



(require 'ob-clojure)
(setq org-babel-clojure-backend 'cider)
(require 'cider)
