(deftheme radiance
  "Created 2015-06-26.")

(custom-theme-set-faces
 'radiance
 '(font-lock-preprocessor-face ((t (:foreground "#62124b"))))
 '(isearch ((t (:background "#fedfc7" :foreground "#333333"))))
 '(lazy-highlight ((t (:background "#f6f5ef"))))
 '(link ((t (:foreground "#0086b3" :underline t))))
 '(link-visited ((t (:foreground "#800080" :underline t))))
 '(header-line ((t (:background "#ffffff" :foreground "#62124b" :box nil))))
 '(default ((t (:background "#ffffff" :foreground "#333333"))))
 '(cursor ((t (:background "#aea79f" :foreground "#333333"))))
 '(region ((t (:background "#ffee9c"))))  ;; "LightGoldenrod1"
 '(mode-line ((t (:background "#f6f5ef" :foreground "#333333" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:background "#ffffff" :foreground "#333333" :box (:line-width -1 :style pressed-button)))))
 '(fringe ((t (:background "#f6f5ef"))))
 '(minibuffer-prompt ((t (:foreground "#f47321" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "#62124b"))))
 '(font-lock-comment-face ((t (:foreground "#aea79f" :slant italic ))))
 '(font-lock-constant-face ((t (:foreground "#f68d47"))))
 '(font-lock-function-name-face ((t (:foreground "#860e73" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "#f47321" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#dd1144"))))
 '(font-lock-number-face ((t (:foreground "#dd1144"))))
 '(font-lock-type-face ((t (:foreground "#83a525"))))
 '(font-lock-variable-name-face ((t (:foreground "#8b005a"))))
 '(font-lock-warning-face ((t (:foreground "#e80000" :weight bold))))
 '(secondary-selection ((t (:background "PaleVioletRed3")))) ;; for gdb hightlighting
 '(dired-directory ((t (:foreground "#3b99fc"))))
 '(highlight ((t (:background "gray88"))))
 '(button ((t (:background "#f6f5ef" :weight bold))))
 '(org-hide ((t (:foreground "#ffffff"))))
 '(ido-first-match ((t (:foreground "dark green"))))
 '(wg-mode-line-face ((t (:foreground "dark cyan")))))

(provide-theme 'radiance)
