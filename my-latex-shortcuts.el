;; -*- lexical-binding: t -*-


;; ============================
;; AUCTeX Settings
;; ============================

;; (let ((tex-site-dir  nil))
;;   (cond ((string= system-type "darwin")
;;          (setq tex-site-dir
;;                (concat invocation-directory "../Resources/site-lisp/tex-site.el")))
;;         ((string= system-type "gnu/linux")
;;          (when (string-match "\\.\\([[:digit:]]\\)*$" emacs-version)
;;            (setq tex-site-dir
;;                  (concat invocation-directory "../share/emacs/" (replace-match "" nil nil emacs-version) "/site-lisp/tex-site.el"))))
;;         )
;;   (when (and tex-site-dir (file-exists-p tex-site-dir))
;;     (message "==> AUCTeX is installed, loading tex settings")
;;     (message "==> tex-site.el: %s" tex-site-dir)


;; (add-to-list 'load-path "~/.emacs.d/auctex/")
(require 'tex-site)
(setq LaTeX-command "latex -file-line-error")
(setq LaTeX-math-menu-unicode t)

(cond ((string= system-type "darwin")
       (setq TeX-output-view-style
             (quote (("^dvi$" "." "simpdftex --maxpfb %o") ("^pdf$" "." "open %o") ("^html?$" "." "open %o"))))
       ;; (setq TeX-view-program-list
       ;;       (quote (("Preview" "preivew %o") ("simpdftex" "simpdftex --maxpfb %o"))))
       (setq TeX-view-program-list
             (quote (("Preview" "preivew %o")
                     ("simpdftex" "simpdftex --maxpfb %o")
                     ("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))))
       (setq TeX-view-program-selection
             (quote ((output-dvi "simpdftex")
                     ;; (output-pdf "Preview")
                     (output-pdf "PDF Viewer")
                     (output-html "xdg-open")))))
      (t
       (setq TeX-output-view-style
             (quote (("^dvi$" "." "kdvi %o") ("^pdf$" "." "open %o") ("^html?$" "." "open %o"))))
       (setq TeX-view-program-list
             (quote (("kdvi" "kdvi  %o"))))
       (setq TeX-view-program-selection
             (quote ((output-dvi "kdvi") (output-pdf "Evince") (output-html "xdg-open")))))
      )
(setq load-path (append '("~/.emacs.d/auto-complete-auctex") load-path))
(require 'auto-complete-auctex)
;;     )
;;   )



;; (setq TeX-view-program-list '(("Preview" "preview %u") ("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %q")))
;; (setq TeX-view-program-selection (quote ((output-pdf "Preview") ((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-html "xdg-open"))))




;; ;; Example function:

;; (defun begin-align ()
;;   (interactive)
;;   (insert "\\begin{align}\n\n")
;;   (insert "\\end{align}\n")
;;   (forward-line -2))


;; Need to make sure the alignment is good for each inserted lines
(defmacro make-latex-block (bname &optional p1 p2)
  (let* ((p1 (if (null p1) "" p1))
         (p2 (if (null p2) "" p2))
         (function-name  (format "begin-%s" bname))
         (begin-block    (format "\\begin{%s}%s%s\n" bname p1 p2))
         (end-block      (format "\\end{%s}" bname)))
    `(defun ,(intern function-name) ()
       (interactive)
       (indent-according-to-mode) (insert ,begin-block)
       (indent-according-to-mode)
       (save-excursion
         (newline)
         (insert ,end-block)
         (indent-according-to-mode)))))

(make-latex-block "document")

;; LaTeX equations
(make-latex-block "equation")
(make-latex-block "eqnarray")
(make-latex-block "eqnarray*")
(make-latex-block "align")
(make-latex-block "align*")
(make-latex-block "dcases")
(make-latex-block "cases")
(make-latex-block "cases*")
(make-latex-block "rcases")
(make-latex-block "rcases*")

;; LaTeX matrices
(make-latex-block "array")
(make-latex-block "matrix")

(make-latex-block "bmatrix")
(make-latex-block "bmatrix*")

(make-latex-block "Bmatrix")
(make-latex-block "Bmatrix*")

(make-latex-block "pmatrix")
(make-latex-block "pmatrix*")

(make-latex-block "vmatrix")
(make-latex-block "vmatrix*")

(make-latex-block "Vmatrix")
(make-latex-block "Vmatrix*")

(make-latex-block "smallmatrix")

;; LaTeX list structures
(make-latex-block "itemize")
(make-latex-block "enumerate")
(make-latex-block "description")
(make-latex-block "easaylist")

;; LaTeX figures
(make-latex-block "figure" "[!h]")
(make-latex-block "minipage" "[b]"
                  "{5in}")

;; LaTeX tables
(make-latex-block "tabular")

(require 'smartparens)
(require 'smartparens-latex)

(add-hook 'LaTeX-mode-hook
          '(lambda ()
            (smartparens-mode 1)))

(add-hook 'LaTeX-mode-hook
          '(lambda ()
            (push
             '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
               :help "Run latexmk on file")
             TeX-command-list)))

(add-hook 'TeX-mode-hook
          '(lambda ()
            (setq TeX-command-default "latexmk")))


;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
;; (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
;; (setq TeX-view-program-list
;;      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; (server-start); start emacs in server mode so that skim can talk to it
