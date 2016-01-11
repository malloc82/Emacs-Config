;; -*- mode: Lisp; lexical-binding: t -*-
(setq lexical-binding t)

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

;; settings to run ctags to generate tag table

(defvar ctags-bin "/opt/local/bin/ctags")
(defvar ctags-project-folder nil)
(defvar ctags-tag-file nil)
(defvar ctags-sources nil)
(defvar ctags-command nil)

(defun ctags-new (cmd)
  "Create tags file."
  (interactive
   (let* (;; (bin (read-file-name "ctags path: "
          ;;                      (file-name-directory ctags-bin)
          ;;                      "ctags"))
          (folder (expand-file-name
                   (file-name-as-directory
                    (read-directory-name "Project folder: "))))
          (files    (read-string "Source files: " nil 'minibuffer-history))
          (language (read-string "Language: " nil 'minibuffer-history "Lisp")))
     ;; (setq ctags-bin bin)
     (setq ctags-project-folder folder)
     (setq ctags-tag-file (concat folder ".tags"))
     (setq ctags-sources (mapconcat (lambda (s) (concat folder s)) (split-string files) " "))
     (list (read-shell-command "Run ctags command: "
                               (format "%s --extra=+q --tag-relative=yes --language-force=%s --append=no -f %s -e -R %s"
                                       ctags-bin language ctags-tag-file ctags-sources) nil))))
  (setq ctags-command cmd)
  (let ((cmd-tokens (split-string ctags-command)))
    (when (equal (apply #'call-process
                        (first cmd-tokens) nil (format "*new ctags: %s*" ctags-project-folder) nil
                        (rest cmd-tokens))
                 0)
      (visit-tags-table ctags-tag-file))))

(defun ctags-update ()
  (interactive)
  (let ((proc-name  "Update ctags")
        (buf-name   (format "*update ctags: %s" ctags-project-folder)))
   (cond
     ((null ctags-project-folder) (start-process proc-name buf-name
                                                 "echo" "Error: cannot update ctags, project folder is not defined."))
     ((null ctags-command) (start-process proc-name buf-name
                                          "echo" "Error: cannot update ctags, ctags command is not defined."))
     (t (let ((cmd-tokens (split-string ctags-command)))
          (when (equal (apply #'call-process (first cmd-tokens) nil buf-name nil
                              (rest cmd-tokens))
                       0)
            (visit-tags-table ctags-tag-file)))))))

