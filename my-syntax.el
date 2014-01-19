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
;; (require 'csharp-mode) ;; not using it at the moment
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
         ("\\.go$"                     . go-mode)
         ("\\.d$"                      . d-mode) ;; dtrace
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

(set-variable 'c-default-style "stroustrup")

;; (setq c-default-style '((c-mode    . "stroustrup") 
;;                         (c++-mode  . "stroustrup")
;;                         (objc-mode . "stroustrup")
;;                         (java-mode . "java")
;;                         (awk-mode  . "awk")
;;                         (other     . "gnu")))

;; (setq mode-list '(c-mode-hook
;;                   c++-mode-hook
;;                   objc-mode-hook
;;                   cuda-mode-hook
;;                   lisp-mode-hook
;;                   emacs-lisp-mode-hook
;;                   python-mode-hook
;;                   cperl-mode-hook
;;                   matlab-mode-hook
;;                   gas-mode-hook
;;                   php-mode-hook
;;                   javascript-mode-hook))


(let ((mlist '(c-mode-hook
               c++-mode-hook
               objc-mode-hook
               cuda-mode-hook
               lisp-mode-hook
               emacs-lisp-mode-hook
               python-mode-hook
               cperl-mode-hook
               matlab-mode-hook
               gas-mode-hook
               php-mode-hook
               javascript-mode-hook)))
  (dolist (mode mlist)
    (add-hook mode
              #'(lambda ()
                  (setq compilation-auto-jump-to-first-error t)
                  (outline-minor-mode 1)))))

(add-hook 'cuda-mode-hook
          #'(lambda ()
              (yas/minor-mode 1)))

(add-hook 'tramp-util-unload-hook
          #'(lambda ()
              (message "loading tramp ......... ")))

;; (add-hook 'org-mode-hook 
;;           (lambda () (setq truncate-lines nil)))

;; Allow editing of binary .plist files.
(add-to-list 'jka-compr-compression-info-list
             ["\\.plist$"
              "converting text XML to binary plist"
              "plutil"
              ("-convert" "binary1" "-o" "-" "-")
              "converting binary plist to text XML"
              "plutil"
              ("-convert" "xml1" "-o" "-" "-")
              nil nil "bplist"])

;;It is necessary to perform an update!
(jka-compr-update)

;; =================================
;; javascript-mode configuration
;; =================================

(add-hook 'javascript-mode-hook
          '(autoload 'javascript-mode "javascript" nil t))

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
            (unless (and (boundp '*my-python-loaded*) *my-python-loaded*)
              (message "loading python-mode ......... ")
              (load-library "my-python")
              (setq *my-python-loaded* t))))

;; =================================
;; latex configuration
;; =================================

;; (add-hook 'LaTeX-mode-hook
;;           '(lambda ()
;;             (outline-minor-mode 1)
            
;;             (setq LaTeX-math-mode t)))

