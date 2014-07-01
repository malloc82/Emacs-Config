;; -*- mode: Lisp -*-
;; Etags setting

(require 'etags-select)
;; (require 'etags-table)
(setq etags-select-mode t)

(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

(setq tags-revert-without-query t)

(defun jds-find-tags-file ()
  "recursively searches each parent directory for a file named 'TAGS' and returns the
path to that file or nil if a tags file is not found. Returns nil if the buffer is
not visiting a file"
  (progn
      (defun find-tags-file-r (path)
         "find the tags file from the parent directories"
         (let* ((parent (file-name-directory path))
                (possible-tags-file (concat parent "TAGS")))
           (cond
             ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
             ((string= "/TAGS" possible-tags-file) (error "no tags file found"))
             (t (find-tags-file-r (directory-file-name parent))))))

    (if (buffer-file-name)
        (catch 'found-it
          (find-tags-file-r (buffer-file-name)))
        (error "buffer is not visiting a file"))))

(defun jds-set-tags-file-path ()
  "calls `jds-find-tags-file' to recursively search up the directory tree to find
a file named 'TAGS'. If found, set 'tags-table-list' with that path as an argument
otherwise raises an error."
  (interactive)
  (setq tags-table-list (cons (jds-find-tags-file) tags-table-list)))

;; ;; delay search the TAGS file after open the source file
;; (add-hook 'emacs-startup-hook
;; 	'(lambda () (jds-set-tags-file-path)))
