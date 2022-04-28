(require 'package)
(dolist (repo '(("gnu"          . "http://elpa.gnu.org/packages/")
                ;; ("marmalade"    . "http://marmalade-repo.org/packages/")
                ("melpa"        . "https://melpa.org/packages/") ;; snapshots
                ("melpa-stable" . "https://stable.melpa.org/packages/")))
  (add-to-list 'package-archives repo))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(load "selected-packages")

(setq pinned-melpa-stable-pkgs
      (mapcar '(lambda (pkg) (cons pkg "melpa-stable"))
              '(anaconda-mode
                auctex
                autctex-latexmk smex company
                ;; swiper
                swiper
                counsel
                ivy
                cider clojure-mode
                company-irony company-irony-c-headers company-ghc
                concurrent
                cuda-mode
                ;; dash ;; magit 3.3.0 need a version from mepha
                diminish
                edn
                ein
                epc
                epl
                f
                find-file-in-project
                flycheck
                ghc
                ghub
                go-mode
                haskell-mode
                helm-bibtex
                helm-cider
                paredit
                magit git-commit
                python-mode jedi
                helm helm-core
                highlight-symbol
                hydra
                ido-completing-read+
                inflections
                irony
                ivy
                jedi-core
                key-chord
                magit magit-popu
                markdown-mode
                multi-term ;; ??
                parsebib
                popup
                pyvenv
                rainbow-delimiters
                request request-deferred
                simple-httpd
                skewer-mode
                smartparens
                use-package
                tablist
                websocket
                with-editor)))

(setq pinned-melpa-pkgs
      (mapcar '(lambda (pkg) (cons pkg  "melpa"))
              '(;; anaconda-mode
                ;; cider clojure-mode
                ctable
                deferred
                eclim
                elisp-slime-nav
                elixir-mode
                exec-path-from-shell
                fzf
                haskell-snippets
                haskell-tab-indent
                highlight
                highlight-indentation
                javadoc-lookup
                javap-mode
                js2-mode
                julia-mode
                memoize
                mic-paren
                multiple-cursors
                neotree
                org-ref
                pdf-tools
                peg
                pkg-info
                py-autopep8
                python-environment
                pythonic
                quack
                s
                scion
                shell-command
                ssh
                virtualenv
                visible-mark
                vlf
                workgroups
                yasnippet
                yasnippet-snippets
                )))

(setq pinned-gnu-pkgs
      (mapcar '(lambda (pkg) (cons pkg "gnu"))
              '(flymake
                org)))

(setq package-pinned-packages
      (append pinned-melpa-stable-pkgs
              pinned-melpa-pkgs
              pinned-gnu-pkgs))

;; check: ghci-completion ghub idle-highlight-mode


;; (setq package-pinned-packages
;;       '((use-package    . "melpa-stable")
;;         (auctex         . "melpa-stable")
;;         (auctex-latexmk . "melpa-stable")
;;         (smex           . "melpa-stable")
;;         (company        . "melpa-stable")
;;         (company-irony  . "melpa-stable")
;;         (company-irony-c-headers . "melpa-stable")
;;         (paredit      . "melpa-stable")
;;         (clojure-mode . "melpa-stable")
;;         (cider        . "melpa")
;;         (python-mode  . "melpa-stable")
;;         (jedi         . "melpa-stable")
;;         (go-mode      . "melpa-stable")
;;         (magit        . "melpa-stable")
;;         (helm         . "melpa-stable")
;;         (helm-core    . "melpa-stable")
;;         (matlab-mode  . "melpa")
;;         (slime        . "melpa-stable")
;;         (rust-mode    . "melpa-stable")
;;         (pabbrev      . "gnu")
;;         (elpy         . "https://jorgenschaefer.github.io/packages/")))



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
