
;; ==========================================================
;; Setup syntax, background, and foreground coloring
;; ==========================================================
(require 'font-lock)
(global-font-lock-mode t)
;; (setq font-lock-auto-fontify t)
;; (setq font-lock-maximum-decoration t)
;; (make-face-italic font-lock-comment-face)

(auto-fill-mode nil)

(make-face 'font-lock-number-face)
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
;; (set-face-foreground 'font-lock-number-face "DodgerBlue4")



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

(add-hook 'eshell-mode-hook
          '(lambda ()
                (set-face-attribute 'eshell-prompt  nil :foreground "DodgerBlue")))

(defun dark-night (&optional cur-frame)
  (let* ((bg-color     "black")
         (fg-color     "white")
         (cur-color    "yellow")
         (region-color "blue4")
         (default-settings (if (string= system-type "darwin")
                               `(((t (:background ,bg-color :foreground ,fg-color :font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))))
                               `(((t (:background ,bg-color :foreground ,fg-color :family "Monaco" :height 80 :width normal :weight normal))))
                               ))
         )    
    ;; ;; icy-mode 
    ;; ;; (setq icicle-region-background region-color)
    ;; ;; (set-face-attribute 'icicle-special-candidate  cur-frame :background region-color)
    ;; ;; (set-face-attribute 'icicle-mode-line-help     cur-frame :foreground "blue4")
    ;; ;; (set-face-attribute 'icicle-multi-command-completion cur-frame :foreground "red4" :background "lightgreen"
    ;; ;;                     :weight 'bold :box '(:line-width -1 :style released-button))

    (custom-set-faces
     `(default ,@default-settings)
     ;; :family "Monaco" :height 80 :width normal :weight normal))))
     `(cursor ((t (:background ,cur-color :foreground ,fg-color))))
     '(region ((t (:background "blue4"))))
     '(mode-line ((t (:background "grey70" :foreground "black"
                                  :box (:line-width -1 :style released-button)))))
     '(mode-line-inactive ((t (:background "grey30" :foreground "grey80"
                                           :box (:line-width -1 :style pressed-button)))))
     '(fringe ((t (:background "grey10"))))
     '(minibuffer-prompt ((t (:foreground "cyan"))))
     '(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
     '(font-lock-comment-face ((t (:foreground "chocolate1" :slant italic))))
     '(font-lock-constant-face ((t (:foreground "Aquamarine"))))
     '(font-lock-function-name-face ((t (:foreground "DeepSkyBlue"))))
     '(font-lock-keyword-face ((t (:foreground "Cyan1"))))
     '(font-lock-string-face ((t (:foreground "LightSalmon"))))
     '(font-lock-number-face ((t (:foreground "LightSalmon"))))
     '(font-lock-type-face ((t (:foreground "PaleGreen"))))
     '(font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
     '(font-lock-warning-face ((t (:foreground "Pink" :weight bold))))
     '(secondary-selection ((t (:background "PaleVioletRed3")))) ;; for gdb hightlighting
     '(dired-directory ((t (:foreground "Skyblue2"))))
     ;; '(isearch ((t (:background "#fedfc7" :foreground "#333333"))))
     ;; '(lazy-highlight ((t (:background "#f6f5ef"))))
     ;; '(link ((t (:foreground "#0086b3" :underline t))))
     ;; '(link-visited ((t (:foreground "#800080" :underline t))))
     `(button ((t (:background ,bg-color :weight bold))))
     `(org-hide ((t (:foreground ,bg-color))))
     ;; '(header-line ((t (:background "#ffffff" :foreground "#62124b" :box nil))))
     ;; '(hl-line ((t (:background "#f6f5ef"))))
     )
    ;; (set-face-attribute 'font-lock-comment-face cur-frame :foreground "chocolate1" :slant 'italic)

    (setq term-default-bg-color bg-color)
    (setq term-default-fg-color fg-color)
    `((background-color . ,bg-color)
      (foreground-color . ,fg-color)
      (cursor-color     . ,cur-color))
    )  ;; (set-face-background 'secondary-selection "cyan")
  )

(defun gray-scale (&optional cur-frame)
  (let* ((bg-color     "gray20")
         (fg-color     "white")
         (cur-color    "yellow")
         (region-color "blue4")
         (default-settings (if (string= system-type "darwin")
                               `(((t (:background ,bg-color :foreground ,fg-color :font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))))
                               `(((t (:background ,bg-color :foreground ,fg-color :family "Monaco" :height 80 :width normal :weight normal))))
                               ))
         )
    ;; icy-mode 
    ;; (setq icicle-region-background region-color)
    ;; (set-face-attribute 'icicle-special-candidate  cur-frame :background region-color)
    ;; (set-face-attribute 'icicle-mode-line-help     cur-frame :foreground "blue4")
    ;; (set-face-attribute 'icicle-multi-command-completion cur-frame :foreground "red4" :background "lightgreen"
    ;;                     :weight 'bold :box '(:line-width -1 :style released-button))

    (custom-set-faces
     `(default ,@default-settings) ;; :family "Monaco" :height 80  :width normal :weight normal))))
     `(cursor  ((t (:background ,cur-color :foreground ,fg-color))))
     '(region  ((t (:background "blue4"))))
     '(mode-line ((t (:background "grey70" :foreground "black"
                                  :box (:line-width -1 :style released-button)))))
     '(mode-line-inactive ((t (:background "grey30" :foreground "grey80"
                                           :box (:line-width -1 :style pressed-button)))))
     '(fringe ((t (:background "grey15"))))
     '(minibuffer-prompt ((t (:foreground "cyan"))))
     '(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
     '(font-lock-comment-face ((t (:foreground "chocolate1" :slant italic))))
     '(font-lock-constant-face ((t (:foreground "Aquamarine"))))
     '(font-lock-function-name-face ((t (:foreground "DeepSkyBlue"))))
     '(font-lock-keyword-face ((t (:foreground "Cyan1"))))
     '(font-lock-string-face ((t (:foreground "LightSalmon"))))
     '(font-lock-number-face ((t (:foreground "LightSalmon"))))
     '(font-lock-type-face ((t (:foreground "PaleGreen"))))
     '(font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
     '(font-lock-warning-face ((t (:foreground "Pink" :weight bold))))
     '(font-lock-preprocessor-face ((t (:foreground "LightSteelBlue"))))
     '(secondary-selection ((t (:background "PaleVioletRed3")))) ;; for gdb hightlighting
     '(dired-directory ((t (:foreground "Skyblue2"))))
     ;; '(isearch ((t (:background "#fedfc7" :foreground "#333333"))))
     ;; '(lazy-highlight ((t (:background "#f6f5ef"))))
     ;; '(link ((t (:foreground "#0086b3" :underline t))))
     ;; '(link-visited ((t (:foreground "#800080" :underline t))))
     `(button ((t (:background ,bg-color :weight bold))))
     `(org-hide ((t (:foreground ,bg-color))))
     ;; '(header-line ((t (:background "#ffffff" :foreground "#62124b" :box nil))))
     ;; '(hl-line ((t (:background "#f6f5ef"))))
     )
    
    (setq term-default-bg-color bg-color)
    (setq term-default-fg-color fg-color)
    `((bac:kground-color . ,bg-color)
      (foreground-color . ,fg-color)
      (cursor-color     . ,cur-color))
  ;; (set-face-background 'secondary-selection "cyan")
    )
  )

