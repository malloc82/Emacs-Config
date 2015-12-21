;; -*- mode: Lisp -*-
(setq confirm-kill-emacs 'yes-or-no-p)
(setq debug-on-error nil)
;; (setq visible-bell 1)
(setq visible-bell nil)
(setq ring-bell-function
      (lambda ()
        (invert-face 'mode-line)
        (run-with-timer 0.1 nil 'invert-face 'mode-line)))
(blink-cursor-mode t)
(setq-default fill-column 120)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t) ;; disable startup message
(setq frame-title-format "emacs - %b") ;; format the title-bar to always include the buffer name
(setq resize-minibuffer-mode t) ;; resize the mini-buffer when necessary
(put 'narrow-to-region 'disable nil)  ;; focus on a region
(put 'erase-buffer 'disabled nil)
(setq undo-limit 100000) ;; Increase number of undo
(when (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
  (setq shell-file-name "/bin/bash"))

(require 'linum+)
(setq linum-format (if window-system "%4d" "%4d \u2502 "))
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
;; Preventing auto-searches unless called explicitly
(setq ido-auto-merge-work-directories-length -1)
(define-key ido-file-dir-completion-map (kbd "C-c C-s")
      (lambda()
        (interactive)
        (ido-initiate-auto-merge (current-buffer))))

;; ;; From starter-kit
;; (ido-ubiquitous t)
;; (setq ido-enable-prefix nil
;;       ido-enable-flex-matching t
;;       ido-auto-merge-work-directories-length nil
;;       ido-create-new-buffer 'always
;;       ido-use-filename-at-point 'guess
;;       ido-use-virtual-buffers t
;;       ido-handle-duplicate-virtual-buffers 2
;;       ido-max-prospects 10)


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

;; ==================================================================
;; Ediff split behavior
;; ------------------------------------------------------------------
(setq ediff-split-window-function (if (> (frame-width) 150)
                                      'split-window-horizontally
                                      'split-window-vertically))
;; ==================================================================

(require 'hl-line+)
(setq global-hl-line-highlight t)
;; check out hl-line-overlay-priority

(add-to-list 'load-path (expand-file-name "~/.emacs.d/custom/config"))
(dolist (config-file '("backup"
                       "ac-config"
                       "compilation-config"
                       "dired-config"
                       ;; "eshell-config"
                       "etags-config"
                       "frame-settings"
                       "shell-mode-config"
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
