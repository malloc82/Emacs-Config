;; ==========================================================
;; Setup syntax, background, and foreground coloring
;; ==========================================================

(if (not window-system)
    (progn        
      ;; use color-theme-select to check out other themes 
      (require 'color-theme)
      (color-theme-initialize)
      (color-theme-hober)
      (set-face-background 'secondary-selection "red")
      )
    (progn
      ;; (let ((bg-color "ARGBBB000000")
      ;;       (fg-color "white")
      ;;       (cur-color "yellow"))
      (let ((bg-color  "white")
            (fg-color  "black")
            (cur-color "blue"))
        ;; ================================
        ;; Color for black background
        ;; ================================
        ;; (set-background-color "black")
        ;; (set-foreground-color "white")
        ;; (set-cursor-color     "yellow")
        ;; (set-face-background 'region "blue")
        ;; (set-face-foreground 'font-lock-comment-face "chocolate1")
        
        
        ;; ================================
        ;; Color for white background
        ;; ================================
        
        (set-background-color bg-color)
        (set-foreground-color fg-color)
        (set-cursor-color     cur-color)
        ;; (set-face-background 'region "LightGoldenrod2")
        ;; (set-face-foreground 'font-lock-comment-face "Firebrick")
        ;; (set-face-foreground 'font-lock-comment-face "chocolate2")
        
        ;; (set-mouse-color "LightSkyBlue")
        
        
        ;; =========================
        ;; On Mac, for Carbon Emacs
        ;; =========================
        ;; (if (string= system-type "darwin")
        ;;    (progn
        (set-face-background 'secondary-selection "PaleVioletRed3")
        (if (string= system-type "darwin")
            (progn
              (setq initial-frame-alist '((top   . 25)  (left   . 10)
                                          (width . 215)  (height . 62)
                                          ;; (background-color . "black")
                                          ;; (foreground-color . "white")
                                          ;; (cursor-color     . "yellow")
                                          
                                          (background-color . "white")
                                          (foreground-color . "black")
                                          (cursor-color     . "blue")
                                          ;; (background-color . "ARGBBB000000") ;; transparent 
                                          ;; (foreground-color . "white")
                                          ;; (cursor-color     . "yellow")
                                          (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")
                                          ))
              (setq default-frame-alist '((width . 95)  (height . 50)
                                          ;; (background-color . "black")
                                          ;; (foreground-color . "white")
                                          ;; (cursor-color     . "yellow")
                                          
                                          (background-color . "white")
                                          (foreground-color . "black")
                                          (cursor-color     . "blue")
                                          ;; (background-color . "ARGBBB000000") ;; transparent 
                                          ;; (foreground-color . "white")
                                          ;; (cursor-color     . "yellow")
                                          (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")
                                          ))
              (setq special-display-frame-alist '((width . 95) (height . 50)
                                          (background-color . "white")
                                          (foreground-color . "black")
                                          (cursor-color     . "blue")
                                          ;; (background-color . "ARGBBB000000") transparent 
                                          ;; (foreground-color . "white")
                                          ;; (cursor-color     . "yellow")
                                          (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")                                                  
                                                  ))
              )
            (progn
              (setq initial-frame-alist '((top   . 25)  (left   . 10)
                                          (width . 215)  (height . 62)
                                          ;; (background-color . "black")
                                          ;; (foreground-color . "white")
                                          ;; (cursor-color     . "yellow")
                                          
                                          (background-color . "white")
                                          (foreground-color . "black")
                                          (cursor-color     . "blue")
                                          ))
              (setq default-frame-alist '((width . 95)  (height . 50)
                                          ;; (background-color . "black")
                                          ;; (foreground-color . "white")
                                          ;; (cursor-color     . "yellow")
                                          
                                          (background-color . "white")
                                          (foreground-color . "black")
                                          (cursor-color     . "blue")
                                          ))
              )          
            )
        ))
    
    )

(require 'parenface)

;; change region highlight color 

;; =================================
;; change gdb highlight color
;; =================================
;; for black 
;; (set-face-background 'secondary-selection "VioletRed4")
;; for white


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


;; fonts
;; (if (string= system-type "darwin")
;;     (progn
;;       (add-to-list 'initial-frame-alist )
;;       (add-to-list 'default-frame-alist (font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))
;;       ;; (setq initial-frame-alist '((font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
;;       ;; (setq default-frame-alist '((font . "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")))
;;       )
;;     )


;; (if (string= system-type "darwin")
;;     (set-default-font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman")
;;     )
;; (set-default-font "-apple-courier-medium-r-normal--12-120-72-72-m-120-mac-roman")
;; (set-default-font "-apple-futura condensed-medium-r-normal--0-0-0-0-m-0-mac-roman")
;; (set-default-font "-apple-apple casual-medium-r-normal--14-0-0-0-m-0-mac-roman")


;; (setq default-frame-alist
;;       (append '((font . "-apple-courier-medium-r-normal--12-120-72-72-m-120-mac-roman")
;;                 (background "black")
;;                 (foreground "white"))
;;               default-frame-alist))
