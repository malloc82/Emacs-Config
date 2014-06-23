;; -*- mode: emacs-lisp -*-

(jedi:setup)
(jedi:ac-setup)
(setq jedi:complete-on-dot t)

;; =============================
;; Auto Completion
;; -----------------------------
(setq py-load-pymacs-p t)
(require 'auto-complete-config)
(ac-config-default)
;; =============================

(outline-minor-mode 1)

(set-variable 'py-indent-offset 4)
(set-variable 'py-smart-indentation nil)
(set-variable 'indent-tabs-mode nil) 

(setq python-shell-interpreter "/usr/local/bin/ipython"
      python-shell-interpreter-args "--colors=Linux" ;; Linux, LightBG, NoColor
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
