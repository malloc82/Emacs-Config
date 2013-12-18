

;; ===========================
;; Alarm Bell Setting
;; ===========================

(setq visible-bell 1)
;; (setq visible-bell nil)
;;     (setq ring-bell-function `(lambda ()
;;                                 (set-face-background 'default "DodgerBlue")
;;                                 (set-face-background 'default "black")))

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

;; (setq special-display-buffer-names '("*compilation*"
;;                                      "*ASCII*"
;;                                      "*Process List*"
;;                                      "*Buffer List*"
;;                                      "*TeX Help*"
;;                                      "*Async Shell Command*"))

(setq special-display-buffer-names '("*compilation*"))
(setq special-display-function
      (lambda (buffer &optional args)
        (split-window)
        ;; (switch-to-buffer buffer)
        (get-buffer-window buffer 0)))
(setq display-buffer-reuse-frames t)
(setq pop-up-frames nil)
(setq pop-up-windows nil)

;; ===========================
;; No tabs in files
;; ===========================

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; ============================
;; Spell checker
;; ============================

(setq ispell-program-name "aspell")

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

;; alias y to yes and n to no
(defalias 'yes-or-no-p 'y-or-n-p)

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

;; =================================
;; Workgroups
;; =================================

(require 'workgroups)
(setq wg-prefix-key (kbd "C-c w"))
(workgroups-mode 1)
;; (wg-load "/path/to/saved/workgroups")

;; =================================
;; Scrolling
;; =================================

;; scroll just one line when hitting the bottom of the window
;; (setq redisplay-dont-pause t)
;; (setq scroll-conservatively 20)

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")

;; show a menu only when running within X (save real estate when
;; in console)
;; (menu-bar-mode (if window-system 1 -1))

;; turn off the toolbar
(when (and  (>= emacs-major-version 21)
            window-system)
  (message "---------------- here")
  (setq tool-bar-mode nil))

(message "---------------- too-bar-mode : %s" tool-bar-mode)
;; turn on word wrapping in text mode
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; resize the mini-buffer when necessary
(setq resize-minibuffer-mode t)

;; replace highlighted text with what I type rather than just
;; inserting at a point
(require 'delsel)
(delete-selection-mode 1)

;; highlight during searching
(setq query-replace-highlight t)

;; kill trailing white space on save
;; -------- (autoload 'nuke-trailing-whitespace "whitespace" nil t)
;; -------- (add-hook 'write-file-hooks 'nuke-trailing-whitespace)


;; (add-hook 'first-change-hook 
;;           #'(lambda nil 
;;               ;; set for all 'regular' buffers 
;;               (unless (string-match "\\`[ *].*[*]\\'" 
;;                                     (buffer-name)) 
;;                 (setq buffer-offer-save t)))) 


;; =======================
;; line-number-mode
;; =======================

(unless (string= system-type "darwin")
  (require 'linum+)
  (global-linum-mode t)
  )

(require 'which-func)
(which-func-mode t)
(setq which-func-unknown "unknown")

(setq x-select-enable-clipboard t)

;; =======================
;; eshell setting
;; =======================

(setq eshell-prompt-function
      (lambda ()
        (concat (format-time-string "%Y-%m-%d %H:%M " (current-time))
                (file-name-nondirectory (eshell/pwd))
                (if (= (user-uid) 0) " # " " $ "))))

;; scroll to bottom for eshell

(defun eshell-scroll-to-bottom (window display-start)
  (if (and window (window-live-p window))
      (let ((resize-mini-windows nil))
        (save-selected-window
          (select-window window)
          (save-restriction
            (widen)
            (when (> (point) eshell-last-output-start) ; we're editing a line. Scroll.
              (save-excursion
                (recenter -1)
                (sit-for 0))))))))

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (interactive)
              (add-hook 'window-scroll-functions 'eshell-scroll-to-bottom nil t)))


;; =======================
;; Frame move settings
;; =======================

(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)

;; =======================
;; Auto-complete settings
;; =======================

(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
    auto-complete-mode (lambda ()
                         (if (not (minibufferp (current-buffer)))
                             (auto-complete-mode 1))))
(real-global-auto-complete-mode t)

;; ================================
;; Etags setting
;; =================================

(require 'etags-select)
;; (require 'etags-table)
(setq etags-select-mode t)

(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

(setq tags-revert-without-query t)

(defun jds-find-tags-file ()
  "recursively searches each parent directory for a file named 'TAGS' and returns the
path to that file or nil if a tags file is not found. Returns nil if the buffer is
not visiting a file"
  (progn
      (defun find-tags-file-r (path)
         "find the tags file from the parent directories"
         (let* ((parent (file-name-directory path))
                (possible-tags-file (concat parent "TAGS")))
           (cond
             ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
             ((string= "/TAGS" possible-tags-file) (error "no tags file found"))
             (t (find-tags-file-r (directory-file-name parent))))))

    (if (buffer-file-name)
        (catch 'found-it 
          (find-tags-file-r (buffer-file-name)))
        (error "buffer is not visiting a file"))))

(defun jds-set-tags-file-path ()
  "calls `jds-find-tags-file' to recursively search up the directory tree to find
a file named 'TAGS'. If found, set 'tags-table-list' with that path as an argument
otherwise raises an error."
  (interactive)
  (setq tags-table-list (cons (jds-find-tags-file) tags-table-list)))

;; ;; delay search the TAGS file after open the source file
;; (add-hook 'emacs-startup-hook 
;; 	'(lambda () (jds-set-tags-file-path)))

;; ================================
;; Icicles
;; =================================

;; (add-to-list 'load-path "~/.emacs.d/icicles")
;; (require 'icicles)
;; (icy-mode 1)

;; ================================
;; Dired mode
;; =================================

;; (put 'dired-find-alternate-file 'disabled nil)

(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            (dired-omit-mode 1)
            (setq dired-omit-files "^\\.?#\\|^\\.[^.].+$")
            (setq dired-omit-extensions
                  (append '(".dvi" ".aux" ".blg" ".toc" ".log")
                          dired-omit-extensions))
            ;; (setq dired-omit-files
            ;;       (concat dired-omit-files "\\|^\\..+$"))
            ))

;; ================================
;; Multi-term settings
;; =================================

(require 'multi-term)
(setq multi-term-program "/bin/bash")
(setq multi-term-switch-after-close nil)

(defun last-term-buffer (l)
  "Return most recently used term buffer."
  (when l
	(if (eq 'term-mode (with-current-buffer (car l) major-mode))
	    (car l) (last-term-buffer (cdr l)))))

(defun get-term ()
  "Switch to the term buffer last used, or create a new one if
    none exists, or if the current buffer is already a term."
  (interactive)
  (let ((b (last-term-buffer (buffer-list))))
	(if (or (not b) (eq 'term-mode major-mode))
	    (multi-term)
        (switch-to-buffer b))))

;; ================================
;; Turn off debug for normal use
;; =================================

(setq debug-on-error nil)

;; ;; used to change case sensitive for search including find-tag
;; (set-default 'case-fold-search nil)

;; (add-hook 'term-exec-hook 
;;             (lambda () 
;;               (set-buffer-process-coding-system 'binary 'binary)))


;; =================================
;; Interractively Do Things (ido)
;; =================================
(require 'ido)
(ido-mode t)
(setq ido-use-filename-at-point nil)

;; ido bahavior for smex, modified keys in my-keys for smex
(require 'smex)
(smex-initialize)

;; =================================
;; Clojure nREPL
;; =================================
(add-hook 'nREPL/r-mode-hook
          #'(lambda ()
              (paredit-mode 1)))

(setq-default fill-column 115)

