;; ==========================================================
;; Setup syntax, background, and foreground coloring
;; ==========================================================

(defun terminal-settings ()
      ;; use color-theme-select to check out other themes 
      (require 'color-theme)
      (color-theme-initialize)
      ;; (color-theme-subtle-hacker)
      ;; (color-theme-hober)
      (color-theme-tty-dark)
      ;; (color-theme-vim-colors)
      (set-face-background 'secondary-selection "red"))


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

      ;; (cond ((string= bg-color "white")
      ;;        (set-face-background 'region "LightGoldenrod2")
      ;;        (set-face-foreground 'font-lock-comment-face "Firebrick")
      ;;        (set-face-foreground 'font-lock-comment-face "chocolate2"))

      ;;       ((string= bg-color "black")
      ;;        (set-face-background 'region "red")
      ;;        (set-face-foreground 'font-lock-comment-face "chocolate1")))
      
      (if (string= system-type "darwin")
          (darwin-setting)
          (setq initial-frame-alist '((top   . 25)  (left   . 10)
                                      ,@face-config))
          (setq default-frame-alist '((width . 95)  (height . 50)
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
