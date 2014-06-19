(deftheme dark-night
  "Created 2014-06-19.")

(custom-theme-set-faces
 'dark-night
 '(font-lock-preprocessor-face ((t (:foreground "LightSteelBlue"))))
 '(isearch ((t (:background "magenta3" :foreground "lightskyblue1"))))
 '(lazy-highlight ((t (:background "paleturquoise"))))
 '(link ((t (:foreground "blue1" :underline t))))
 '(link-visited ((t (:foreground "magenta4" :underline t))))
 '(header-line ((t (:background "grey90" :foreground "grey20" :box nil))))
 '(default ((t (:background "black" :foreground "white" :font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))))
 '(cursor ((t (:background "yellow" :foreground "white"))))
 '(region ((t (:background "blue4"))))
 '(mode-line ((t (:background "grey70" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:background "grey30" :foreground "grey80" :box (:line-width -1 :style pressed-button)))))
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
 '(secondary-selection ((t (:background "PaleVioletRed3"))))
 '(dired-directory ((t (:foreground "Skyblue2"))))
 '(highlight ((t (:background "gray20"))))
 '(button ((t (:background "black" :weight bold))))
 '(org-hide ((t (:foreground "black")))))

(provide-theme 'dark-night)
