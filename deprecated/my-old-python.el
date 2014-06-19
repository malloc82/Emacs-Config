;; ====================================================
;; python-mode-hook configuration
;; this file should be loaded in python-mode-hook
;; ====================================================

;; =======================
;; ipython
;; =======================

;; (require 'ipython) ;; gives error: File mode specification error: (error "Don't know how to make a localized variable an alias")

;; (require 'dss-completion)

;; check ~/.ipython/ipythonrc
;; (setq py-python-command-args '("--colors=Linux")) ;; Linux, LightBG, NoColor
;; (setq ipython-completion-command-string "print(';'.join(get_ipython().Completer.complete('%s')[1])) #PYTHON-MODE SILENT\n")
;; ==========================
;; Pymacs, rope, ropemacs
;; ==========================

(setq
 py-python-command-args '("--colors=Linux")  ;; Linux, LightBG, NoColor
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)

;; (cond ((string= system-type "darwin")
;;        (eval-after-load "pymacs"
;;          (progn
;;            '(add-to-list 'pymacs-load-path "/Library/Python/2.7/site-packages/Pymacs")
;;            '(add-to-list 'pymacs-load-path "~/.emacs.d/my-packages/Pymacs"))))
;;       ((string= system-type "gnu/linux")
;;        (eval-after-load "pymacs"
;;          '(add-to-list 'pymacs-load-path "~/lib/python2.7/site-packages/Pymacs"))))

;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)


;; ===========================
;; python-mode extension 
;; ===========================

(outline-minor-mode 1)

(set-variable 'py-indent-offset 4)
(set-variable 'py-smart-indentation nil)
(set-variable 'indent-tabs-mode nil) 
;;(highlight-beyond-fill-column)
;;(define-key python-mode-map "\C-m" 'newline-and-indent)
(abbrev-mode)

(set (make-variable-buffer-local 'beginning-of-defun-function)
     'py-beginning-of-def-or-class)
(setq outline-regexp "def\\|class ")
(load "py-mode-ext")  
(load "pyp")

;; (message "pymacs path : %s" pymacs-load-path)

;; (require 'pycomplete+)

(define-key python-mode-map [M-f12] 'pyp)
;; (define-key python-mode-map "\C-c\C-c" 'py-execute-prog)
(define-key python-mode-map "\C-c\C-c" 'py-execute-buffer)
(define-key python-mode-map "\C-c\C-g" 'py-call-pdb)
(define-key python-mode-map "\C-c\C-w" 'pychecker)

;; ;; previous command history M-p
;; ;; next command history     M-n

;; (define-key global-map '[C-c C-r]  'py-execution-region)

;; ;; ====================================
;; ;; Django setting
;; ;; ====================================

;; (load "~/.emacs.d/my-packages/nxhtml/autostart.el")
;; (setq mumamo-background-colors nil) 
;; (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; (setq debug-on-error nil)

;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot t)
;; (autoload 'jedi:setup "jedi" nil t)
;; (add-hook 'python-mode-hook
;;           '(lambda ()
;;             (jedi:setup)
;;             (eldoc-mode 1)))
