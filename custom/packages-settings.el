(require 'package)
(dolist (repo '(("gnu"          . "http://elpa.gnu.org/packages/")
                ("marmalade"    . "http://marmalade-repo.org/packages/")
                ("melpa"        . "https://melpa.org/packages/") ;; snapshots
                ("melpa-stable" . "https://stable.melpa.org/packages/")))
  (add-to-list 'package-archives repo))

(load "selected-packages")
(setq package-pinned-archives '((use-package  . "melpa-stable")
                                (smex         . "melpa-stable")
                                (company      . "melpa-stable")
                                (paredit      . "melpa-stable")
                                (clojure-mode . "melpa-stable")
                                (cider        . "melpa-stable")
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


(defun package-menu-find-marks ()
  "Find packages marked for action in *Packages*."
  (interactive)
  (occur "^[A-Z]"))

;; Only in Emacs 25.1+
(defun package-menu-filter-by-status (status)
  "Filter the *Packages* buffer by status."
  (interactive
   (list (completing-read
          "Status: " '("new" "installed" "dependency" "obsolete"))))
  (package-menu-filter (concat "status:" status)))

(define-key package-menu-mode-map "s" #'package-menu-filter-by-status)
(define-key package-menu-mode-map "a" #'package-menu-find-marks)
