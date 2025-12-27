;; -*- mode: Emacs-Lisp -*-

;; =============================
;; Jedi setup
;; -----------------------------
(jedi:setup)
(jedi:ac-setup)
(setq jedi:complete-on-dot t)

;; =============================
;; Auto Completion
;; -----------------------------
;; (setq py-load-pymacs-p t)
;; (require 'auto-complete-config)
;; (ac-config-default)
;; =============================

;; (add-hook 'python-mode-hook 'electric-pair-mode)
(add-hook 'python-mode-hook
          #'(lambda ()
              (electric-pair-mode)
              (setq-local show-trailing-whitespace t)))

(elpy-enable)
;; (elpy-mode 1)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq flycheck-python-flake8-executable     "flake8")
  (setq flycheck-python-pycompile-executable  "python3")
  (setq flycheck-python-pylint-executable     "pylint")
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'elpy-mode-hook 'py-autopep8-mode)

;; Note: need to also update flake8 config file (.flake8)
(setq py-autopep8-options '("--max-line-length=100"
                            "--ignore=E231,E701,E704,E501"))

;; also need to update ~/.config/flake8, so that these errors won't be marked
;; [flake8]
;; ignore = E501, E203, E221

(outline-minor-mode 1)

(set-variable 'python-indent-offset 4)
(set-variable 'py-indent-offset python-indent-offset)
(set-variable 'py-smart-indentation nil)
(set-variable 'indent-tabs-mode nil)

;; (setq python-shell-interpreter "/opt/local/Library/Frameworks/Python.framework/Versions/3.12/bin/python3"
;;       python-shell-interpreter-args "-i")

;; ;; (elpy-use-ipython "/opt/local/Library/Frameworks/Python.framework/Versions/3.12/bin/ipython")
;; (setq python-shell-interpreter (concat (getenv "HOME") "/Library/Python/3.12/bin/ipython") ;; (concat (getenv "HOME") "/anaconda3/bin/ipython") ;; "/Users/zcai/anaconda3/bin/ipython"
;;       python-shell-interpreter-args "--colors=Linux --simple-prompt -i" ;; Linux, LightBG, NoColor
;;       python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;       python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;       python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
;;       ;; python-shell-completion-setup-code "from IPython.core.completerlib import module_completion\nimport readline, rlcompleter"
;;       python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
;;       python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


(setq python-shell-interpreter (concat (getenv "HOME") "/.pyenv/shims/jupyter") ;; (concat (getenv "HOME") "/anaconda3/bin/ipython") ;; "/Users/zcai/anaconda3/bin/ipython"
      python-shell-interpreter-args "console --simple-prompt" ;; Linux, LightBG, NoColor
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; (setq show-trailing-whitespace t)

;; (define-key python-mode-map (kbd "C-M-x") 'python-shell-send-defun) ;; should be default
(define-key python-mode-map (kbd "C-M-r") 'python-shell-send-region)
(define-key python-mode-map (kbd "C-M-s") 'python-shell-send-string)

(require 'mmm-mode)
(mmm-add-classes
 '((embedded-sql :submode sql-mode
                 :front "-- SQL>"
                 :back "-- #SQL")))
(mmm-add-mode-ext-class 'python-mode nil 'embedded-sql)


(require 'mmm-mode)
(mmm-add-mode-ext-class 'python-mode nil 'python-sql)

(setq mmm-mode-ext-classes '((python-sql :submode 'sql-mode :face 'mmm-default-submode-face)))
