
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

(defun dark-night (&optional cur-frame)
  (let ((bg-color "black")
        (fg-color "white")
        (cur-color "yellow"))
    (set-face-attribute 'default   cur-frame :foreground fg-color :background bg-color)
    (set-face-attribute 'cursor    cur-frame :foreground fg-color :background cur-color)
    (set-face-attribute 'mode-line cur-frame :foreground "black" :background "grey70"
                        :box '(:line-width -1 :style released-button))
    (set-face-attribute 'mode-line-inactive cur-frame :foreground "grey80" :background "grey30"
                        :box '(:line-width -1 :style pressed-button))
    (set-face-attribute 'region                 cur-frame :background "blue4") ;; or "LightBlue3"
    (set-face-attribute 'fringe                 cur-frame :background "grey10")
    (set-face-attribute 'font-lock-comment-face cur-frame :foreground "chocolate1" :slant 'italic)
    (set-face-attribute 'font-lock-string-face  cur-frame :foreground "LightSalmon")
    (set-face-attribute 'font-lock-number-face  cur-frame :foreground "LightSalmon")
    (set-face-attribute 'font-lock-builtin-face cur-frame :foreground "LightSteelBlue")
    (set-face-attribute 'font-lock-type-face    cur-frame :foreground "PaleGreen")
    (set-face-attribute 'font-lock-keyword-face cur-frame :foreground "Cyan1" :weight 'bold)
    (set-face-attribute 'font-lock-variable-name-face cur-frame :foreground "LightGoldenrod")
    (set-face-attribute 'font-lock-warning-face       cur-frame :foreground "Pink" :weight 'bold)
    (set-face-attribute 'font-lock-constant-face      cur-frame :foreground "Aquamarine" :weight 'bold)
    (set-face-attribute 'font-lock-function-name-face cur-frame :foreground "DeepSkyBlue" :weight 'bold)
    ;; (set-face-foreground 'font-lock-function-name-face "gray70" cur-frame)
    (set-face-attribute 'font-lock-preprocessor-face  cur-frame :foreground "LightSteelBlue")
    (set-face-attribute 'dired-directory              cur-frame :foreground "SkyBlue2")
    (set-face-attribute 'minibuffer-prompt            cur-frame :foreground "cyan")
    (set-face-attribute 'secondary-selection          cur-frame :foreground "PaleVioletRed3")
    
    (setq term-default-bg-color bg-color)
    (setq term-default-fg-color fg-color)
    `((background-color . ,bg-color)
      (foreground-color . ,fg-color)
      (cursor-color     . ,cur-color))
    )  ;; (set-face-background 'secondary-selection "cyan")
  )

(defun gray-scale (&optional cur-frame)
  (let ((bg-color "gray20")
        (fg-color "white")
        (cur-color "yellow"))

    (set-face-attribute 'default   cur-frame :foreground fg-color :background bg-color)
    (set-face-attribute 'cursor    cur-frame :foreground fg-color :background cur-color)
    (set-face-attribute 'mode-line cur-frame :foreground "black" :background "grey70"
                        :box '(:line-width -1 :style released-button))
    (set-face-attribute 'mode-line-inactive cur-frame :foreground "grey80" :background "grey30"
                        :box '(:line-width -1 :style pressed-button))
    (set-face-attribute 'region                 cur-frame :background "blue4") ;; or "LightBlue3"
    (set-face-attribute 'fringe                 cur-frame :background "grey15")
    (set-face-attribute 'font-lock-comment-face cur-frame :foreground "chocolate1" :slant 'italic)
    (set-face-attribute 'font-lock-string-face  cur-frame :foreground "LightSalmon")
    (set-face-attribute 'font-lock-number-face  cur-frame :foreground "LightSalmon")
    (set-face-attribute 'font-lock-builtin-face cur-frame :foreground "LightSteelBlue")
    (set-face-attribute 'font-lock-type-face    cur-frame :foreground "PaleGreen")
    (set-face-attribute 'font-lock-keyword-face cur-frame :foreground "Cyan1" :weight 'bold)
    (set-face-attribute 'font-lock-variable-name-face cur-frame :foreground "LightGoldenrod")
    (set-face-attribute 'font-lock-warning-face       cur-frame :foreground "Pink" :weight 'bold)
    (set-face-attribute 'font-lock-constant-face      cur-frame :foreground "Aquamarine" :weight 'bold)
    (set-face-attribute 'font-lock-function-name-face cur-frame :foreground "DeepSkyBlue" :weight 'bold)
    ;; (set-face-foreground 'font-lock-function-name-face "gray65" cur-frame)
    (set-face-attribute 'font-lock-preprocessor-face  cur-frame :foreground "LightSteelBlue")
    (set-face-attribute 'dired-directory              cur-frame :foreground "SkyBlue2")
    (set-face-attribute 'minibuffer-prompt            cur-frame :foreground "cyan")
    (set-face-attribute 'secondary-selection          cur-frame :foreground "PaleVioletRed3")

    (setq term-default-bg-color bg-color)
    (setq term-default-fg-color fg-color)
    `((bac:kground-color . ,bg-color)
      (foreground-color . ,fg-color)
      (cursor-color     . ,cur-color))
  ;; (set-face-background 'secondary-selection "cyan")
    )
  )

(defun xcode (&optional cur-frame)
  (let ((bg-color "white")
        (fg-color "black")
        (cur-color "DarkSlateGray4")
        (ml-bgcolor "grey60"))
    (set-face-attribute 'default   cur-frame :foreground fg-color :background bg-color)
    (set-face-attribute 'cursor    cur-frame :foreground fg-color :background cur-color)
    (set-face-attribute 'mode-line cur-frame :foreground "black" :background ml-bgcolor
                        :box '(:line-width -1 :style released-button))
    (set-face-attribute 'mode-line-inactive cur-frame :foreground "grey20" :background "grey90"
                        :box '(:line-width -1 :style pressed-button))
    (set-face-attribute 'region      cur-frame :background "LightBlue2") ;; or "LightBlue3"
    (set-face-attribute 'fringe      cur-frame :background "grey95")
    (set-face-attribute 'header-line cur-frame :foreground "grey20" :background "grey90" :box nil)
    (set-face-attribute 'font-lock-comment-face cur-frame :foreground "ForestGreen" :slant 'italic)
    (set-face-attribute 'font-lock-string-face  cur-frame :foreground "Red3")
    (set-face-attribute 'font-lock-number-face  cur-frame :foreground "Red3")
    (set-face-attribute 'font-lock-builtin-face cur-frame :foreground "MediumOrchid4")
    (set-face-attribute 'font-lock-type-face    cur-frame :foreground "VioletRed3")
    (set-face-attribute 'font-lock-keyword-face cur-frame :foreground "Purple" :weight 'bold)
    (set-face-attribute 'font-lock-variable-name-face cur-frame :foreground "DarkBlue")
    (set-face-attribute 'font-lock-warning-face       cur-frame :foreground "Red1" :weight 'bold)
    (set-face-attribute 'font-lock-constant-face      cur-frame :foreground "Cyan3" :weight 'bold)
    (set-face-attribute 'font-lock-function-name-face cur-frame :foreground "DarkCyan" :weight 'bold) ;; or "gray70"
    ;; (set-face-attribute 'font-lock-preprocessor-face  cur-frame :foreground "LightSteelBlue")
    (set-face-attribute 'dired-directory              cur-frame :foreground "blue")
    (set-face-attribute 'minibuffer-prompt            cur-frame :foreground "blue" :weight 'bold)
    (set-face-attribute 'secondary-selection          cur-frame :foreground "PaleVioletRed3")
    
    (set-face-attribute 'isearch        cur-frame :foreground "lightskyblue1" :background "magenta3")
    (set-face-attribute 'lazy-highlight cur-frame :background "paleturquoise")
    (set-face-attribute 'link           cur-frame :foreground "blue1" :underline t)
    (set-face-attribute 'link-visited   cur-frame :foreground "magenta4" :underline t)
    (set-face-attribute 'button         cur-frame :background "#f6f5ef" :weight 'bold)
    
    (set-face-background 'mode-line ml-bgcolor)
    (setq term-default-bg-color bg-color)
    (setq term-default-fg-color fg-color)
    `((background-color . ,bg-color)
      (foreground-color . ,fg-color)
      (cursor-color     . ,cur-color))
    )
  )

(defun radiance (&optional cur-frame)
  (let ((bg-color "#ffffff")
        (fg-color "#333333")
        (cur-color "#aea79f"))

    (set-face-attribute 'default   cur-frame :foreground fg-color  :background bg-color)
    (set-face-attribute 'cursor    cur-frame :foreground fg-color  :background cur-color)
    (set-face-attribute 'mode-line cur-frame :foreground "#333333" :background "#f6f5ef"
                        :box '(:line-width -1 :style released-button))
    (set-face-attribute 'mode-line-inactive cur-frame :foreground "#333333" :background "#ffffff"
                        :box '(:line-width -1 :style pressed-button))
    (set-face-attribute 'region      cur-frame :background "#f6f5ef") ;; or "LightBlue3"
    (set-face-attribute 'fringe      cur-frame :background "#f6f5ef")
    (set-face-attribute 'header-line cur-frame :foreground "#62124b" :background "#ffffff" :box nil)
    (set-face-attribute 'font-lock-comment-face cur-frame :foreground "#aea79f" :slant 'italic)
    (set-face-attribute 'font-lock-string-face  cur-frame :foreground "#dd1144")
    (set-face-attribute 'font-lock-number-face  cur-frame :foreground "#dd1144")
    (set-face-attribute 'font-lock-builtin-face cur-frame :foreground "#62124b")
    (set-face-attribute 'font-lock-type-face    cur-frame :foreground "#83a525")
    (set-face-attribute 'font-lock-keyword-face cur-frame :foreground "#f47321" :weight 'bold)
    (set-face-attribute 'font-lock-variable-name-face cur-frame :foreground "#8b005a")
    (set-face-attribute 'font-lock-warning-face       cur-frame :foreground "#e80000" :weight 'bold)
    (set-face-attribute 'font-lock-constant-face      cur-frame :foreground "#f68d47" :weight 'bold)
    (set-face-attribute 'font-lock-function-name-face cur-frame :foreground "#860e73" :weight 'bold) ;; or "gray70"
    ;; ;; (set-face-attribute 'font-lock-preprocessor-face  cur-frame :foreground "LightSteelBlue")
    (set-face-attribute 'dired-directory              cur-frame :foreground "blue")
    (set-face-attribute 'minibuffer-prompt            cur-frame :foreground "#f47321" :weight 'bold)
    (set-face-attribute 'secondary-selection          cur-frame :foreground "PaleVioletRed3")
    
    (set-face-attribute 'isearch        cur-frame :foreground "#333333" :background "#fedfc7")
    (set-face-attribute 'lazy-highlight cur-frame :background "#f6f5ef")
    (set-face-attribute 'link           cur-frame :foreground "#0086b3" :underline t)
    (set-face-attribute 'link-visited   cur-frame :foreground "#800080" :underline t)
    (set-face-attribute 'button         cur-frame :background "#f6f5ef" :weight 'bold)
    ;; (set-face-attribute 'hl-line        cur-frame :background "#f6f5ef")

    ;; ===========================
    ;; Original radiance below
    ;; ===========================
    ;; (custom-set-faces
    ;; `(default ((t (:background ,bg-color :foreground ,fg-color))))
    ;; `(cursor ((t (:background ,cur-color :foreground ,cur-color))))
    ;; '(region ((t (:background "#f6f5ef" :foreground "#333333"))))
    ;; '(region ((t (:background "#f6f5ef"))))
    ;; '(mode-line ((t (:background "#f6f5ef" :foreground "#333333" :box (:line-width -1 :style released-button)))))
    ;; '(mode-line-inactive ((t (:background "#ffffff" :foreground "#333333"))))
    ;; '(fringe ((t (:background "#f6f5ef"))))
    ;; '(minibuffer-prompt ((t (:foreground "#f47321" :weight bold))))
    ;; '(font-lock-builtin-face ((t (:foreground "#62124b"))))
    ;; '(font-lock-comment-face ((t (:slant italic :foreground "#aea79f"))))
    ;; '(font-lock-constant-face ((t (:foreground "#f68d47"))))
    ;; '(font-lock-function-name-face ((t (:foreground "#860e73" :weight bold))))
    ;; '(font-lock-keyword-face ((t (:foreground "#f47321" :weight bold))))
    ;; '(font-lock-string-face ((t (:foreground "#dd1144"))))
    ;; '(font-lock-type-face ((t (:foreground "#83a525"))))
    ;; '(font-lock-variable-name-face ((t (:foreground "#8b005a"))))
    ;; '(font-lock-warning-face ((t (:foreground "#e80000" :weight bold))))
    ;; '(secondary-selection ((t (:background "PaleVioletRed3")))) ;; for gdb hightlighting
    ;; '(isearch ((t (:background "#fedfc7" :foreground "#333333"))))
    ;; '(lazy-highlight ((t (:background "#f6f5ef"))))
    ;; '(link ((t (:foreground "#0086b3" :underline t))))
    ;; '(link-visited ((t (:foreground "#800080" :underline t))))
    ;; '(button ((t (:background "#f6f5ef" :weight bold))))
    ;; '(header-line ((t (:background "#ffffff" :foreground "#62124b" :box nil))))
    ;; '(hl-line ((t (:background "#f6f5ef")))))
    
    (setq term-default-bg-color bg-color)
    (setq term-default-fg-color fg-color)
    `((background-color . ,bg-color)
      (foreground-color . ,fg-color)
      (cursor-color     . ,cur-color)))
  )

(defvar *my-color-themes*
  '((dark-night . "dark night")
    (gray-scale . "gray scale")
    (xcode-old  . "xcode old")
    (xcode      . "xcode")
    (radiance   . "radiance")))

(defun darwin-setting (face-config)
  (setq initial-frame-alist `((top   . 25)  (left   . 10)
                              (width . 215)  (height . 62)
                              (menu-bar-lines . 1) (tool-bar-lines . 1)
                              ,@face-config
                              (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
  (setq default-frame-alist `((width . 95)  (height . 50)
                              (menu-bar-lines . 1) (tool-bar-lines . 1)
                              ,@face-config
                              (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
  (setq special-display-frame-alist `((width . 95) (height . 50)
                                      (menu-bar-lines . 1) (tool-bar-lines . 1)
                                      ,@face-config
                                      (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
  )

(defun linux-setting (face-config)
  (setq initial-frame-alist `((top   . 25)  (left   . 10)
                              (width . 95)  (height . 80)
                              (menu-bar-lines . 1) (tool-bar-lines . 1)
                              ,@face-config
                              ))
  (setq special-display-frame-alist `((top   . 25)  (left   . 10)
                                      (width . 95)  (height . 70)
                                      (menu-bar-lines . 1) (tool-bar-lines . 1)
                                      ,@face-config
                                      ))
  (setq default-frame-alist `((top   . 50)  (left   . 120)
                              (width . 95)  (height . 80)
                              (menu-bar-lines . 1) (tool-bar-lines . 1)
                              ,@face-config
                              ))
  )

;; Emacs 23.1 on OS X transparent background : "ARGBBB000000"

(defun set-theme (theme-name)
  (interactive "aTheme name: ")
  (let ((cur-frame nil)) ;; (selected-frame)))
    (if (and (fboundp theme-name)
             (assoc theme-name *my-color-themes*))
        (let ((face-config (funcall theme-name)))
          ;; =================================
          ;; change gdb highlight color
          ;; =================================
          ;; (set-face-background 'secondary-selection "PaleVioletRed3")
          (if (string= system-type "darwin")
              (darwin-setting face-config)
              (linux-setting  face-config))
          )
        (message "Theme is not recognized"))
    )
  )

(if (not window-system)
    (terminal-settings)
    (set-theme 'xcode))
    ;; (set-theme 'dark-night))

(require 'parenface)

(setq search-highlight t)
(setq font-lock-maximum-decoration t)
(setq query-replace-highlight t)

(setq scroll-step 5)
