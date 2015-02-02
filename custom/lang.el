
;; (setq initial-major-mode 'org-mode)
;; (require 'cc-mode)
;; (require 'vhdl-mode)
(require 'verilog-mode)
(require 'cperl-mode)
(require 'gas-mode)
;; (require 'cuda-mode)
(when (string= system-type "gnu/linux")
  (require 'apt-sources))
;; (require 'csharp-mode) ;; not using it at the moment
;; (require 'd-mode)
(require 'scilab)
(require 'matlab)
(require 'haskell-mode)

;; ===========================================================================================
;; Set up which modes to use for which file extensions
;; -------------------------------------------------------------------------------------------
(setq auto-mode-alist
      (append
       '(
         ("\\.[Hh]$"                   . c++-mode)
         ("\\.i$"                      . c++-mode) ;; swig
         ("\\.inl$"                    . c++-mode) ;; template functions
         ;; ("\\.cu$"                     . c-mode)
         ("\\.go$"                     . go-mode)
         ("\\.d$"                      . d-mode)   ;; dtrace
         ("\\.[Cc][Uu]$"               . c++-mode) ;;cuda-mode)
         ("\\.[Cc][Uu][Hh]$"           . c++-mode) ;;cuda-mode)
         ("\\.dps$"                    . pascal-mode)
         ("\\.py$"                     . python-mode)
         ("\\.Xdefaults$"              . xrdb-mode)
         ("\\.Xenvironment$"           . xrdb-mode)
         ("\\.Xresources$"             . xrdb-mode)
         ("\\.tei$"                    . xml-mode)
         ("\\.php$"                    . php-mode)
         ("\\.tex$"                    . LaTeX-mode)
         ("\\.org$"                    . org-mode)
         ("\\.css\\'"                  . css-mode)
         ("\\.el$"                     . lisp-mode)
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
         ) auto-mode-alist))
;; ===========================================================================================

;; ============================================================================
;; yasnippet
;; ----------------------------------------------------------------------------
(require 'yasnippet)
(yas--initialize)
;; ============================================================================

;; (setq c-default-style '((c-mode    . "stroustrup")
;;                         (c++-mode  . "stroustrup")
;;                         (objc-mode . "stroustrup")
;;                         (java-mode . "java")
;;                         (awk-mode  . "awk")
;;                         (other     . "gnu")))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/custom/langs"))
(dolist (lang-setting '("c_c++-lang"
                        "objc-lang"
                        "lisp-lang"
                        "clojure-lang"
                        "perl-lang"
                        "web"))
  (load-library lang-setting))

;; (add-hook 'python-mode-hook (load-library "python-lang"))
(dolist (hook '((LaTeX-mode-hook   . "latex-settings")
                (python-mode-hook  . "python-config")
                (haskell-mode-hook . "haskell-lang")
                (erlang-mode-hook  . "erlang-lang")
                (ocaml-mode-hook   . "ocaml-lang")
                (org-mode-hook     . "org-mode-config")
                (matlab-mode-hook  . "matlab-lang")
                (go-mode-hook      . "go-lang")
                (vhdl-mode-hook    . "vhdl-settings")
                (verilog-mode-hook . "verilog-settings")))
  (add-hook (car hook) `(lambda () (load-library ,(cdr hook)))))

;; =================================
;; Firefox: moz.el, javascript.el
;; =================================

;; (autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

;; (add-hook 'javascript-mode-hook 'javascript-custom-setup)
;; (defun javascript-custom-setup ()
;;   (moz-minor-mode 1))
