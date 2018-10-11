(require 'package)
(dolist (repo '(("gnu"          . "http://elpa.gnu.org/packages/")
                ("marmalade"    . "http://marmalade-repo.org/packages/")
                ;; ("melpa"        . "https://melpa.org/packages/") ;; snapshots
                ("melpa-stable" . "https://stable.melpa.org/packages/")))
  (add-to-list 'package-archives repo))

(load "selected-packages")
(setq package-pinned-archives '((use-package  . "melpa-stable")
                                (smex         . "melpa-stable")
                                (company      . "melpa-stable")
                                (paredit      . "melpa-stable")
                                (clojure-mode . "melpa-stable")
                                (cider        . "melpa-stable")
                                (use-package  . "melpa-stable")
                                (python-mode  . "melpa-stable")
                                (jedi         . "melpa-stable")
                                (go-mode      . "melpa-stable")
                                (magit        . "melpa-stable")
                                (helm         . "emlpa-stable")
                                (helm-core    . "emlpa-stable")
                                (matlab-mode  . "melpha")
                                (pabbrev      . "gnu")
                                (elpy         . "https://jorgenschaefer.github.io/packages/")))
(package-initialize)

(use-package smex :ensure t)
(use-package company
  :ensure t
  :bind (("C-c /". company-complete))
  :config (global-company-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))
