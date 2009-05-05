;;; jsp.el --- for editing Java Server Pages

;; Copyright (C) 2002 Jim Crossley

;; Author: Jim Crossley <crossley@charter.net>
;; Maintainer: Jim Crossley <crossley@charter.net>
;; Keywords: java, jsp

;; XEmacs is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Commentary:

;; Historically, editing JSP files in one of the popular Emacs HTML
;; modes is not fun.  Either custom tags are not indented correctly or
;; the evil, non-XML sections (delimited by <% and %>) mess up
;; indentation entirely.

;; PSGML mode is great for documents with DTD's, but it isn't
;; practical to define DTD's for JSP files, even when they're
;; well-formed XML, because any number of custom tag libraries can be
;; specified in the file, making the set of possible elements and/or
;; attributes infinite.  If present, the DOCTYPE declaration in a JSP
;; file specifies not the type of the file itself but of the resulting
;; document *after* the JSP processor has resolved the custom tags
;; into their "real" values.

;; This mode's approach to the problem is fairly simple.  It uses the
;; PSGML parse tree for indentation, but it prevents the PSGML parser
;; from discovering the DOCTYPE, forcing it to accept the
;; sgml-default-doctype-name for all JSP files.  The jsp-mode is a
;; derivative of PSGML's xml-mode, because with one glaring exception,
;; a well-written jsp file should be well-formed XML.  The exception,
;; of course, is the scriptlet, or essentially anything delimited by
;; <% and %>.

;; This mode features a very simple indentation scheme for JSP
;; scriptlets and JavaScript.  It indents according to "brace level",
;; i.e. it increments the indentation level when it finds an opening
;; brace '{' and decrements when it finds a closing brace '}'.  For it
;; to work, even single line statements should be enclosed by
;; braces. Obviously, complex javascript featuring switch statements
;; and the like will not indent properly.  One possible solution to
;; that problem would be to separate the complex javascript into its
;; own file (indented with cc-mode perhaps?) and include it using the
;; 'src' attribute of the <script> tag.

;;; Code:

(require 'psgml-parse)

;;; The JSP major mode
(define-derived-mode jsp-mode xml-mode "JSP"
  (cond
   (running-xemacs
    (require 'psgml-html)
    (put 'jsp-mode 'font-lock-defaults '(html-font-lock-keywords nil t))))
  (make-local-variable 'sgml-default-doctype-name)
  (setq sgml-default-doctype-name "jsp"
        indent-line-function 'jsp-indent-line
        sgml-indent-data t
        sgml-namecase-general t
	indent-tabs-mode nil)
  (sgml-setup-doctype sgml-default-doctype-name nil)
  (define-key jsp-mode-map "\r" 'reindent-then-newline-and-indent)
  )

;;; Indentation in JSP mode
(defun jsp-indent-line () 
  "Indent sgml-indent-step number of spaces fewer than sgml-indent-line."
  (let ((here (point-marker))
        (col (jsp-indent-with-and-without-xml))
        (level (or (jsp-inside-scriptlet) 0)))
    (when col 
      (beginning-of-line)
      (delete-horizontal-space)
      (indent-to (+ (- col sgml-indent-step) (* level sgml-indent-step))))
    (when (< (point) here)
      (goto-char here))))

;;; A bit of a hack to deal with the fact that entity refs can't
;;; appear in XML files, but can quite happily exist in JSP files.
(defun jsp-indent-with-and-without-xml () 
  "Try sgml-indent-line twice, once with sgml-xml-p true, and once with it false, and return its first non-nil value."
  (let ((sgml-throw-on-error 'parse-error)
        (val (catch sgml-throw-on-error
               (sgml-indent-line))))
    (unless val 
      (setq sgml-xml-p nil
            val (sgml-indent-line)
            sgml-xml-p t))
    val))

;;; Inside jsp scriptlet
(defun jsp-inside-scriptlet ()
  "Return true if point is within either <% %> or <script></script> tags."
  (if (jsp-at-scriptlet-delimiter)
      nil
    (save-excursion
      (let ((here (point))
            (bol (point-at-bol))
            (eol (point-at-eol)) 
            (before (search-backward-regexp "\\(<%[^=@-!]\\|<script\\)" nil t))
            (after (or (if (looking-at "<%") (search-forward "%>" nil t) (search-forward "</script>" nil t)) (point-max)))
            (level 1))
        (when (and before (> after here))
          (goto-char before)
          (while (< (point) bol) 
            (when (search-forward "{" bol 0)
              (incf level)))
          (goto-char before)
          (while (< (point) eol) 
            (when (search-forward "}" eol 0)
              (decf level)))
          level)))))

(defun jsp-at-scriptlet-delimiter ()
  "Return true if script delimiter is the only thing on current line"
  (save-excursion
    (back-to-indentation)
    (looking-at "\\(<%\\|%>\\|<%--\\|--%>\\|<script.*>\\|</script>\\)[ \t]*$")))
