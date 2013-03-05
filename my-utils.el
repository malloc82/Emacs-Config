;; ===========================
;; Other Custom Functions
;; ===========================

;; print an ascii table

;; (defun ascii-table ()
;;   (interactive)
;;   (switch-to-buffer "*ASCII*")
;;   (erase-buffer)
;;   (insert (format "ASCII characters up to number %d.\n" 254))
;;   (let ((i 0))
;;     (while (< i 254)
;;       (setq i (+ i 1))
;;       (insert (format "%4d %c\n" i i))))
;;   (beginning-of-buffer))

;; insert functions
(global-unset-key "\C-t")

;; indent the entire buffer
(defun c-indent-buffer ()
  "Indent entire buffer of C source code."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (< (point) (point-max))
      (c-indent-command)
      (end-of-line)
      (forward-char 1))))

(defun insert-function-header () (interactive)
  (insert "  /**\n")
  (insert "   * \n")
  (insert "   * @param: \n")
  (insert "   * @return: \n")
  (insert "   */\n"))

(global-set-key "\C-t\C-g" 'insert-function-header)

(defun insert-file-header () (interactive)
  (insert "/**************************************/\n")
  (insert "/**\n")
  (insert " * \n")
  (insert " * Author: Ritchie Cai\n")
  (insert " */\n")
  (insert "/**************************************/\n"))

(defun insert-debug () (interactive)
  (insert "    /*=================> DEBUGGING STARTS */\n")
  (insert "    /*=================> DEBUGGING ENDS */\n"))

(defun insert-test () (interactive)
  (insert "    /*=================> TESTING */\n")
  (insert "    /*=================> END */\n"))

(global-set-key "\C-t\C-d" 'insert-debug)
(global-set-key "\C-t\C-t" 'insert-test)

;; (require 'setnu)

;; resize man page to take up whole screen
(setq Man-notify 'bully)

;; close all buffers
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; (setq ctags-bin "/home/optivus/rcai/bin/ctags") ;; <- your ctags path here

(defmacro mk-tag-func (dirlist &optional rootdir)
  ;; (setq ctags-bin "~/Installed/bin/ctags")
  ;; ;; On OS X Lion, ctags built by macport generate erroneous file format
  ;; ;; e.g. installed of file name, it's a blank space / tab,
  ;; ;;      or it could be a temp file name.
  ;; ;; Not sure why this happens but if I build ctags with CC=gcc-4.2 everything
  ;; ;; works fine.
  (setq ctags-bin "/opt/local/bin/ctags")
  (setq subdir "")
  (setq ctag-dir (if rootdir rootdir "."))
  (dolist (dir dirlist)
    (setq subdir (concat subdir (format " -R %s" dir))))
  `(lambda ()
     #'(lambda (ctags-command)
         "Create tags file."
         (interactive
          (list (read-shell-command (format "Run ctags (%s): " ,ctag-dir)
                                    (concat ,ctags-bin
                                            (format " --extra=+q --tag-relative=yes --append=no -f TAGS -e %s" ,subdir) nil))))
         ;; (let ((current-path (file-name-directory (buffer-file-name))))
         (let ((current-path (substring (pwd) 10))) ;; 10 charactors for  "Directory "
           (cd ,ctag-dir)
           (shell-command (concat ctags-command " &"))
           (visit-tags-table (concat ,rootdir "/TAGS"))
           (cd current-path)))))

(fset 'create-tags (funcall (mk-tag-func ("."))))
(fset 'create-tags-mri-old (funcall (mk-tag-func ("src"
                                                  "include"
                                                  "../common/include"
                                                  "../common/src") "~/repos/Thesis/Cuda/MRI_CPU/")))
(fset 'create-tags-thesis (funcall (mk-tag-func ("src"
                                                 "include"
                                                 "readtest") "~/repos/Master/Thesis")))


(defun c-insert-debug ()
  (interactive)
  (let ((begin "#ifdef DEBUG\n")
        (end   "\n#endif"))
    (goto-char (line-beginning-position)) (insert begin)
    (goto-char (line-end-position)) (insert end)))

(defun c-insert-debug-region ()
  (interactive)
  (let ((begin "#ifdef DEBUG\n")
        (end   "#endif\n"))
    (save-excursion
      (goto-char (region-beginning))
      (insert begin))
      (goto-char (region-end))
      (insert end)))

;; (defmacro create-project-cmd (project-name project-dir &optional subdir-list)
;;   (let ((fsets nil))
;;     (push `(fset (intern ,project-name) #'(lambda () (interactive) (dired ,project-dir))) fsets)
;;     (dolist (dir subdir-list)
;;       (push `(fset (intern (concat ,project-name "-" ,dir))
;;                    #'(lambda () (interactive) (dired (concat ,project-dir "/" ,dir)))) fsets))
;;     `(progn
;;        ,@fsets)))

(defmacro create-project-cmd (project-name project-dir &optional subdir-list)
  (let ((fsets
          (mapcar
           #'(lambda (dir)
               `(fset
                 (intern (concat ,project-name "-" ,dir))
                 #'(lambda ()
                     (interactive) (dired (concat ,project-dir "/" ,dir)))))
           subdir-list)))
    (push `(fset (intern ,project-name) #'(lambda () (interactive) (dired ,project-dir))) fsets)
    `(progn
       ,@fsets)))
(create-project-cmd "repos" "~/repos/" ("Programming" "Portfolio" "Resume"))
(create-project-cmd "rebus" "~/repos/Rebus/src/")

(defun load-current-buffer ()
  (let ((curr-file (buffer-file-name (current-buffer))))
    (load-file curr-file)))

(defun load-current-buffer-p ()
  (interactive)
  (when (y-or-n-p (message "Load current buffer? "))
    (if (buffer-file-name) (save-buffer (current-buffer)))
    (load-current-buffer)))

(defun edit-profile (&optional profile)
  (interactive)
  (let ((profile (if profile profile
                    (cond ((string= system-type "darwin")
                           "~/.profile")
                          ((string= system-type "gnu/linux")
                           "~/.bash_profile")))))
    (find-file profile)))

(require 'ediff)
(defun ediff-current-buffer-revision () 
  "Run Ediff to diff current buffer's file against VC depot. 
Uses `vc.el' or `rcs.el' depending on `ediff-version-control-package'.
source: http://stackoverflow.com/questions/3712834/getting-vc-diff-to-use-ediff-in-emacs-23-2" 
  (interactive) 
  (let ((file (or (buffer-file-name) 
                  (error "Current buffer is not visiting a file")))) 
    (if (and (buffer-modified-p) 
             (y-or-n-p (message "Buffer %s is modified. Save buffer? " 
                                (buffer-name)))) 
        (save-buffer (current-buffer))) 
    (ediff-load-version-control) 
    (funcall 
     (intern (format "ediff-%S-internal" ediff-version-control-package)) 
     "" "" nil)))

(defun m-expand-prog-path (program)
  "Returns full PROGRAM path"
  (when (or (eq system-type 'gnu/linux) (eq system-type 'darwin))
    (let ((path (shell-command-to-string (format "which %s" program))))
      (unless (= (length path) 0) (substring path 0 -1)))))

(defun clean-tramp ()
  (interactive)
  (tramp-cleanup-all-connections)
  (kill-matching-buffers "*tramp"))

(defun kill-buffer-and-delete-frame ()
  (interactive)
  (kill-buffer-and-window)
  (previous-buffer)
  (delete-frame))
