;; cfm.el
;;; cfm.el --- Displays the current function or method on the mode-line
;; Copyright (C) 2006-2011 Davin Pearson
;; Author/Maintainer: Davin Pearson http://www.davinpearson.com
;; Keywords: Current Function method
;; Version: 1.0
;;; Commentary:
;; This code causes the current function Elisp/C/C++ or method (Java)
;; to be shown in the mode line.
;;; Limitation of Warranty
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.
;;; Install Instructions:
;; See the following URL for the latest info and a tarball:
;; http://davin.50webs.com/research/2006/mopa2e.html#cfm
;; Extract the file in the above-mentioned tarball and put it
;; somewhere in load-path and load it by putting the following
;; command in your .emacs file:
;;
;; (require 'cfm)
;;; Known Bugs:
;; none so far!
;;(global-set-key [(control return)] 'cfm--announce)
;;(global-set-key [(shift return)]   'cfm--announce)
;;(global-set-key [(meta return)]    'cfm--announce)
;;(global-set-key [(control return)] nil)
;;(global-set-key [(shift return)]   nil)
;;(global-set-key [(meta return)]    nil))
;;(make-local-variable 'cfm--class::method)
;;(make-variable-buffer-local 'cfm--class::method)
;;; (aref "abc" 0)
;;; (setq cfm--class::method " Foo::bar")
;;; (setq cfm--class::method nil)
(defun cfm--announce ()
  (interactive)
  (cfm--set)
  (cond
   ((not cfm--class::method)
    (message "Class::method = nil"))
   ((eq (aref cfm--class::method 0) ? )
    (message "Class::method =%s" cfm--class::method))
   (t
    (message "Class::method = %s" cfm--class::method)))
  ;;(redraw-frame (car (frame-list)))
  )
;;;
;;; FIXME: get current method name......
;;;
;;; BUGGER: errors don't get announced by idle timer
;;;
(defun cfm--set ()
  (interactive)
  ;;(debug)
  (if (and (not (eq major-mode 'c-mode))
           (not (eq major-mode 'c++-mode))
           (not (eq major-mode 'java-mode)))
      (setq cfm--class::method nil)
    (let ((class (cfm--get-class)))
      (if class
          (let ((method (or (cfm--get-method) "<No Method>")))
            (setq cfm--class::method (concat " " class "::" method)))
        (setq cfm--class::method (concat " ::" (cfm--get-class::method))))
      (force-mode-line-update) ;;; better than updating the entire
      frame....
      ))
  (when (eq major-mode 'emacs-lisp-mode)
    ;;(message "foo")
    (setq cfm--class::method (cfm--get-defun))
    (force-mode-line-update)))
(defun cfm--get-defun ()
  ;;(message "foo")
  (save-excursion
    ;;(debug)
    (let ((p (point)))
      (when (re-search-backward "^(\\(defun\\|defmacro\\) \\([a-zA-
Z0-9-]+\\)" nil t)
        (setq function (buffer-substring-no-properties (match-beginning 2) (match-end 2)))
        (if (not (looking-at "("))
            (re-search-backward "(" nil t))
        (forward-sexp 1)
        (when (> (point) p)
          (concat " " function)
          )))))
;;(global-set-key [kp-enter] 'cfm--set)
;;(global-set-key [kp-enter] 'cfm--announce)
(setq cfm--timer (run-with-idle-timer 1 t 'cfm--set))
;; (cancel-timer cfm--timer)
;;(run-with-idle-timer 2 t 'd-foo)
;; (setq timer-idle-list nil)
(defun cfm--inside (orig)
  (save-excursion
    (assert (looking-at "{"))
    (forward-sexp 1)
    (< orig (point))))
(defun cfm--get-class ()
  (let ((case-fold-search nil)
        (orig             (point))
        (class            nil))
    (save-excursion
      (if (not (re-search-backward "^\\([A-Za-z]+[ \t]+\\)*\\(class\\|interface\\)[ \t]" nil t))
          nil
        (assert (re-search-forward "\\<\\(class\\|interface\\)\\>" (point-at-eol) t))
        (skip-chars-forward " \t")
        (setq class (buffer-substring-no-properties (point) (save-excursion
                                                             (skip-chars-forward "_A-Za-z0-9-")
                                                             (point))))
        ;;(error "smeg")
        (beginning-of-line)
        (forward-line 1)
        (if (and (looking-at "{") (cfm--inside orig))
            class)))))
(quote defun cfm--get-method ()
       (let ((case-fold-search nil)
             (method           nil))
         (save-excursion
           (if (not (re-search-backward (concat "^" (make-string c-basic-offset ? )  "{") nil t))
               nil
             (let ((bra (point)))
               (if (not (re-search-backward ")" nil t))
                   nil
                 (forward-char 1)
                 (backward-sexp 1)
                 (setq end-of-method-name (point))
                 (skip-chars-backward "~a-zA-Z0-9_")
                 (setq method (buffer-substring-no-properties (point)
                                                              end-of-method-name))
                 (goto-char bra)
                 (if (cfm--inside orig)
                     method)))))))
(defun cfm--get-method ()
  (let ((case-fold-search nil)
        (orig             (point))
        (bra              nil)
        (end              nil)
        (done             nil))
    (save-excursion
      (if (not (re-search-backward (concat "^" (make-string c-basic-offset ? )  "{") nil t))
          nil
        (skip-chars-forward " \t")
        (setq bra (point))
        (assert (looking-at "{"))
        (when (cfm--inside orig)
          (beginning-of-line)
          (forward-line -1)
          (while (not (looking-at (concat "^" (make-string c-basic-offset ? ) "[^ ]")))
            (forward-line -1))
          (when (search-forward "(" bra t)
            (forward-char -1)
            (setq end (point))
            ;;(beginning-of-line)
            ;;(skip-chars-forward " \t")
            (if (search-backward "operator" (point-at-bol) t)
                (skip-chars-backward "a-zA-Z0-9_") ;; skip over
              operator
              ;;(end-of-line)
              (search-forward "(")
              (forward-char -1)
              (skip-chars-backward "a-zA-Z0-9_"))
            (d-trim-string (buffer-substring-no-properties (point)
                                                           end))
            )
          )
        )
      )
    )
  )
(defun cfm--get-class::method ()
  (let ((case-fold-search nil)
        (bra              nil)
        (orig             (point))
        (end              nil)
        )
    (save-excursion
      (when (and (re-search-backward "^{" nil t) (cfm--inside orig))
        (setq bra (point))
        (assert (looking-at "{"))
        (forward-line -1)
        (while (looking-at "^[ \t]+")
          (forward-line -1))
        (if (looking-at "^STAR_OK")
            (re-search-forward "(" nil t))
        (when (re-search-forward "(" bra t)
          (forward-char -1)
          (setq end (point))
          (skip-chars-backward "_A-Za-z0-9")
          (if (d-delta-looking-at "~" -1)
              (forward-char -1))
          (if (d-delta-looking-at "::" -2)
              (progn
                (forward-char -2)
                (skip-chars-backward "_A-Za-z0-9")
                ;;(d-foo)
                (buffer-substring-no-properties (point) end))
            ;;(d-foo)
            (buffer-substring-no-properties (point) end)))))))
;;;
;;; last
;;;
;;(setcar (last mode-line-format) 'cfm--class::method)
;;(setcdr (last mode-line-format) (cons "-%-" nil))
;;;
;;; first
;;;
;;(setcar mode-line-format 'cfm--class::method)
;;(setq-default mode-line-format (cons "-" mode-line-format))
;;(setq minor-mode-alist (cons '(t cfm--class::method) minor-mode-alist))
;;(last minor-mode-alist)
;;(setcdr (last minor-mode-alist) (cons '(t cfm--class::method) nil))
(setq minor-mode-alist (cons '(t cfm--class::method) minor-mode-alist))
;;(setq cfm--class::method " Foo::smeg")
;;(setq cfm--class::method " Peek::poke")
(provide 'cfm)
