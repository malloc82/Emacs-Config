;; -*- mode: Emacs-Lisp -*-

(setq confirm-kill-emacs 'yes-or-no-p)
(setq debug-on-error nil)
;; (setq visible-bell 1)
(setq visible-bell nil)
(setq ring-bell-function
      (lambda ()
        (invert-face 'mode-line)
        (run-with-timer 0.1 nil 'invert-face 'mode-line)))
(blink-cursor-mode t)
;; (setq-default fill-column 120)
(setq explicit-shell-file-name "/bin/bash")
(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t) ;; disable startup message
(setq frame-title-format "emacs - %b") ;; format the title-bar to always include the buffer name
(setq resize-minibuffer-mode t) ;; resize the mini-buffer when necessary
(put 'narrow-to-region 'disable nil)  ;; focus on a region
(put 'erase-buffer 'disabled nil)
(setq undo-limit 100000) ;; Increase number of undo
;; After first C-u C-SPC, keep pressing C-SPC to jump to previous positions
(setq set-mark-command-repeat-pop t)
(when (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
  (setq shell-file-name "/bin/bash"))

;; (require 'linum+)
;; (setq linum-format (if window-system "%4d\u2502" "%4d \u2502 "))
;; (global-linum-mode t)

(require 'nlinum)
(setq nlinum-format (if window-system "%4d\u2502" "%4d \u2502 "))
(global-nlinum-mode t)


(column-number-mode t)
(global-hl-line-mode t)

(when (and (>= emacs-major-version 21)
           window-system)
  (tool-bar-mode -1)
  (menu-bar-mode +1)
  (scroll-bar-mode -1)) ;; tool bar / menu bar
;; more info on tool bar: https://www.emacswiki.org/emacs/ScrollBar

;; (require 'which-function)
(which-function-mode t)
(setq which-func-unknown "unknown")

(setq x-select-enable-clipboard t)       ;; can access clipboard
(setq ispell-program-name "aspell") ;; spell checker
(setq-default transient-mark-mode t)  ;; transient-mark-mode
(setq scroll-preserve-screen-position 1) ;; Pgup/dn will return exactly to the starting point.

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

(require 'mic-paren)
(setq show-paren-style 'parenthesis) ;; Showing matching parentheses in GNU Emacs
(show-paren-mode t)

;; (add-hook 'text-mode-hook 'turn-on-auto-fill) ;; turn on word wrapping in text mode

;; ;; ===============================
;; ;; Interractively Do Things (ido)
;; ;; ===============================
;; (require 'ido)
;; (ido-mode t)
;; (setq ido-use-filename-at-point nil)
;; ;; Preventing auto-searches unless called explicitly
;; (setq ido-auto-merge-work-directories-length -1)
;; (define-key ido-file-dir-completion-map (kbd "C-c C-s")
;;       (lambda()
;;         (interactive)
;;         (ido-initiate-auto-merge (current-buffer))))
;; ;; (setq ido-separator "\n")
;; ;; (setq ido-enable-flex-matching t)

;; ;; ;; From starter-kit
;; ;; (ido-ubiquitous t)
;; ;; (setq ido-enable-prefix nil
;; ;;       ido-enable-flex-matching t
;; ;;       ido-auto-merge-work-directories-length nil
;; ;;       ido-create-new-buffer 'always
;; ;;       ido-use-filename-at-point 'guess
;; ;;       ido-use-virtual-buffers t
;; ;;       ido-handle-duplicate-virtual-buffers 2
;; ;;       ido-max-prospects 10)


;; ;; ido bahavior for smex, modified keys in my-keys for smex
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "C-c M-x") 'execute-extended-command) ;; original M-x

;; ==================================================================

;; ============================================
;; Workgroups
;; --------------------------------------------
;; (require 'workgroups)
;; (setq wg-prefix-key (kbd "C-c w"))
;; (workgroups-mode 1)
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
:;; check out hl-line-overlay-priority

(add-to-list 'load-path (expand-file-name "~/.emacs.d/custom/config"))
(dolist (config-file '("backup"
                       ;; "ac-config"
                       "compilation-config"
                       "dired-config"
                       "eshell-config"
                       ;; "etags-config"   ;; conflict with cider M-.
                       "frame-settings"
                       "shell-mode-config"
                       "terminal-config"
                       "tramp-config"))
  (load-library config-file))


;; kill trailing white space on save
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq show-trailing-whitespace t)
(setq next-line-add-newlines nil)

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

;; Minimap setting
(setq minimap-hide-scroll-bar t)
(setq minimap-window-location 'right)
(setq minimap-width-fraction 0.10)
(setq minimap-minimum-width 25)
(setq minimap-update-delay 0)
;; (setq minimap-recenter-type 'middle)


;; Neotree
(setq neo-window-fixed-size nil)


(defun my-split-window-sensibly (&optional window)
  (let ((window (or window (selected-window))))
    (or (and (window-splittable-p window t)
             ;; Split window vertically.
             (with-selected-window window
               (split-window-below)))
        (and (window-splittable-p window)
             (with-selected-window window
             ;; Split window horizontally.
               (split-window-right)))
        (and (eq window (frame-root-window (window-frame window)))
             (not (window-minibuffer-p window))
             ;; If WINDOW is the only window on its frame and is not the
             ;; minibuffer window, try to split it horizontally disregarding
             ;; the value of `split-width-threshold'.
             (let ((split-width-threshold 0))
               (when (window-splittable-p window t)
                 (with-selected-window window
                   (split-window-right))))))))

;; (setq split-window-preferred-function nil)


(setq frame-title-format '("%b@" (:eval (or (file-remote-p default-directory 'host) system-name)) " — Emacs"))

;; https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag
(setq auto-window-vscroll nil)

(require 'grep+)
(grep-apply-setting 'grep-find-command '("find . -not \\( -name \"TAGS\" -o -ipath \"*/.git/*\" -o -ipath \"*/target/*\" -o -ipath \"*/.idea/*\" \\) -type f -exec grep --color=auto -InH --null -e  \\{\\} +" . 145))