(defun xcode (&optional cur-frame)
  (let* ((bg-color     "white")
         (fg-color     "black")
         (cur-color    "DarkSlateGray4")
         (ml-bgcolor   "grey60")
         (region-color "LightBlue2")
         (default-settings (if (string= system-type "darwin")
                               `(((t (:background ,bg-color :foreground ,fg-color :font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))))
                               `(((t (:background ,bg-color :foreground ,fg-color :family "Monaco" :height 80 :width normal :weight normal))))
                               ))
         )

    ;; ;; icy-mode 
    ;; ;; (setq icicle-region-background region-color)
    ;; ;; (set-face-attribute 'icicle-special-candidate        cur-frame :background region-color)
    ;; ;; (set-face-attribute 'icicle-mode-line-help           cur-frame :foreground "blue4")
    ;; ;; (set-face-attribute 'icicle-multi-command-completion cur-frame :foreground "red4" :background "lightgreen"
    ;; ;;                     :weight 'bold :box '(:line-width -1 :style released-button))

    (custom-set-faces
     `(default ,@default-settings)
     `(cursor ((t (:background ,cur-color :foreground ,fg-color))))
     '(region ((t (:background "LightBlue2"))))
     `(mode-line ((t (:background ,ml-bgcolor :foreground "black"
                                  :box (:line-width -1 :style released-button)))))
     '(mode-line-inactive ((t (:background "grey90" :foreground "grey20"
                                           :box (:line-width -1 :style pressed-button)))))
     '(fringe ((t (:background "grey95"))))
     '(minibuffer-prompt ((t (:foreground "blue" :weight bold))))
     '(font-lock-builtin-face ((t (:foreground "MediumOrchid4"))))
     '(font-lock-comment-face ((t (:foreground "ForestGreen" :slant italic))))
     '(font-lock-constant-face ((t (:foreground "Cyan3"))))
     '(font-lock-function-name-face ((t (:foreground "DarkCyan" ))))
     '(font-lock-keyword-face ((t (:foreground "Purple"))))
     '(font-lock-string-face ((t (:foreground "Red3"))))
     '(font-lock-number-face ((t (:foreground "Red3"))))
     '(font-lock-type-face ((t (:foreground "VioletRed3"))))
     '(font-lock-variable-name-face ((t (:foreground "DarkBlue"))))
     '(font-lock-warning-face ((t (:foreground "Red1" :weight bold))))
     '(font-lock-preprocessor-face ((t (:foreground "LightSteelBlue"))))
     '(secondary-selection ((t (:background "PaleVioletRed3")))) ;; for gdb hightlighting
     '(dired-directory ((t (:foreground "blue"))))
     '(isearch ((t (:background "magenta3" :foreground "lightskyblue1"))))
     '(lazy-highlight ((t (:background "paleturquoise"))))
     '(link ((t (:foreground "blue1" :underline t))))
     '(link-visited ((t (:foreground "magenta4" :underline t))))
     `(button ((t (:background ,bg-color :weight bold))))
     '(header-line ((t (:background "grey90" :foreground "grey20" :box nil))))
     `(org-hide ((t (:foreground ,bg-color))))
     ;; '(hl-line ((t (:background "#f6f5ef"))))
     )

    (set-face-background 'mode-line ml-bgcolor)
    (setq term-default-bg-color bg-color)
    (setq term-default-fg-color fg-color)
    `((background-color . ,bg-color)
      (foreground-color . ,fg-color)
      (cursor-color     . ,cur-color))
    )
  )

(defun radiance (&optional cur-frame)
  (let* ((bg-color     "#ffffff")
         (fg-color     "#333333")
         (cur-color    "#aea79f")
         (region-color "#f6f5ef")
         (default-settings (if (string= system-type "darwin")
                               `(((t (:background ,bg-color :foreground ,fg-color :font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))))
                               `(((t (:background ,bg-color :foreground ,fg-color :family "Monaco" :height 80 :width normal :weight normal))))
                               ))
         )
    
    ;; ;; org-mode 
    ;; (set-face-attribute 'org-hide  cur-frame :foreground bg-color)
    ;; ;; icy-mode 
    ;; ;; (setq icicle-region-background region-color)
    ;; ;; (set-face-attribute 'icicle-special-candidate  cur-frame :background region-color)
    ;; ;; (set-face-attribute 'icicle-mode-line-help     cur-frame :foreground "blue4")
    ;; ;; (set-face-attribute 'icicle-multi-command-completion cur-frame :foreground "red4" :background "lightgreen"
    ;; ;;                     :weight 'bold :box '(:line-width -1 :style released-button))

    (custom-set-faces
     `(default ,@default-settings)
     `(cursor ((t (:background ,cur-color :foreground ,fg-color))))
     '(region ((t (:background "#f6f5ef" :foreground "#333333"))))
     '(region ((t (:background "#f6f5ef"))))
     '(mode-line ((t (:background "#f6f5ef" :foreground "#333333" :box (:line-width -1 :style released-button)))))
     '(mode-line-inactive ((t (:background "#ffffff" :foreground "#333333"))))
     '(fringe ((t (:background "#f6f5ef"))))
     '(minibuffer-prompt ((t (:foreground "#f47321" :weight bold))))
     '(font-lock-builtin-face ((t (:foreground "#62124b"))))
     '(font-lock-comment-face ((t (:foreground "#aea79f" :slant italic ))))
     '(font-lock-constant-face ((t (:foreground "#f68d47"))))
     '(font-lock-function-name-face ((t (:foreground "#860e73" :weight bold))))
     '(font-lock-keyword-face ((t (:foreground "#f47321" :weight bold))))
     '(font-lock-string-face ((t (:foreground "#dd1144"))))
     '(font-lock-type-face ((t (:foreground "#83a525"))))
     '(font-lock-variable-name-face ((t (:foreground "#8b005a"))))
     '(font-lock-warning-face ((t (:foreground "#e80000" :weight bold))))
     '(secondary-selection ((t (:background "PaleVioletRed3")))) ;; for gdb hightlighting
     '(isearch ((t (:background "#fedfc7" :foreground "#333333"))))
     '(lazy-highlight ((t (:background "#f6f5ef"))))
     '(link ((t (:foreground "#0086b3" :underline t))))
     '(link-visited ((t (:foreground "#800080" :underline t))))
     '(button ((t (:background "#f6f5ef" :weight bold))))
     '(header-line ((t (:background "#ffffff" :foreground "#62124b" :box nil))))
     ;; '(hl-line ((t (:background "#f6f5ef"))))
     `(org-hide ((t (:foreground ,bg-color))))
     ) 
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
    ;; (set-theme 'xcode))
    (set-theme 'dark-night))
    ;; (set-theme 'gray-scale))

(require 'parenface)

(setq search-highlight t)
(setq font-lock-maximum-decoration t)
(setq query-replace-highlight t)

;; (setq scroll-step 5)

(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/= (frame-parameter (selected-frame) 'alpha) 100)
      (set-frame-parameter (selected-frame) 'alpha '(100 100)))
      (set-frame-parameter (selected-frame) 'alpha '(50 80)))

;; (global-set-key (kbd "C-c t") 'toggle-transparency)

(defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))