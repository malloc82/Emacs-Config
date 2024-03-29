(deftheme dark-night-white
  "Created 2014-06-19.")

(custom-theme-set-faces
 'dark-night-white
 '(font-lock-preprocessor-face ((t (:foreground "LightSteelBlue"))))
 '(isearch ((t (:background "magenta4" :foreground "lightskyblue1"))))
 '(lazy-highlight ((t (:background "paleturquoise" :distant-foreground "black"))))
 '(link ((t (:foreground "CadetBlue3" :underline t))))
 '(link-visited ((t (:foreground "magenta4" :underline t))))
 '(header-line ((t (:background "grey90" :foreground "grey20" :box nil))))
 '(default ((t (:background "black" :foreground "white"))))
 '(cursor ((t (:background "yellow" :foreground "white"))))
 '(region ((t (:background "RoyalBlue4" :foreground nil))))
 '(mode-line ((t (:background "grey70" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:background "grey30" :foreground "grey80" :box (:line-width -1 :style pressed-button)))))
 '(wg-mode-line-face ((t (:foreground "dark cyan"))))
 '(fringe ((t (:background "grey10"))))
 '(minibuffer-prompt ((t (:foreground "cyan"))))
 '(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
 ;; '(font-lock-comment-face ((t (:foreground "chocolate1" :slant italic))))
 '(font-lock-comment-face ((t (:foreground "chocolate1"))))
 '(font-lock-constant-face ((t (:foreground "Aquamarine"))))
 '(font-lock-function-name-face ((t (:foreground "DeepSkyBlue"))))
 '(font-lock-keyword-face ((t (:foreground "Cyan1"))))
 ;; '(font-lock-string-face ((t (:foreground "LightSalmon"))))
  `(font-lock-number-face ((t (:foreground "VioletRed3")))) ;; ,plum-3
  '(font-lock-number-face ((t (:foreground "LightSalmon"))))
 '(font-lock-type-face ((t (:foreground "PaleGreen"))))
 '(font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
 '(font-lock-warning-face ((t (:foreground "Pink" :weight bold))))
 '(secondary-selection ((t (:background "PaleVioletRed3" :distant-foreground "LightGoldenrod1"))))
 '(dired-directory ((t (:foreground "Skyblue2"))))
 '(highlight ((t (:background "dark slate gray" :foreground nil))))
 '(hl-line ((t (:background "gray20" :foreground nil))))
 '(button ((t (:background "black" :weight bold))))
 '(org-hide ((t (:foreground "black"))))
 '(ido-first-match ((t (:foreground "light green")))))

(provide-theme 'dark-night-white)