;; =================================
;; yasnippet
;; =================================
(require 'yasnippet-bundle)
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-20131224.143/snippets")

;; =================================
;; Firefox: moz.el, javascript.el
;; =================================

;; (autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

;; (add-hook 'javascript-mode-hook 'javascript-custom-setup)
;; (defun javascript-custom-setup ()
;;   (moz-minor-mode 1))

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
(setq matlab-fill-code nil)

;; ========================================================
;; Ocaml Settings
;; ========================================================

(autoload 'caml-mode "ocaml" (interactive)
  "Major mode for editing Caml code." t)
(autoload 'camldebug "camldebug" (interactive) "Debug caml mode")

;; ========================================================
;; Erlang Settings
;; ========================================================

(let ((path (m-expand-lib-path "emacs" "/opt/local/lib/erlang/lib/")))
  (unless (null path)
    (message "erlang emacs found: %s" path)
    (push path load-path)))
(setq erlang-root-dir "/opt/local/lib/erlang/")
(setq exec-path (append '("/opt/local/lib/erlang/bin") exec-path))
(require 'erlang-start)

;; ========================================================
;; Go Settings
;; ========================================================

(autoload 'go-mode "go-mode" "\
Major mode for editing Go source text.

This provides basic syntax highlighting for keywords, built-ins,
functions, and some types.  It also provides indentation that is
\(almost) identical to gofmt.

\(fn)" t nil)

(autoload 'gofmt "go-mode" "\
Pipe the current buffer through the external tool `gofmt`.
Replace the current buffer on success; display errors on failure.

\(fn)" t nil)

(autoload 'gofmt-before-save "go-mode" "\
Add this to .emacs to run gofmt on the current buffer when saving:
 (add-hook 'before-save-hook #'gofmt-before-save)

\(fn)" t nil)

;; ========================================================
;; Magit Mode
;; ========================================================

(require 'delsel)
(add-hook 'magit-mode-hook
          '(lambda ()
            (delete-selection-mode 1)))

;; ===========================
;; Lisp Mode
;; ===========================

(require 'paredit)
(defun paredit-escape (char)
  ;; I'm too lazy to figure out how to do this without a separate
  ;; interactive function.
  
  ;;  This was removed in later version of paredit
  (interactive "cEscaping character...")
  (if (eq char 127)                     ; The backslash was a typo, so
      t                                 ; the luser wants to delete it.
      (insert char)                     ; (Is there a better way to
      nil))                             ; express the rubout char?
                                        ; ?\^? works, but ugh...)
(defsubst lisp-mode-addon (mode-type)
  (define-key mode-type (kbd "(") 'paredit-open-parenthesis)
  (define-key mode-type (kbd ")") 'paredit-close-parenthesis)
  (define-key mode-type (kbd "[") 'paredit-open-square)
  (define-key mode-type (kbd "]") 'paredit-close-square)
  (define-key mode-type (kbd "M-0") 'paredit-escape) ;; also try : \

  (define-key mode-type (kbd "\"") 'paredit-doublequote)
  (define-key mode-type (kbd "\\") 'paredit-backslash)
  
  (define-key mode-type (kbd "RET") 'paredit-newline)
  (define-key mode-type (kbd "<return>") 'paredit-newline)
  ;; (define-key mode-type (kbd "C-j") 'newline) ;; conflict with 
  
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
  ;; this may seem strange, but i often use the C-<whatever> motion
  ;; commands in sequence to reformat code and having to take a finger off of control
  ;; to add a return is a pain
  (define-key mode-type (kbd "C-<return>") 'paredit-newline)
  
  (define-key mode-type (kbd "C-c .") 'etags-select-find-tag)
  )

;; (dolist (mode `((lisp-mode-hook    ,lisp-mode-map)
;;                 (emacs-lisp-hook   ,emacs-lisp-mode-map)
;;                 ;; (scheme-mode-hook  ,scheme-mode-map)
;;                 ;; (inferior-scheme-mode-hook  ,inferior-scheme-mode-map)
;;                 ))
;;     (add-hook (car mode)
;;               `(lambda ()
;;                  (lisp-mode-addon ,(cadr mode)))))

(add-hook 'lisp-mode-hook
          #'(lambda ()
              (lisp-mode-addon lisp-mode-map)
              (load-library "my-cl-slime.el")
              (slime-mode 1)))

(add-hook 'lisp-interaction-mode-hook
          #'(lambda ()
              (lisp-mode-addon lisp-interaction-mode-map)))

(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()
              (lisp-mode-addon emacs-lisp-mode-map)))

(add-hook 'scheme-mode-hook
          #'(lambda ()
              (lisp-mode-addon scheme-mode-map)
              (load-library "my-scheme")))

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "(") 'paredit-open-parenthesis)
              (define-key eshell-mode-map (kbd ")") 'paredit-close-parenthesis)
              (define-key eshell-mode-map (kbd "M-0") 'paredit-escape) ;; also try : \

              (define-key eshell-mode-map (kbd "\"") 'paredit-doublequote)
              (define-key eshell-mode-map (kbd "\\") 'paredit-backslash)
              
              (define-key eshell-mode-map (kbd "C-t") 'transpose-sexps)
              (define-key eshell-mode-map (kbd "C-M-t") 'transpose-chars)
              (define-key eshell-mode-map (kbd "C-M-k") 'paredit-kill)
              ;; (define-key eshell-mode-map (kbd "C-'") 'paredit-splice-sexp)
              (define-key eshell-mode-map (kbd "C-M-l") 'paredit-recentre-on-sexp)
              (define-key eshell-mode-map (kbd "C-,") 'paredit-backward-slurp-sexp)
              (define-key eshell-mode-map (kbd "C-.") 'paredit-forward-slurp-sexp)
              (define-key eshell-mode-map (kbd "C-<") 'paredit-backward-barf-sexp)
              (define-key eshell-mode-map (kbd "C->") 'paredit-forward-barf-sexp)
              ;; (define-key eshell-mode-map (kbd "C-/") 'backward-up-list)
              (define-key eshell-mode-map (kbd "C-=") 'down-list)
              ;; this may seem strange, but i often use the C-<whatever> motion
              ;; commands in sequence to reformat code and having to take a finger off of control
              ;; to add a return is a pain
              (define-key eshell-mode-map (kbd "C-<return>") 'paredit-newline)
              ))

(add-hook 'slime-mode-hook
          #'(lambda ()
              (lisp-mode-addon slime-mode-map)
              (font-lock-add-keywords 'slime-mode '(("(\\|)" . 'esk-paren-face)))))

(add-hook 'slime-repl-mode-hook
          #'(lambda ()
              (define-key slime-repl-mode-map (kbd "(") 'paredit-open-parenthesis)
              (define-key slime-repl-mode-map (kbd ")") 'paredit-close-parenthesis)
              (define-key slime-repl-mode-map (kbd "[") 'paredit-open-square)
              (define-key slime-repl-mode-map (kbd "]") 'paredit-close-square)
              (define-key slime-repl-mode-map (kbd "{") 'paredit-open-curly)
              (define-key slime-repl-mode-map (kbd "}") 'paredit-close-curly)
              (define-key slime-repl-mode-map (kbd "M-0") 'paredit-escape) ;; also try : \
              
              (define-key slime-repl-mode-map (kbd "\"") 'paredit-doublequote)
              (define-key slime-repl-mode-map (kbd "\\") 'paredit-backslash)))

;; (add-hook 'inferior-scheme-mode-hook
;;           '(lambda ()
;;              (lisp-mode-addon inferior-scheme-mode-map)))


;; =================================
;; clojure-mode configuration
;; =================================
;; (defun load-clojure-settings ()
;;   (require 'clojure-mode)
;;   (add-hook 'clojure-mode-hook
;;             #'(lambda ()
;;                 (message "loading clojure-mode ......")
;;                 (setq inferior-lisp-program "/opt/local/bin/clj")
;;                 (lisp-mode-addon clojure-mode-map)
;;                 (load-library "my-clojure-setting")
;;                 (message "done"))))

;; (when (and (boundp '*my-version*)
;;            (equal   *my-version* "clojure-dev"))
;;   (load-clojure-settings))
