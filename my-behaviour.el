;; ===========================
;; Paranthesis match
;; ===========================

(require 'mic-paren) 

;; Showing matching parentheses in GNU Emacs:
(setq show-paren-style 'parenthesis) 

;; Showing region between parentheses in GNU Emacs:

;; Tip - If the matching parenthesis should be outside 
;; the visible part of the window, you can always jump 
;; to it using the following functions: forward-sexp 
;; or backward-sexp.


;; ===========================
;; pabbrev-mode
;; ===========================
;; (require 'pabbrev )
;; (global-pabbrev-mode)
;; (setq pabbrev-read-only-error nil)


;; ===========================
;; Compilation
;; ===========================

(setq compilation-scroll-output t)

;; (defun cc-goto-first-error( buffer exit-condition )
;;   (with-current-buffer buffer 
;;     (goto-char (point-min)) 
;;     (compilation-next-error 1)))
;; (add-to-list 'compilation-finish-functions 'cc-goto-first-error) 

(setq compilation-auto-jump-to-first-error 1)

;; ===========================
;; Frame setting
;; ===========================

(setq special-display-buffer-names '("*compilation*", "*ASCII*", "*Process List*", "*Buffer List*", "*terminal<1>*"))
(setq special-display-regexps '("\*terminal\<1\>\*"))

(setq display-buffer-reuse-frames t)
(setq pop-up-frames nil)
(setq pop-up-windows nil)

;; ===========================
;; No tabs in files
;; ===========================

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;; ===========================
;; Buffer Navigation
;; ============================

;; Iswitchb is much nicer for inter-buffer navigation.
(cond ((fboundp 'iswitchb-mode)                ; GNU Emacs 21
       (iswitchb-mode 1)
       (setq iswitchb-default-method 'samewindow))
      ((fboundp 'iswitchb-default-keybindings) ; Old-style activation
       (iswitchb-default-keybindings))
      (t nil))                                 ; Oh well.

;; keys for buffer creation and navigation
(global-set-key [(control x) (control b)] 'iswitchb-buffer)
(global-set-key [(control x) (f)] 'find-file)


;; ============================
;; Command frequency logging
;; ============================

;; (setq-default command-frequency-table-file "~/.emacs.d/frequencies")
;; (require 'command-frequency)
;; (command-frequency-table-load)
;; (command-frequency-mode 1)
;; (command-frequency-autosave-mode 1)


;; ============================
;; Display
;; ============================

;; disable startup message
(setq inhibit-startup-message t)

;; setup font
;;(set-default-font
;; "-Misc-Fixed-Medium-R-Normal--15-140-75-75-C-90-ISO8859-1")

;; display the current time
(display-time-mode t)

;; Show column number at bottom of screen
(column-number-mode 1)

;; alias y to yes and n to no
(defalias 'yes-or-no-p 'y-or-n-p)

;; highlight matches from searches
(setq isearch-highlight t)
(setq search-highlight t)
(setq-default transient-mark-mode t)

;; (when (fboundp 'blink-cursor-mode)
;;   (blink-cursor-mode -1))
(blink-cursor-mode t)


;; ===========================
;; For Mac OS X
;; ============================

;; Avoid hiding with M-h
(setq mac-pass-command-to-system nil)

;; ===========================
;; Other behaviours
;; ===========================

;; Pgup/dn will return exactly to the starting point.
(setq scroll-preserve-screen-position 1)

;; don't automatically add new lines when scrolling down at
;; the bottom of a buffer
(setq next-line-add-newlines nil)

;; scroll just one line when hitting the bottom of the window
(setq scroll-step 4)
(setq scroll-conservatively 20)

;; format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")

;; show a menu only when running within X (save real estate when
;; in console)
(menu-bar-mode (if window-system 1 -1))

;; turn off the toolbar
(if (and  (>= emacs-major-version 21) window-system)
    (tool-bar-mode -1))

;; turn on word wrapping in text mode
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; replace highlighted text with what I type rather than just
;; inserting at a point
(delete-selection-mode t)

;; resize the mini-buffer when necessary
(setq resize-minibuffer-mode t)

;; highlight during searching
(setq query-replace-highlight t)

;; highlight incremental search
(setq search-highlight t)

;; kill trailing white space on save
;; -------- (autoload 'nuke-trailing-whitespace "whitespace" nil t)
;; -------- (add-hook 'write-file-hooks 'nuke-trailing-whitespace)


;; (add-hook 'first-change-hook 
;;           #'(lambda nil 
;;               ;; set for all 'regular' buffers 
;;               (unless (string-match "\\`[ *].*[*]\\'" 
;;                                     (buffer-name)) 
;;                 (setq buffer-offer-save t)))) 
