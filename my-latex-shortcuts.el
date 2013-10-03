;; -*- lexical-binding: t -*-

;; ;; Example function:

;; (defun begin-align ()
;;   (interactive)
;;   (insert "\\begin{align}\n\n")
;;   (insert "\\end{align}\n")
;;   (forward-line -2))


;; Need to make sure the alignment is good for each inserted lines
(defmacro make-latex-block (bname)
  (let ((function-name  (format "begin-%s" bname))
        (begin-block    (format "\\begin{%s}\n\n" bname))
        (end-block      (format "\\end{%s}\n" bname)))
    `(defun ,(intern function-name) ()
       (interactive)
       (insert ,begin-block)
       (insert ,end-block)
       (forward-line -2))))

(make-latex-block "document")

;; LaTeX equations
(make-latex-block "equation")
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
(make-latex-block "figure")
(make-latex-block "minifigure")
