
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
       '(
         ("\\.[Hh]$"                   . c++-mode)
         ("\\.i$"                      . c++-mode) ;; swig
         ("\\.inl$"                    . c++-mode) ;; template functions
         ("\\.cu$"                     . cuda-mode)
         ("\\.go$"                     . go-mode)
         ("\\.d$"                      . d-mode)   ;; dtrace
         ("\\.[Cc][Uu]$"               . c++-mode) ;;cuda-mode)
         ("\\.[Cc][Uu][Hh]$"           . c++-mode) ;;cuda-mode)
         ("\\.dps$"                    . pascal-mode)
         ;; ("\\.py$"                     . python-mode)
         ("\\.Xdefaults$"              . xrdb-mode)
         ("\\.Xenvironment$"           . xrdb-mode)
         ("\\.Xresources$"             . xrdb-mode)
         ("\\.tei$"                    . xml-mode)
         ("\\.php$"                    . php-mode)
         ("\\.tex$"                    . LaTeX-mode)
         ("\\.org$"                    . org-mode)
         ("\\.css\\'"                  . css-mode)
         ;; ("\\.el$"                     . emacs-lisp-mode)
         ("\\.ASM$"                    . asm-mode)
         ("\\.[Kk][Aa][Nn]"            . jde-mode)
         ;; ("\\.m$"                      . objc-mode)
         ("\\.sci$"                    . scilab-mode)
         ("\\.sce$"                    . scilab-mode)
         ("\\.vhd$"                    . vhdl-mode)
         ("\\.m$"                      . matlab-mode)
         ("\\.mm$"                     . objc-mode)
         ("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode)
         ("\\.[Ss]$"                   . gas-mode)
         ;; ("\\.[Cc][Ss]$"               . csharp-mode)
         ("\\.[Ss][Hh]$"               . sh-mode)
         ("[Mm][Aa][Kk][Ee][Ff][Ii][Ll][Ee]\\(\\..+\\|_.+\\)*$" . makefile-mode)
         ;; ("\\.js$"                     . js2-mode)
         ;; ("\\.js\\'"                   . javascript-mode)
         ("\\.vim\\(rc\\)?\\'"         . vimrc-mode)
         ("\\.[Xx][Dd][Cc]$"           . vivado-mode)
         ("\\.boot$"                   . clojure-mode)
         ("\\.[Cc][Ll][Jj]\\([CcSsXx]\\)?$" . clojure-mode)
         ("\\.[Ll][Oo][Gg]$"           . auto-revert-tail-mode)
         ) auto-mode-alist))


(add-hook 'auto-revert-tail-mode-hook '(lambda ()
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

(add-hook 'itail-mode-hook '(lambda ()
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
(dolist (lang-setting '("c_c++-lang"
                        "objc-lang"
                        "lisp-lang"
                        "clojure-lang"
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

(require 'org-journal)
(setq org-journal-file-format "%Y-Week-%2W.org")
(setq org-journal-file-type 'weekly)

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
