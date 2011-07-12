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
(setq ctags-bin "/opt/local/bin/ctags") ;; mac os x 

(defun mk-tag-func (dirlist &optional rootdir)
  (setq subdir "")
  (setq ctag-dir (if rootdir rootdir "."))
  (dolist (dir dirlist)
    (setq subdir (concat subdir (format " -R %s" dir))))
  ;; (message "ctags-dir = %s" ctags-dir)
  #'(lambda (ctags-command)
      "Create tags file."
      (interactive
       (list (read-shell-command (format "Run ctags (%s): " ctag-dir)
                                 (concat ctags-bin
                                         (format " --extra=+q --tag-relative=yes --append=no -f TAGS -e %s" subdir) nil))))
      ;; (let ((current-path (file-name-directory (buffer-file-name))))
      (let ((current-path (substring (pwd) 10)))
        (cd ctag-dir)
        (shell-command (concat ctags-command " &"))
        (cd current-path))
      )
  )

(fset 'create-tags (mk-tag-func '(".")))
(fset 'create-tags-mri (mk-tag-func '("src"
                                      "include"
                                      "../common/include"
                                      "../common/src") "~/repos/Thesis/Cuda/MRI_CPU/"))
