;; -*- lexical-binding: t -*-
(setq lexical-binding t)

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
;; (global-unset-key "\C-t")

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (global-set-key "\C-t\C-g" 'insert-function-header) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (global-set-key "\C-t\C-d" 'insert-debug) ;;
;; (global-set-key "\C-t\C-t" 'insert-test)  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'setnu)

;; resize man page to take up whole screen
(setq Man-notify 'bully)

;; close all buffers
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

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

(defun find-expand-file-path (search-path filename)
  "Returns full path of a file/directory/program
   If search-path is not given, filename will be treated
   as a program and search in PATH"
  (when (or (eq system-type 'gnu/linux) (eq system-type 'darwin))
    (if search-path
        (let ((path (shell-command-to-string
                     (format "find %s -iname \"%s\" 2>/dev/null" search-path  filename))))
          (unless (= (length path) 0) (substring path 0 -1)))
        (let ((path (shell-command-to-string (format "which %s 2>/dev/null" filename))))
          (unless (= (length path) 0) (substring path 0 -1))))))

(defun clean-tramp ()
  (interactive)
  (tramp-cleanup-all-connections)
  (kill-matching-buffers "*tramp"))

(defun kill-buffer-and-delete-frame ()
  (interactive)
  (kill-buffer-and-window)
  (previous-buffer)
  (delete-frame))

(defun align-to-comas (begin end)
  "Align region to coma"
  (interactive "r")
  (align-regexp begin end ",\\(\\s-*\\)" 1 1 t))

(defun align-to-dot-r (begin end)
  "Align region to ("
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)\\." 1 1 t))

(defun align-to-bars (begin end)
  "Align region to :"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)|" 1 1 t))

(defun align-to-= (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

(defun align-to-=> (begin end)
  "Align region to => (for vhdl)"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)=>" 1 1 ))

(defun align-to-<= (begin end)
  "Align region to <= (for vhdl)"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)<=" 1 1 ))

(defun align-to-: (begin end)
  "Align region to :"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\):" 1 1 ))

(defun vhdl-align-to--- (begin end)
  "Align region to --"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)--" 1 1 ))

(defun align-to-left-paren (begin end)
  "Align region to ("
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)(" 1 1 t))

(defun align-to-& (begin end)
  "Align region to &, for latex tables"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)&" 1 1 t))

(defun align-to-| (begin end)
  "Align region to |"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)\|" 1 1 t))


(defsubst add-paredit (mode-type)
  (define-key mode-type (kbd "(") 'paredit-open-round)
  (define-key mode-type (kbd ")") 'paredit-close-round)
  (define-key mode-type (kbd "[") 'paredit-open-square)
  (define-key mode-type (kbd "]") 'paredit-close-square)
  (define-key mode-type (kbd "{") 'paredit-open-curly)
  (define-key mode-type (kbd "}") 'paredit-close-curly)
  (define-key mode-type (kbd "M-0") 'paredit-escape) ;; also try : \

  (define-key mode-type (kbd "\"") 'paredit-doublequote)
  (define-key mode-type (kbd "\\") 'paredit-backslash)

  ;; ;; Can't have these for clojure mode
  ;; (define-key mode-type (kbd "RET") 'paredit-newline)
  ;; (define-key mode-type (kbd "<return>") 'paredit-newline)
  ;; (define-key mode-type (kbd "C-j") 'newline) ;; conflict with
  (define-key mode-type (kbd "C-<backspace>")  'delete-backward-char)
  (define-key mode-type (kbd "M-<backspace>")  'paredit-backward-kill-word)
  (define-key mode-type (kbd "C-M-<right>")      'forward-sexp)
  (define-key mode-type (kbd "C-M-<left>")       'backward-sexp)
  ;; (define-key mode-type (kbd "C-<return>") 'paredit-newline)

  ;; ;; nb: this assumes dvorak key layout
  ;; (define-key mode-type (kbd "C-k") 'kill-sexp)
  ;; (define-key mode-type (kbd "C-t") 'transpose-sexps)
  ;; (define-key mode-type (kbd "C-M-t") 'transpose-chars)
  (define-key mode-type (kbd "C-M-k") 'paredit-kill)
  ;; ;; (define-key mode-type (kbd "C-'") 'paredit-splice-sexp)
  ;; (define-key mode-type (kbd "C-M-l") 'paredit-recentre-on-sexp)
  ;; (define-key mode-type (kbd "C-,") 'paredit-backward-slurp-sexp)
  ;; (define-key mode-type (kbd "C-.") 'paredit-forward-slurp-sexp)
  ;; (define-key mode-type (kbd "C-<") 'paredit-backward-barf-sexp)
  ;; (define-key mode-type (kbd "C->") 'paredit-forward-barf-sexp)
  ;; ;; (define-key mode-type (kbd "C-/") 'backward-up-list)
  ;; (define-key mode-type (kbd "C-=") 'down-list)
  ;; ;; this may seem strange, but i often use the C-<whatever> motion
  ;; ;; commands in sequence to reformat code and having to take a finger off of control
  ;; ;; to add a return is a pain
  ;; (define-key mode-type (kbd "C-c .") 'etags-select-find-tag)
  (define-key mode-type (kbd "<backspace>") 'paredit-backward-delete))

