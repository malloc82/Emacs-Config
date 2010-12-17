;; ==========================================================
;; Setup syntax, background, and foreground coloring
;; ==========================================================

(require 'font-lock)
(global-font-lock-mode t)
;; (setq font-lock-auto-fontify t)
;; (setq font-lock-maximum-decoration t)
(make-face-italic font-lock-comment-face)

(auto-fill-mode nil)

(make-face 'font-lock-number-face)
(set-face-foreground 'font-lock-number-face "DodgerBlue4")
(setq font-lock-number-face 'font-lock-number-face)

(setq number-mode-list '(c-mode-hook
                         c++-mode-hook
                         lisp-mode-hook
                         emacs-lisp-mode-hook
                         python-mode-hook
                         cperl-mode-hook))

(dolist (mode number-mode-list)
  (add-hook mode
            '(lambda ()
              (font-lock-add-keywords nil
               '(("\\<\\([0-9]+\\([eE][+-]?[0-9]*\\)?\\|0[xX][0-9a-fA-F]+\\)\\>" .
                  font-lock-number-face))))))

(defun terminal-settings ()
  (set-face-foreground 'font-lock-preprocessor-face "magenta")
  (set-face-foreground 'font-lock-comment-face "blue")
  (set-face-foreground 'font-lock-comment-delimiter-face "blue")
  (set-face-foreground 'font-lock-type-face "green")
  (set-face-foreground 'font-lock-keyword-face "yellow")
  (set-face-foreground 'font-lock-variable-name-face "white")
  (set-face-foreground 'font-lock-function-name-face "white")
  (set-face-foreground 'font-lock-string-face "red")
  (set-face-foreground 'font-lock-constant-face "cyan")
  (set-face-foreground 'font-lock-number-face "red")

  (set-face-background 'region "blue")
  (set-face-background 'secondary-selection "cyan")
  )

(require 'dired)

(defsubst set-theme-black-on-white (cur-frame)

  (set-background-color "white")
  (set-foreground-color "black")
  (set-cursor-color     "DarkSlateGray4")
  
  (set-face-background 'region "LightBlue2" cur-frame)
  (set-face-foreground 'font-lock-comment-face "ForestGreen" cur-frame)
  (set-face-foreground 'font-lock-preprocessor-face "Brown" cur-frame)
  (set-face-foreground 'font-lock-type-face "DarkBlue" cur-frame)
  (set-face-foreground 'font-lock-keyword-face "Purple" cur-frame)
  (set-face-foreground 'font-lock-variable-name-face "Black" cur-frame)
  (set-face-foreground 'font-lock-function-name-face "BlueViolet" cur-frame)
  (set-face-foreground 'font-lock-string-face "Red" cur-frame)
  (set-face-foreground 'font-lock-constant-face "DarkCyan" cur-frame)
  (set-face-foreground 'font-lock-number-face "blue" cur-frame)
  (set-face-foreground 'dired-directory "blue4" cur-frame)
  (set-face-foreground 'minibuffer-prompt "blue" cur-frame)
  (setq term-default-bg-color "white")
  (setq term-default-fg-color "black")  
  )

(defsubst set-theme-white-on-black (cur-frame)

  (set-background-color "black")
  (set-foreground-color "white")
  (set-cursor-color     "yellow")
  
  (set-face-background 'region "blue" cur-frame)
  ;; (set-face-background 'region "LightBlue3")
  (set-face-foreground 'font-lock-comment-face "chocolate1" cur-frame)
  (set-face-foreground 'font-lock-string-face "LightSalmon" cur-frame)
  (set-face-foreground 'font-lock-number-face "LightSalmon" cur-frame)
  (set-face-foreground 'font-lock-builtin-face "LightSteelBlue" cur-frame)
  (set-face-foreground 'font-lock-type-face "PaleGreen" cur-frame)
  (set-face-foreground 'font-lock-keyword-face "Cyan1" cur-frame)
  (set-face-foreground 'font-lock-variable-name-face "LightGoldenrod" cur-frame)
  (set-face-foreground 'font-lock-warning-face "Pink" cur-frame)
  (set-face-foreground 'font-lock-constant-face "Aquamarine" cur-frame)
  (set-face-foreground 'font-lock-function-name-face "LightSkyeBlue" cur-frame)
  (set-face-foreground 'font-lock-preprocessor-face "LightSteelBlue" cur-frame)
  (set-face-foreground 'dired-directory "SkyBlue2" cur-frame)
  (set-face-foreground 'minibuffer-prompt "cyan" cur-frame)
  (setq term-default-bg-color "black")
  (setq term-default-fg-color "white")
  ;; (set-face-background 'secondary-selection "cyan")
  )
    

(defun darwin-setting ()
  (setq initial-frame-alist `((top   . 25)  (left   . 10)
                              (width . 215)  (height . 62)
                              ,@face-config
                              (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
  (setq default-frame-alist `((width . 95)  (height . 50)
                              ,@face-config
                              (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
  (setq special-display-frame-alist `((width . 95) (height . 50)
                                      ,@face-config
                                      (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
  )

(defun window-settings (theme-name)
    ;; Emacs 23.1 on OS X transparent background : "ARGBBB000000"

    ;; (let ((bg-color  "black")
    ;;       (fg-color  "white")
    ;;       (cur-color "yellow"))
      ;; =================================
      ;; change gdb highlight color
      ;; =================================
      (set-face-background 'secondary-selection "PaleVioletRed3")

      (cond ((string= theme-name "white-on-black")
             (set-theme-white-on-black nil)
             (setq face-config  `((background-color . "black")
                                  (foreground-color . "white")
                                  (cursor-color     . "yellow")))
             )
            ((string= theme-name "black-on-white")
             (set-theme-black-on-white nil)
             (setq face-config  `((background-color . "white")
                                  (foreground-color . "black")
                                  (cursor-color     . "DarkSlateGray4")))
             )
            (t
             (set-theme-black-on-white nil)
             (setq face-config  `((background-color . "white")
                                  (foreground-color . "black")
                                  (cursor-color     . "DarkSlateGray4")))
             )
            )
      
      (if (string= system-type "darwin")
          (darwin-setting)
          (setq initial-frame-alist `((top   . 25)  (left   . 10)
                                      ,@face-config))
          (setq default-frame-alist `((width . 95)  (height . 50)
                                      ,@face-config))))
    
(defun set-theme (theme-name)
  (interactive "sTheme name: ")
  (let ((cur-frame (selected-frame)))
    (cond ((string= theme-name "white-on-black")
           (set-theme-white-on-black cur-frame))
          ((string= theme-name "black-on-white")
           (set-theme-black-on-white cur-frame))
          (t (message "Unrecognized theme-name"))
          ))
  )

(if (not window-system)
    (terminal-settings)
    ;; (window-settings "black-on-white"))
    (window-settings "white-on-black"))

(require 'parenface)

(setq search-highlight t)
(setq font-lock-maximum-decoration t)
(setq query-replace-highlight t)

(setq scroll-step 5)
