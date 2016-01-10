;; -*- lexical-binding: t -*-
(setq lexical-binding t)

(setq ctags-bin "/opt/local/bin/ctags")
(setq ctags-project-folder "~/.")
(setq ctags-tag-file "./.tags")
(setq ctags-sources "")
(setq ctags-command nil)

(defun ctags-new (cmd)
  "Create tags file."
  (interactive
   (let* ((folder (expand-file-name
                   (file-name-as-directory
                    (read-directory-name "Project folder: "))))
          (files    (read-string "Source files: " nil 'minibuffer-history))
          (language (read-string "Language: " nil 'minibuffer-history "Lisp")))
     (setq ctags-project-folder folder)
     (setq ctags-tag-file (concat folder ".tags"))
     (setq ctags-sources (mapconcat (lambda (s) (concat folder s)) (split-string files) " "))
     (list (read-shell-command "Run ctags command: "
                               (format "%s --extra=+q --tag-relative=yes --language-force=%s --append=no -f %s -e -R %s"
                                       ctags-bin language ctags-tag-file ctags-sources) nil))))
  (setq ctags-command cmd)
  (apply 'start-process
         "Generate new ctag file"
         (format "*new ctags: %s*" ctags-project-folder)
         (split-string ctags-command)))


(defun ctags-update ()
  (interactive)
  (apply 'start-process
         "Update ctags"
         (format "*update ctags: %s*" ctags-project-folder)
         (split-string ctags-command)))
