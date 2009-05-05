;; ==========================================================
;; Setup syntax, background, and foreground coloring
;; ==========================================================

(if (not window-system)
    (progn        
      (require 'color-theme)
      ;; (color-theme-aalto-light)
      ;; (color-theme-fischmeister)
      ;; (color-theme-greiner)
      ;; (color-theme-high-contrast)
      ;; (color-theme-hober)
      ;; (color-theme-wheat)
      (color-theme-standard)
      ;; (color-theme-scintilla)
      ))

(require 'parenface)

(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color     "yellow")

;; (set-background-color "white")
;; (set-foreground-color "black")
;; (set-cursor-color     "grey")


(set-mouse-color "LightSkyBlue")

;; change region highlight color 
(set-face-background 'region "blue")

;; change gdb highlight color 
(set-face-background 'secondary-selection "VioletRed4")

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

;; =========================
;; On Mac, for Carbon Emacs
;; =========================

(if (string= system-type "darwin")
    (progn
      (setq initial-frame-alist '((top   . 25)  (left   . 10)
                                  (width . 215)  (height . 62)
                                  (background-color .   "black")
                                  (foreground-color .   "white")
                                  (cursor-color     . "yellow")
                                  (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
      (setq default-frame-alist '((width . 95)  (height . 50)
                                  (background-color .   "black")
                                  (foreground-color .   "white")
                                  (cursor-color     . "yellow")
                                  (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
      ))


;; fonts
;; (set-default-font "-apple-courier-medium-r-normal--12-120-72-72-m-120-mac-roman")
;; (set-default-font "-apple-futura condensed-medium-r-normal--0-0-0-0-m-0-mac-roman")
;; (set-default-font "-apple-apple casual-medium-r-normal--14-0-0-0-m-0-mac-roman")


;; (setq default-frame-alist
;;       (append '((font . "-apple-courier-medium-r-normal--12-120-72-72-m-120-mac-roman")
;;                 (background "black")
;;                 (foreground "white"))
;;               default-frame-alist))
