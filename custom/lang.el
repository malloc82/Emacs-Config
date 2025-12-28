
;; (setq initial-major-mode 'org-mode)
(require 'org)

;; (require 'cc-mode)
;; (require 'vhdl-mode)
;; (require 'verilog-mode)
;; (autoload 'verilog-mode "verilog-mode" "Major mode for verilog, from http://www.veripool.org" t nil)
(require 'cperl-mode)
;; (require 'gas-mode)
(autoload 'gas-mode "gas-mode" "Major mode for editing assembly code" t nil)
(require 'cuda-mode)
;; (when (string= system-type "gnu/linux")
;;   (require 'apt-sources))
(autoload 'apt-sources "apt-sources" "Major mode for editing debian's apt config file" t nil)

;; (require 'csharp-mode) ;; not using it at the moment
;; (require 'd-mode)

;; (require 'scilab)
(autoload 'scilab "scilab-mode" "Major mode for SciLab" t nil)
;; (require 'matlab)
;; (autoload 'matlab "matlab-mode" "Major mode for matlab files" t nil)
;; (require 'haskell-mode)
;; (autoload 'haskell-mode "haskell-mode" "Major mode for haskell" t nil)
;; (require 'vimrc-mode)
(autoload 'vimrc-mode "vimrc-mode" "Major mode for vimrc files" t nil)
(autoload 'vivado-mode "vivado-mode" "Major mode for Xilinx XDC files" t nil)
;; ===========================================================================================
;; Set up which modes to use for which file extensions
;; -------------------------------------------------------------------------------------------
(setq auto-mode-alist
      (append
       '(("\\.[Hh]$"                                            . c++-mode)
         ("\\.i$"                                               . c++-mode) ;; swig
         ("\\.inl$"                                             . c++-mode) ;; template functions
         ("\\.cu$"                                              . cuda-mode)
         ("\\.go$"                                              . go-mode)
         ("\\.d$"                                               . d-mode)   ;; dtrace
         ("\\.[Cc][Uu]$"                                        . c++-mode) ;;cuda-mode)
         ("\\.[Cc][Uu][Hh]$"                                    . c++-mode) ;;cuda-mode)
         ("\\.dps$"                                             . pascal-mode)
         ;; ("\\.py$"                     . python-mode)
         ("\\.Xdefaults$"                                       . xrdb-mode)
         ("\\.Xenvironment$"                                    . xrdb-mode)
         ("\\.Xresources$"                                      . xrdb-mode)
         ("\\.tei$"                                             . xml-mode)
         ("\\.php$"                                             . php-mode)
         ("\\.tex$"                                             . LaTeX-mode)
         ("\\.org$"                                             . org-mode)
         ("\\.css\\'"                                           . css-mode)
         ;; ("\\.el$"                     . emacs-lisp-mode)
         ("\\.ASM$"                                             . asm-mode)
         ("\\.[Kk][Aa][Nn]"                                     . jde-mode)
         ;; ("\\.m$"                      . objc-mode)
         ("\\.sci$"                                             . scilab-mode)
         ("\\.sce$"                                             . scilab-mode)
         ("\\.vhd$"                                             . vhdl-mode)
         ("\\.m$"                                               . matlab-mode)
         ("\\.mm$"                                              . objc-mode)
         ("\\.\\([pP][Llm]\\|al\\)\\'"                          . cperl-mode)
         ("\\.[Ss]$"                                            . gas-mode)
         ;; ("\\.[Cc][Ss]$"               . csharp-mode)
         ("\\.[Ss][Hh]$"                                        . sh-mode)
         ("[Mm][Aa][Kk][Ee][Ff][Ii][Ll][Ee]\\(\\..+\\|_.+\\)*$" . makefile-mode)
         ;;
         ;;
         ("\\.vim\\(rc\\)?\\'"                                  . vimrc-mode)
         ("\\.[Xx][Dd][Cc]$"                                    . vivado-mode)
         ("\\.boot$"                                            . clojure-mode)
         ("\\.[Cc][Ll][Jj]$"                                    . clojure-mode)
         ("\\.[Cc][Ll][Jj]\\([Cc]\\)?$"                         . clojurec-mode)
         ("\\.[Cc][Ll][Jj]\\([CcSs]\\)?$"                       . clojurescript-mode)
         ("\\.[Ll][Oo][Gg]$"                                    . auto-revert-tail-mode)
         ) auto-mode-alist))


(add-hook 'auto-revert-tail-mode-hook #'(lambda ()
                                          (end-of-buffer)
                                          (make-variable-buffer-local 'auto-revert-interval)
                                          (setq auto-revert-interval 1)
                                          (auto-revert-set-timer)
                                          (make-variable-buffer-local 'auto-revert-verbose)
                                          (setq auto-revert-verbose nil)
                                          (read-only-mode t)
                                          (font-lock-mode 0)
                                          (company-mode -1)
                                          (pyvenv-mode -1)
                                          (electric-indent-mode -1)
                                          (when (fboundp 'show-smartparens-mode)
                                            (show-smartparens-mode 0))))

(add-hook 'itail-mode-hook #'(lambda ()
                               (end-of-buffer)
                               (font-lock-mode 0)
                               (company-mode -1)
                               (electric-indent-mode -1)
                               (pyvenv-mode -1)))

(add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))

;; ===========================================================================================

;; ============================================================================
;; yasnippet
;; ----------------------------------------------------------------------------
(require 'yasnippet)
;; (yas-global-mode 1)
(setq yas-snippet-dirs (append '("~/.emacs.d/custom/snippets") yas-snippet-dirs))
(defun yas-newline ()
  (interactive)
  (newline))

(eval-after-load 'yasnippet
  '(progn
     (define-key yas-keymap (kbd "<return>") 'yas-newline)
     (define-key yas-keymap (kbd "C-g")      'yas-abort-snippet)))

;; ============================================================================
;; (setq c-default-style '((c-mode    . "stroustrup")
;;                         (c++-mode  . "stroustrup")
;;                         (objc-mode . "stroustrup")
;;                         (java-mode . "java")
;;                         (awk-mode  . "awk")
;;                         (other     . "gnu")))

;; ==========================================
;; Python Config (elpy)
;; ==========================================

;; (elpy-enable)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/custom/langs"))
(dolist (lang-setting '(;; "c_c++-lang"
                        "c-cpp-config"
                        "objc-lang"
                        "lisp-lang"
                        ;; "clojure-lang"
                        "perl-lang"
                        "python-config"
                        "web"))
  (load-library lang-setting))


;; python packages
(defvar python-packages
  '(ein
    elpy
    flycheck
    py-autopep8))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      python-packages)

;; (add-hook 'python-mode-hook (load-library "python-lang"))

(dolist (hook '((LaTeX-mode-hook   . "latex-settings")
                ;; (python-mode-hook  . "python-config")
                (haskell-mode-hook . "haskell-lang")
                (erlang-mode-hook  . "erlang-lang")
                (ocaml-mode-hook   . "ocaml-lang")
                (org-mode-hook     . "org-mode-config")
                (matlab-mode-hook  . "matlab-lang")
                (go-mode-hook      . "go-lang")
                (vhdl-mode-hook    . "vhdl-settings")
                (verilog-mode-hook . "verilog-settings")))
  (add-hook (car hook) `(lambda () (load-library ,(cdr hook)))))


(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'rainbow-delimiters)
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground 'unspecified
                    :inherit 'error)

(defun noprompt/forward-transpose-sexps ()
  (interactive)
  (paredit-forward)
  (transpose-sexps 1)
  (paredit-backward))

(defun noprompt/backward-transpose-sexps ()
  (interactive)
  (transpose-sexps 1)
  (paredit-backward)
  (paredit-backward))

;; (key-chord-define-global "tk" 'noprompt/forward-transpose-sexps)
;; (key-chord-define-global "tj" 'noprompt/backward-transpose-sexps)

;; =================================
;; Firefox: moz.el, javascript.el
;; =================================

;; (autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

;; (add-hook 'javascript-mode-hook 'javascript-custom-setup)
;; (defun javascript-custom-setup ()
;;   (moz-minor-mode 1))

;; (define-generic-mode 'vimrc-generic-mode
;;     '()
;;     '()
;;     '(("^[\t ]*:?\\(!\\|ab\\|map\\|unmap\\)[^\r\n\"]*\"[^\r\n\"]*\\(\"[^\r\n\"]*\"[^\r\n\"]*\\)*$"
;;        (0 font-lock-warning-face))
;;       ("\\(^\\|[\t ]\\)\\(\".*\\)$"
;;       (2 font-lock-comment-face))
;;       ("\"\\([^\n\r\"\\]\\|\\.\\)*\""
;;        (0 font-lock-string-face)))
;;     '("/vimrc\\'" "\\.vim\\(rc\\)?\\'")
;;     '((lambda ()
;;         (modify-syntax-entry ?\" ".")))
;;     "Generic mode for Vim configuration files.")

(use-package org-mode
  :mode "\\.[Oo][Rr][Gg]$"
  :init
  (use-package ob-clojure)
  (use-package ob-http)
  (org-babel-do-load-languages
   'org-babel-load-languages
   (append org-babel-load-languages
           '((latex  . t)
             (C      . t)
             (python . t)
             (awk    . t)
             (calc   . t)
             (shell  . t)
             (http   . t)  ;; https://github.com/zweifisch/ob-http
             (R      . t)
             )))
  :bind (:map org-mode-map
              ("s-<up>"    . org-priority-up)
              ("s-<down>"  . org-priority-down)
              ("S-<right>" . 'windmove-right)
              ("S-<left>"  . 'windmove-left)
              ("S-<up>"    . 'windmove-up)
              ("S-<down>"  . 'windmove-down)

              ("C-S-f"     . 'org-shiftright)
              ("C-S-b"     . 'org-shiftleft)
              ("C-S-p"     . 'org-shiftupt)
              ("C-S-n"     . 'org-shiftdown)

              ("C-c l"     . 'org-store-link)
              ("C-c a"     . 'org-agenda)
              ("C-c c"     . 'org-capture)
              )
  :custom
  (org-bullets-bullet-list '("●" "○" "◆" "→"))
  (org-replace-disputed-keys t)
  (org-support-shift-select t)
  (org-adapt-indentation t "force indentation upon return")
  (org-hide-leading-stars t)
  (org-odd-levels-only t)
  (org-return-follows-link t)
  (org-src-tab-acts-natively t)
  ;; (show-trailing-whitespace  t)
  (org-babel-R-command "/opt/local/bin/R --slave --no-save")
  :custom-face
  (outline-4 ((t (:inherit font-lock-string-face))))
  ;; (outline-7 ((t (:inherit font-lock-string-face)))) ;; original: font-lock-builtin-face
  (outline-8 ((t (:inherit font-lock-comment-face))))
  )

(use-package ob-clojure
  :custom
  (org-babel-clojure-backend 'cider)
  :config
  (use-package cider)
  )

(use-package org-journal
  :custom
  (journal-org-file-format "%Y-Week-%2W.org")
  (org-journal-file-type 'weekly)
  (org-hide-emphasis-markers t)
  )

(use-package drools-mode
  :mode "\\.[Dd][Rr][Ll]$"
  :custom
  (comment-start "//")
  )


;; (use-package lisp-mode
;;   :init
;;   (use-package paredit)
;;   (use-package company)
;;   (add-hook 'lisp-mode-hook
;;             #'(lambda ()
;;                 (eldoc-mode)
;;                 (enable-paredit-mode)))
;;   :bind (:map lisp-mode-map
;;          ("M-0"           . 'paredit-escape)
;;          ("C-<backspace>" . 'delete-backward-char)
;;          ("C-M-k"         . 'paredit-kill)
;;          ("C-M-i"         . #'company-complete)
;;          ("TAB"           . #'company-indent-or-complete-common)
;;          )
;;   )

(use-package elisp-mode
  :init
  (use-package paredit)
  (use-package company)
  (add-hook 'emacs-lisp-mode-hook
            #'(lambda ()
                (eldoc-mode)
                (enable-paredit-mode)))
  :bind (:map emacs-lisp-mode-map
              ("M-0"           . 'paredit-escape)
              ("C-<backspace>" . 'delete-backward-char)
              ("C-M-k"         . 'paredit-kill)
              ("C-M-i"         . #'company-complete)
              ("TAB"           . #'company-indent-or-complete-common)
              )
  )

(use-package flycheck-clj-kondo
  :ensure t)

(use-package clojure-mode
  :mode (("\\.[Cc][Ll][Jj]$"     . clojure-mode)
         ("\\.[Cc][Ll][Jj][Ss]$" . clojurescript-mode))
  :init
  (use-package paredit)
  (use-package company)
  (add-hook 'clojure-mode-hook
            #'(lambda ()
                ;; (lsp)
                (eldoc-mode)
                (enable-paredit-mode)))
  (font-lock-add-keywords
   'clojure-mode `(("(\\(fn\\>\\)"
                    (0 (progn (compose-region (match-beginning 1)
                                              (match-end 1) "ƒ")
                              nil)))
                   ("(\\|)" . 'esk-paren-face)))
  :bind (:map clojure-mode-map
              ("M-0"           . 'paredit-escape)
              ("C-<backspace>" . 'delete-backward-char)
              ("C-M-k"         . 'paredit-kill)
              ("C-M-i"         . #'company-complete)
              ("TAB"           . #'company-indent-or-complete-common)
              )
  :custom
  (show-trailing-whitespace t)
  :config
  (require 'flycheck-clj-kondo)
  )


(use-package cider
  :init
  (use-package paredit)
  (use-package company)
  :bind (:map cider-repl-mode-map
              ("M-0"           . 'paredit-escape)
              ("C-<backspace>" . 'delete-backward-char)
              ("C-M-k"         . 'paredit-kill)
              ("C-M-i"         . #'company-complete)
              ("TAB"           . #'company-indent-or-complete-common)
              )
  :custom
  (company-idle-delay nil)
  (cider-repl-use-clojure-font-lock t)
  (nrepl-hide-special-buffers t)
  (cider-print-quota 1024)
  :config
  (font-lock-add-keywords
   'cider-repl-mode `(("(\\(fn\\>\\)"
                       (0 (progn (compose-region (match-beginning 1)
                                                 (match-end 1) "ƒ")
                                 nil)))
                      ("(\\|)" . 'esk-paren-face)))
  (add-hook 'cider-repl-mode-hook
            #'(lambda ()
                (eldoc-mode)
                (enable-paredit-mode)
                (company-mode)
                (message "loading cider-repl-mode-hook ...")
                (cider-company-enable-fuzzy-completion)
                (add-to-list 'paredit-space-for-delimiter-predicates
                             'clojure-space-for-delimiter-p
                             'clojure-no-space-after-tag)
                (rainbow-delimiters-mode)
                ;; (lsp)
                ))
  (add-hook 'cider-mode-hook
            #'(lambda ()
                (company-mode)
                (cider-company-enable-fuzzy-completion)))
  )



;; (use-package ess
;;   :mode (("\\.[Rr]$" . ess-r-mode)))

(setq treesit-extra-load-path '("/opt/local/lib"))
