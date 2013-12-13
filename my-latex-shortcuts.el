;; -*- lexical-binding: t -*-

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
