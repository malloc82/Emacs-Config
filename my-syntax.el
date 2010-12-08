;; ==========================
;; Other syntax mode
;; ==========================

;; (setq initial-major-mode 'org-mode)
;; (require 'cc-mode)
(require 'vhdl-mode)
(require 'verilog-mode)
(require 'cperl-mode)
(require 'gas-mode)
;; (if (string= system-type "gnu/linux")
(require 'apt-sources)
(require 'cuda-mode)
(require 'csharp-mode)
(require 'd-mode)
(require 'scilab)

;; (require 'matlab)

;; ========================================================
;; Set up which modes to use for which file extensions
;; ========================================================
(setq auto-mode-alist
      (append
       '(
         ("\\.[Hh]$"                   . c++-mode)
         ("\\.i$"                      . c++-mode) ;; swig
         ("\\.inl$"                    . c++-mode) ;; template functions 
         ;; ("\\.cu$"                     . c-mode)
         ("\\.d$"                      . d-mode) ;; dtrace
         ("\\.[Cc][Uu]$"               . cuda-mode)
         ("\\.[Cc][Uu][Hh]$"           . cuda-mode)
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
         ("\\.m$"                      . matlab-mode)
         ("\\.mm$"                     . objc-mode)
         ("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode)
         ("\\.[Ss]$"                   . gas-mode)
         ("\\.[Cc][Ss]$"               . csharp-mode)
         ("\\.[Ss][Hh]$"               . sh-mode)
         ;; ("\\.js$"                     . js2-mode)
         ;; ("\\.js\\'"                   . javascript-mode)
         ) auto-mode-alist))

(set-variable 'c-default-style "stroustrup")


;; (setq c-default-style '((c-mode    . "stroustrup") 
;;                         (c++-mode  . "stroustrup")
;;                         (objc-mode . "stroustrup")
;;                         (java-mode . "java")
;;                         (awk-mode  . "awk")
;;                         (other     . "gnu")))

(add-hook 'c-mode-hook
          '(lambda ()
            (outline-minor-mode 1)))

(add-hook 'c++-mode-hook
          '(lambda ()
            (outline-minor-mode 1)))

(add-hook 'cuda-mode-hook
          '(lambda ()
            (yas/minor-mode 1)
            (outline-minor-mode 1)))

(add-hook 'objc-mode-hook
          '(lambda ()
            (outline-minor-mode 1)))

(add-hook 'cperl-mode-hook
          '(lambda ()
            (outline-minor-mode 1)))

(add-hook 'php-mode-hook
          '(lambda ()
            (outline-minor-mode 1)))

(add-hook 'tramp-util-unload-hook
          '(lambda ()
            (message "loading tramp ......... ")
            (global-pabbrev-mode nil)))

;; (add-hook 'org-mode-hook 
;;           (lambda () (setq truncate-lines nil)))


;; =================================
;; javascript-mode configuration
;; =================================

(add-hook 'javascript-mode
          '(autoload 'javascript-mode "javascript" nil t))

;; =================================
;; python-mode configuration
;; =================================
(load "~/.emacs.d/nxhtml/autostart.el")
(setq mumamo-background-colors nil) 
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; =================================
;; python-mode configuration
;; =================================

(require 'python-mode)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))

(add-hook 'python-mode-hook
       	  '(lambda ()
            (message "loading python-mode ......... ")
            (load-library "my-python")))


;; =================================
;; latex configuration
;; =================================

(add-hook 'LaTeX-mode-hook
          '(lambda ()
            (outline-minor-mode 1)
            (setq LaTeX-math-mode t)))


;; =================================
;; yasnippet
;; =================================
(require 'yasnippet-bundle)
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")


;; =================================
;; Firefox: moz.el, javascript.el
;; =================================

(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

(add-hook 'javascript-mode-hook 'javascript-custom-setup)
(defun javascript-custom-setup ()
  (moz-minor-mode 1))

;; ==========================
;; C/C++ indentation
;; ==========================
(defun my-c-mode-common-hook ()
  (turn-on-font-lock)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label '+))
  ;;(c-set-offset 'arglist-cont-nonempty c-lineup-arglist))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;; ============================
;; Objective-C 
;; ============================

;; Handle header files 
(defun bh-choose-header-mode ()
  (interactive)
  (if (string-equal (substring (buffer-file-name) -2) ".h")
      (progn
        ;; OK, we got a .h file, if a .m file exists we'll assume it's
        ;; an objective c file. Otherwise, we'll look for a .cpp file.
        (let ((dot-m-file (concat (substring (buffer-file-name) 0 -1) "m"))
              (dot-cpp-file (concat (substring (buffer-file-name) 0 -1) "cpp")))
          (if (file-exists-p dot-m-file)
              (progn
                (objc-mode)
                )
            (if (file-exists-p dot-cpp-file)
                (c++-mode)
              )
            )
          )
        )
    )
  )
 
(add-hook 'find-file-hook 'bh-choose-header-mode)


;; compile using xcodebuild
(defun bh-compile ()
  (interactive)
  (let ((df (directory-files "."))
        (has-proj-file nil)
        )
    (while (and df (not has-proj-file))
      (let ((fn (car df)))
        (if (> (length fn) 10)
            (if (string-equal (substring fn -10) ".xcodeproj")
                (setq has-proj-file t)
              )
          )
        )
      (setq df (cdr df))
      )
    (if has-proj-file
        (compile "xcodebuild -configuration Debug")
      (compile "make")
      )
    )
  )

;; ===========================
;; Perl
;; ===========================

;; cperl-mode is preferred to perl-mode                                        
;; "Brevity is the soul of wit" <foo at acm.org>                               
(defalias 'perl-mode 'cperl-mode)
(setq cperl-electric-keywords t)

;; ===========================
;; HTML/CSS stuff
;; ===========================
(setq html-mode-hook 'turn-off-auto-fill)
(autoload 'css-mode "css-mode")

;; take any buffer and turn it into an html file,
;; including syntax hightlighting
;; (require 'htmlize)

;; ===========================
;; Matlab Mode
;; ===========================

;; (autoload 'matlab-mode "matlab.elc" "Enter Matlab mode." t)
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; ===========================
;; Lisp Mode
;; ===========================

(require 'paredit)
(defsubst lisp-mode-addon (mode-type)
  (define-key mode-type (kbd "(") 'paredit-open-parenthesis)
  (define-key mode-type (kbd ")") 'paredit-close-parenthesis)
  
  (define-key mode-type (kbd "\"") 'paredit-doublequote)
  (define-key mode-type (kbd "\\") 'paredit-backslash)
  
  (define-key mode-type (kbd "RET") 'paredit-newline)
  (define-key mode-type (kbd "<return>") 'paredit-newline)
  (define-key mode-type (kbd "C-j") 'newline)
  
  ;; nb: this assumes dvorak key layout
  ;; (define-key mode-type (kbd "C-h") 'backward-sexp) ;; use C-M-<left>
  ;; (define-key mode-type (kbd "C-n") 'forward-sexp)  ;; use C-M-<right>
  ;; (define-key mode-type (kbd "C-k") 'kill-sexp)
  (define-key mode-type (kbd "C-t") 'transpose-sexps)
  (define-key mode-type (kbd "C-M-t") 'transpose-chars)
  (define-key mode-type (kbd "C-M-k") 'paredit-kill)
  ;; (define-key mode-type (kbd "C-'") 'paredit-splice-sexp)
  (define-key mode-type (kbd "C-M-l") 'paredit-recentre-on-sexp)
  (define-key mode-type (kbd "C-,") 'paredit-backward-slurp-sexp)
  (define-key mode-type (kbd "C-.") 'paredit-forward-slurp-sexp)
  (define-key mode-type (kbd "C-<") 'paredit-backward-barf-sexp)
  (define-key mode-type (kbd "C->") 'paredit-forward-barf-sexp)
  ;; (define-key mode-type (kbd "C-/") 'backward-up-list)
  (define-key mode-type (kbd "C-=") 'down-list)
  (define-key mode-type (kbd "TAB") 'slime-indent-and-complete-symbol)
  (define-key mode-type (kbd "C-c TAB") 'slime-complete-form)
  ;; this may seem strange, but i often use the C-<whatever> motion
  ;; commands in sequence to reformat code and having to take a finger off of control
  ;; to add a return is a pain
  (define-key mode-type (kbd "C-<return>") 'paredit-newline)
  ;; i hate having to take my key off of ctrl for this and i don't use complete-form anyway...
  (define-key mode-type (kbd "C-c C-i") 'slime-inspect))

(add-hook 'lisp-mode-hook
          '(lambda ()
             (lisp-mode-addon lisp-mode-map)))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (lisp-mode-addon emacs-lisp-mode-map)))
