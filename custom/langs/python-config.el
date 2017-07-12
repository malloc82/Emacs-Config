;; -*- mode: emacs-lisp -*-

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

(elpy-enable)
;; (elpy-mode 1)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


(outline-minor-mode 1)

(set-variable 'py-indent-offset 4)
(set-variable 'py-smart-indentation nil)
(set-variable 'indent-tabs-mode nil)

;; (elpy-use-ipython "/usr/local/bin/ipython")
(setq python-shell-interpreter (concat (getenv "HOME") "/anaconda3/bin/ipython") ;; "/Users/zcai/anaconda3/bin/ipython"
      python-shell-interpreter-args "--colors=Linux --simple-prompt -i" ;; Linux, LightBG, NoColor
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(setq show-trailing-whitespace t)
