(setq eshell-aliases-file "~/.emacs.d/eshell-alias")

(setenv "TERM" "eterm")
;; (setenv "GIT_PAGER" "less -FRSX")
;; (setenv "GIT_PAGER" "")

(defun eshell/ld-eshell () (load-file "~/.emacs.d/my-eshell.el"))

(defun eshell/ed-eshell () (find-file "~/.emacs.d/my-eshell.el"))

(defun eshell/tcm ()
  (cd "~/repos/Thesis/Cuda/MRI_CPU"))

(setenv "PATH" (concat (getenv "PATH") ":/opt/local/libexec/git-core"))

(defun eshell/emacs (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      ;; If I just ran "emacs", I probably expect to be launching
      ;; Emacs, which is rather silly since I'm already in Emacs.
      ;; So just pretend to do what I ask.
      (bury-buffer)
      ;; We have to expand the file names or else naming a directory in an
      ;; argument causes later arguments to be looked for in that directory,
      ;; not the starting directory
      (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))

(defun eshell/vi (&rest args)
  "Invoke `find-file' on the file.
    \"vi +42 foo\" also goes to line 42 in the buffer."
  (while args
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
        (let* ((line (string-to-number (match-string 1 (pop args))))
               (file (pop args)))
          (find-file file)
          (goto-line line))
        (find-file (pop args)))))


(defun eshell/ssh (&rest args)
  "Secure shell"
  (let ((cmd (eshell-flatten-and-stringify
              (cons "ssh" args)))
        (display-type (framep (selected-frame))))
    (cond
     ((and
       (eq display-type 't)
       (getenv "STY"))
      (send-string-to-terminal (format "\033]83;screen %s\007" cmd)))
     ((eq display-type 'x)
      (eshell-do-eval
       (eshell-parse-command
	(format "rxvt -e %s &" cmd)))
      nil)
     (t
      (apply 'eshell-exec-visual (cons "ssh" args))))))

(defun eshell/git (&rest args)
  (apply 'eshell-exec-visual (cons "git" args)))

;; (defun eshell/hg (&rest args)
;;   (apply 'eshell-exec-visual (cons "hg" args)))
