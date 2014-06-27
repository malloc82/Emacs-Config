;; -*- mode: Lisp -*-
(setq debug-on-error nil)
(setq visible-bell 1)
(blink-cursor-mode t)
(setq-default fill-column 115)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t) ;; disable startup message
(setq frame-title-format "emacs - %b") ;; format the title-bar to always include the buffer name
(setq resize-minibuffer-mode t) ;; resize the mini-buffer when necessary

(require 'linum+)
(setq linum-format "%4d")
(global-linum-mode t)
(column-number-mode t)

;; (require 'which-function)
(which-function-mode t)
(setq which-func-unknown "unknown")

(setq x-select-enable-clipboard t)       ;; can access clipboard
(setq ispell-program-name "aspell") ;; spell checker
(setq-default transient-mark-mode t)  ;; transient-mark-mode 
(setq scroll-preserve-screen-position 1) ;; Pgup/dn will return exactly to the starting point.
(setq next-line-add-newlines nil)

(require 'delsel)
(delete-selection-mode t)

(setq query-replace-highlight t) ;; highlight during searching

(setq-default indent-tabs-mode nil) ;; Tabs
(setq-default tab-width 4)

(when (string= system-type "darwin")
  (setq mac-pass-command-to-system nil))

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)  ;; scrolling

(when (and (>= emacs-major-version 21)
           window-system)
  (tool-bar-mode -1)
  (menu-bar-mode +1)) ;; tool bar / menu bar

(require 'mic-paren) 
(setq show-paren-style 'parenthesis) ;; Showing matching parentheses in GNU Emacs
(show-paren-mode t)

;; (add-hook 'text-mode-hook 'turn-on-auto-fill) ;; turn on word wrapping in text mode

;; ==================================================================
;; Interractively Do Things (ido)
;; ------------------------------------------------------------------
(require 'ido)
(ido-mode t)
(setq ido-use-filename-at-point nil)

;; ido bahavior for smex, modified keys in my-keys for smex
(require 'smex)
(smex-initialize)
;; ==================================================================

;; ============================================
;; Workgroups
;; --------------------------------------------
(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
;; (wg-load "/path/to/saved/workgroups")
;; ============================================


(add-to-list 'load-path (expand-file-name "~/.emacs.d/custom/config"))
(dolist (config-file '("backup"
                       "ac-config"
                       "compilation-config"
                       "dired-config"
                       ;; "eshell-config"
                       "etags-config"
                       "frame-settings"
                       "terminal-config"
                       "tramp-config"))
  (load-library config-file))


;; kill trailing white space on save
;; -------- (autoload 'nuke-trailing-whitespace "whitespace" nil t)
;; -------- (add-hook 'write-file-hooks 'nuke-trailing-whitespace)


;; (add-hook 'first-change-hook 
;;           #'(lambda nil 
;;               ;; set for all 'regular' buffers 
;;               (unless (string-match "\\`[ *].*[*]\\'" 
;;                                     (buffer-name)) 
;;                 (setq buffer-offer-save t)))) 


;; ================================
;; Icicles
;; =================================

;; (add-to-list 'load-path "~/.emacs.d/icicles")
;; (require 'icicles)
;; (icy-mode 1)

;; ============================
;; Command frequency logging
;; ============================

;; (setq-default command-frequency-table-file "~/.emacs.d/frequencies")
 ;; (require 'command-frequency)
;; (command-frequency-table-load)
;; (command-frequency-mode 1)
;; (command-frequency-autosave-mode 1)
