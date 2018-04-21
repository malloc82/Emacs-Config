(dolist (path `(,(expand-file-name "~/.emacs.d/custom")
                ,(expand-file-name "~/.emacs.d/custom/langs")
                ,(expand-file-name "~/.emacs.d/vendor")
                "PACKAGE_DIRECTORY"))
  (add-to-list 'load-path path))

(setq custom-file "~/.emacs.d/custom-lite.el")

(defalias 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs 'yes-or-no-p)
(global-linum-mode t)
(column-number-mode t)
(line-number-mode 'default )
(global-hl-line-mode t)

;; (require 'package) ;; lag a little bit
(package-initialize)

(require 'linum+)
(setq linum-format (if window-system "%4d" "%4d \u2502 "))

(require 'ido)
(ido-mode t)
(setq ido-use-filename-at-point nil)
;; Preventing auto-searches unless called explicitly
(setq ido-auto-merge-work-directories-length -1)
(define-key ido-file-dir-completion-map (kbd "C-c C-s")
      (lambda()
        (interactive)
        (ido-initiate-auto-merge (current-buffer))))

;; (require 'smex)
(smex-initialize)

(require 'delsel)
(delete-selection-mode t)

(setq-default indent-tabs-mode nil) ;; Tabs
(setq-default tab-width 4)
(setq next-line-add-newlines nil)

(require 'mic-paren)
(setq show-paren-style 'parenthesis) ;; Showing matching parentheses in GNU Emacs
(show-paren-mode t)

(require 'hl-line+)
(setq global-hl-line-highlight t)

(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "M-c")   'comment-or-uncomment-region)

(load "lisp-lang")

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/custom/themes"))

(custom-set-variables
 '(ansi-color-names-vector ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-safe-themes
   '("5973b028c7b67e82d5e6d5cf715c8721e6699e376650fbc7170416541ce0cc4a" ;; base16-default, for running things in terminal
     default))
 '(custom-enabled-themes '(base16-default))
 '(fci-rule-color "#383838"))

