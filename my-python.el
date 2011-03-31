;; ====================================================
;; python-mode-hook configuration
;; this file should be loaded in python-mode-hook
;; ====================================================

;; =======================
;; ipython
;; =======================

(require 'ipython)
(setq py-python-command-args '( "-colors" "Linux"))

;; ==========================
;; Pymacs, rope, ropemacs
;; ==========================
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)


(cond ((string= system-type "darwin")
       (eval-after-load "pymacs"
         '(add-to-list 'pymacs-load-path "/Library/Python/2.6/site-packages/Pymacs"))
       )
      ((string= system-type "gnu/linux")
       (eval-after-load "pymacs"
         '(add-to-list 'pymacs-load-path "~/lib/python2.7/site-packages/Pymacs"))
       )
      )

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; ===========================
;; python-mode extension 
;; ===========================

(outline-minor-mode 1)

(set-variable 'py-indent-offset 4)
(set-variable 'py-smart-indentation nil)
(set-variable 'indent-tabs-mode nil) 
;;(highlight-beyond-fill-column)
;;(define-key python-mode-map "\C-m" 'newline-and-indent)
(pabbrev-mode)
(abbrev-mode)

(set (make-variable-buffer-local 'beginning-of-defun-function)
     'py-beginning-of-def-or-class)
(setq outline-regexp "def\\|class ")
(load "py-mode-ext")  
(load "pyp")

(message "pymacs path : %s" pymacs-load-path)

(require 'pycomplete)

;; (define-key py-mode-map [f12] 'pyp)
;; (define-key py-mode-map "\C-c\C-c" 'py-execute-prog)
(define-key py-mode-map "\C-c\C-c" 'py-execute-buffer)
(define-key py-mode-map "\C-c\C-g" 'py-call-pdb)
(define-key py-mode-map "\C-c\C-w" 'pychecker)

;; previous command history M-p
;; next command history     M-n

(define-key global-map '[C-c C-r]  'py-execution-region)
