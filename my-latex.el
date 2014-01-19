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


;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  

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

(require 'smartparens)
(require 'smartparens-latex)

(add-hook 'TeX-mode-hook
          '(lambda ()
            (setq compilation-auto-jump-to-first-error t)
            (outline-minor-mode 1)
            (smartparens-mode 1)
            (setq TeX-command-default "latexmk")
            (push
             '("latexmk"
               "latexmk -pdf %s"
               TeX-run-TeX nil t
               :help
               "Run latexmk on file")
             TeX-command-list)
            (push
             '("Skim"
               "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"
               TeX-run-discard-or-function t t
               :help
               "Run Skim")
             TeX-command-list)))

;; ;; Example function:

;; (defun begin-align ()
;;   (interactive)
;;   (insert "\\begin{align}\n\n")
;;   (insert "\\end{align}\n")
;;   (forward-line -2))

;; Need to make sure the alignment is good for each inserted lines
(defmacro insert-latex-block (bname &optional p1 p2)
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

(defmacro insert-latex-line (lname &optional p1 p2)
  (let* ((p1 (if (null p1) "" p1))
         (p2 (if (null p2) "" p2))
         (cmd-name (format "%s" lname))
         (cmd (format "%s[%s]{%s}" lname p1 p2)))
    `(defun ,(intern cmd-name) ()
       (interactive)
       (indent-according-to-mode)
       (insert ,cmd))))

(insert-latex-block "document")

;; LaTeX equations
(insert-latex-block "equation")
(insert-latex-block "eqnarray")
(insert-latex-block "eqnarray*")
(insert-latex-block "align")
(insert-latex-block "align*")
(insert-latex-block "dcases")
(insert-latex-block "cases")
(insert-latex-block "cases*")
(insert-latex-block "rcases")
(insert-latex-block "rcases*")

;; LaTeX matrices
(insert-latex-block "array")
(insert-latex-block "matrix")

(insert-latex-block "bmatrix")
(insert-latex-block "bmatrix*")

(insert-latex-block "Bmatrix")
(insert-latex-block "Bmatrix*")

(insert-latex-block "pmatrix")
(insert-latex-block "pmatrix*")

(insert-latex-block "vmatrix")
(insert-latex-block "vmatrix*")

(insert-latex-block "Vmatrix")
(insert-latex-block "Vmatrix*")

(insert-latex-block "smallmatrix")

;; LaTeX list structures
(insert-latex-block "itemize")
(insert-latex-block "enumerate")
(insert-latex-block "description")
(insert-latex-block "easaylist")

;; LaTeX figures
(insert-latex-block "figure" "[!h]")
(insert-latex-block "minipage" "[b]" "{5in}")

(insert-latex-block "center")

;; LaTeX tables
(insert-latex-block "tabular")

;; Code listing
(insert-latex-block "lstlisting" "[language=<language>, caption={<commends>}]")

(insert-latex-line "includegraphics" "width=5in")
