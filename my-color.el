;; ==========================================================
;; Setup syntax, background, and foreground coloring
;; ==========================================================

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

  (set-face-background 'region "blue")
  (set-face-background 'secondary-selection "cyan"))


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
                                      (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))))


(if (not window-system)
    (terminal-settings)
    ;; Emacs 23.1 on OS X transparent background : "ARGBBB000000"

    ;; (let ((bg-color  "black")
    ;;       (fg-color  "white")
    ;;       (cur-color "yellow"))

    (let ((bg-color  "white")
          (fg-color  "black")
          (cur-color "blue"))
      
      (setq face-config  `((background-color . ,bg-color)
                           (foreground-color . ,fg-color)
                           (cursor-color     . ,cur-color)))
      (set-background-color bg-color)
      (set-foreground-color fg-color)
      (set-cursor-color     cur-color)
      ;; =================================
      ;; change gdb highlight color
      ;; =================================
      (set-face-background 'secondary-selection "PaleVioletRed3")

      (cond ((string= bg-color "white")
             ;; (set-face-background 'region "LightGoldenrod2")
             (set-face-background 'region "LightBlue2")
             ;; (set-face-foreground 'font-lock-comment-face "Firebrick")
             ;; (set-face-foreground 'font-lock-comment-face "chocolate2")
             (set-face-foreground 'font-lock-comment-face "ForestGreen")
             (set-face-foreground 'font-lock-preprocessor-face "Brown")
             (set-face-foreground 'font-lock-type-face "Purple")
             (set-face-foreground 'font-lock-keyword-face "Purple")
             (set-face-foreground 'font-lock-variable-name-face "Black")
             (set-face-foreground 'font-lock-function-name-face "Blue")
             (set-face-foreground 'font-lock-string-face "Red")
             (set-face-foreground 'font-lock-constant-face "DarkCyan")
             )

            ((string= bg-color "black")
             (set-face-background 'region "blue")
             (set-face-foreground 'font-lock-comment-face "chocolate1"))
             )
      
      (if (string= system-type "darwin")
          (darwin-setting)
          (setq initial-frame-alist `((top   . 25)  (left   . 10)
                                      ,@face-config))
          (setq default-frame-alist `((width . 95)  (height . 50)
                                      ,@face-config)))))
        

(require 'parenface)

(setq search-highlight t)
(setq font-lock-maximum-decoration t)
(setq query-replace-highlight t)

(setq scroll-step 5)

(require 'font-lock)
(global-font-lock-mode t)
;; (setq font-lock-auto-fontify t)
;; (setq font-lock-maximum-decoration t)
(make-face-italic font-lock-comment-face)

(auto-fill-mode nil)
