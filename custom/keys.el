;; ============================
;; Key mappings
;; ============================

;; (global-set-key [(M-down)]   'scroll-up)        ; C-.
;; (global-set-key [(M-up)]     'scroll-down)      ; C-;

(load-library "kb-macros")

(line-number-mode 'default )

(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "M-c")   'comment-or-uncomment-region)

(define-key global-map '[f5]    'list-buffers)
;; (define-key global-map [?\M-\d] 'backward-kill-word)

(global-set-key (kbd "M-DEL") 'backward-kill-word)

(global-set-key (kbd "<f6>") 'toggle-truncate-lines)

(global-set-key [f7]   'compile)
(global-set-key [M-f7] 'compile)

;; (define-key global-map '[M-f8] 'first-error) ;; C-x `
;; (define-key global-map '[M-f9] 'next-error)  ;; C-x` or M-g n or M-g M-n
;; (define-key global-map '[C-f9] 'previous-error) ;; M-g p or M-g M-p

;;(define-key global-map '[f12] 'bury-buffer)

;; (define-key global-map '[f7] 'compile)
;; set up the compiling options
(setq compile-command "make"
      compilation-ask-about-save nil
      ;; compilation-window-height 40
      )

;; goto line
;; default: M-g g
;; (define-key global-map [?\C-l]  'goto-line)

(define-key global-map [?\M-\`] 'other-frame)
(define-key global-map [?\M-\\] 'other-window)
(global-unset-key [?\M-\d])  ;; unset M-backsapce
(global-set-key        [?\M-\[] 'previous-buffer)
(global-set-key        [?\M-\]] 'next-buffer)

;; helm
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

;; ==========================================
;; Frame move settings
;; ------------------------------------------
(require 'framemove)
(windmove-default-keybindings)
(setq framemove-hook-into-windmove t)
;; ==========================================

(unless window-system
  (progn
    (global-set-key (kbd "C-c [") 'windmove-left)
    (global-set-key (kbd "C-c ]") 'windmove-right)
    (global-set-key (kbd "C-c +") 'windmove-up)
    (global-set-key (kbd "C-c -") 'windmove-down)
    (global-set-key (kbd "C-c (") 'backward-sexp)
    (global-set-key (kbd "C-c )") 'forward-sexp)
    (global-set-key (kbd "C-c u") 'backward-up-list)
    (global-set-key (kbd "C-c d") 'down-list)

    ;; (global-set-key (kbd "C-c j") 'forward-paragraph)
    ;; (global-set-key (kbd "C-c k") 'backward-paragraph)
    ))

;; forward-word M-f
;; backward-word M-b

;; shrink window vertically
(define-key global-map [?\C-x ?&] 'shrink-window)

;; (global-set-key (kbd "C-c b")   'beginning-of-buffer)
;; (global-set-key (kbd "C-c e")   'end-of-buffer)

(when window-system
  (require 'redo+)
  (global-set-key (kbd "C-?")     'redo)
  (global-set-key [ (control \?)] 'redo)
  (global-set-key [ (control /)]  'undo))

(global-set-key [C-tab]     'hide-subtree)
(global-set-key [C-M-tab]   'show-subtree)
(global-set-key (kbd "C-`") 'show-subtree)

;; hi-lock-mode
;; C-x w l

(require 'highlight-symbol) ;; use default
(if window-system
    (progn
      (global-set-key (kbd "<f10>") 'highlight-symbol-at-point)
      (global-set-key (kbd "<f11>") 'highlight-symbol-next)
      (global-set-key (kbd "<f12>") 'highlight-symbol-prev))
  (progn
    (global-set-key (kbd "C-c @") 'highlight-symbol-at-point)
    (global-set-key (kbd "C-c n") 'highlight-symbol-next)
    (global-set-key (kbd "C-c p") 'highlight-symbol-prev)))

;;(defun scroll-up-one-line ()
;;      (interactive)
;;            (scroll-up 1))

;;(defun scroll-down-one-line ()
;;      (interactive)
;;            (scroll-down 1))
;;

(global-set-key (kbd "C-l") 'load-current-buffer-p)

;; =====================================================================================
;; VC-mode
;; -------------------------------------------------------------------------------------
(global-set-key (kbd "C-x v =") 'ediff-current-buffer-revision) ;; my-utils.el
;; =====================================================================================


;; ================================================
;; multi-terme
;; ------------------------------------------------
;; (global-set-key (kbd "C-c t") 'multi-term)
;; (global-set-key (kbd "C-c b") 'get-term)
;; (global-unset-key (kbd "C-z"))
;; (global-set-key (kbd "C-c y") 'term-paste)
;; ================================================


;; ========================================================================
;; smex
;; ------------------------------------------------------------------------
(global-set-key (kbd "M-x") 'smex) ;; ??
(global-set-key (kbd "M-X") 'smex-major-mode-commands) ;; ??
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; ??
;; ========================================================================


;; ============================================================================
;; alignment
;; ----------------------------------------------------------------------------
;; (global-set-key (kbd "C-c a =")
;;   (lambda () (interactive)
;;     (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))
;; ============================================================================

;; ============================================================================
;; Magit
;; ----------------------------------------------------------------------------
;; (global-set-key (kbd "C-c g") 'magit-status)


;; Multi Cursor
(require 'multiple-cursors)
(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this-symbol)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this-symbol)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-s-p")       'mc/mark-pop)

;; keyboard macro yank, can be repeated with C-u
(fset 'kbd-yank
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("" 0 "%d")) arg)))
(global-set-key (kbd "C-c C-y") 'kbd-yank)


;; source: https://emacs.stackexchange.com/questions/1020/problems-with-keybindings-when-using-terminal
;; xterm with the resource ?.VT100.modifyOtherKeys: 1
;; GNU Emacs >=24.4 sets xterm in this mode and define
;; some of the escape sequences but not all of them.
(defun character-apply-modifiers (c &rest modifiers)
  "Apply modifiers to the character C.
MODIFIERS must be a list of symbols amongst (meta control shift).
Return an event vector."
  (if (memq 'control modifiers) (setq c (if (or (and (<= ?@ c) (<= c ?_))
                                                (and (<= ?a c) (<= c ?z)))
                                            (logand c ?\x1f)
                                          (logior (lsh 1 26) c))))
  (if (memq 'meta modifiers) (setq c (logior (lsh 1 27) c)))
  (if (memq 'shift modifiers) (setq c (logior (lsh 1 25) c)))
  (vector c))
(defun my-eval-after-load-xterm ()
  (when (and (boundp 'xterm-extra-capabilities) (boundp 'xterm-function-map))
    (let ((c 32))
      (while (<= c 126)
        (mapc (lambda (x)
                (define-key xterm-function-map (format (car x) c)
                  (apply 'character-apply-modifiers c (cdr x))))
              '(;; with ?.VT100.formatOtherKeys: 0
                ("\e\[27;3;%d~" meta)
                ("\e\[27;5;%d~" control)
                ("\e\[27;6;%d~" control shift)
                ("\e\[27;7;%d~" control meta)
                ("\e\[27;8;%d~" control meta shift)
                ;; with ?.VT100.formatOtherKeys: 1
                ("\e\[%d;3~" meta)
                ("\e\[%d;5~" control)
                ("\e\[%d;6~" control shift)
                ("\e\[%d;7~" control meta)
                ("\e\[%d;8~" control meta shift)))
        (setq c (1+ c))))))
(eval-after-load "xterm" '(my-eval-after-load-xterm))


(when (not window-system) ;; Only use in tty-sessions.
  (defvar arrow-keys-map (make-sparse-keymap) "Keymap for arrow keys")
  (define-key esc-map "[" arrow-keys-map)
  (define-key arrow-keys-map "A" 'previous-line)
  (define-key arrow-keys-map "B" 'next-line)
  (define-key arrow-keys-map "C" 'forward-char)
  (define-key arrow-keys-map "D" 'backward-char))


(require 'anzu)
(global-set-key (kbd "M-s-5") 'query-replace)
(global-anzu-mode +1)
(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)


(defun kill-buffer-and-delete-frame2 ()
  "kill current buffer, then delete current window or frame if there is more than one frame opened"
  (interactive)
  (when (kill-buffer)
    (if (> (length (window-list)) 1)
        (delete-window)
      (if (> (length (frame-list)) 1)
          (delete-frame)))))

(global-set-key (kbd "C-x 5 k") 'kill-buffer-and-delete-frame2)


(defun delete-trailing-whitespace-and-save ()
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

(define-prefix-command 'ctrl-c-0-map)
(global-set-key (kbd "C-c 0") 'ctrl-c-0-map)
(define-key ctrl-c-0-map (kbd "s") 'delete-trailing-whitespace-and-save)
(define-key ctrl-c-0-map (kbd "g") 'magit-status)
(define-key ctrl-c-0-map (kbd "h") 'helm-comint-input-ring)
(define-key ctrl-c-0-map (kbd "t") 'neotree-toggle)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 50)
(run-at-time nil (* 5 60) 'recentf-save-list)

;; (defun recentf-ido-find-file ()
;;   "Find a recent file using Ido."
;;   (interactive)
;;   (let* ((file-assoc-list
;; 	      (mapcar (lambda (x)
;; 		            (cons (file-name-nondirectory x)
;; 			              x))
;; 		          recentf-list))
;; 	     (filename-list
;; 	      (remove-duplicates (mapcar #'car file-assoc-list)
;; 			                 :test #'string=))
;; 	     (filename (ido-completing-read "Choose recent file: "
;; 					                    filename-list
;; 					                    nil
;; 					                    t)))
;;     (when filename
;;       (find-file (cdr (assoc filename
;; 			                 file-assoc-list))))))

;; (define-key ctrl-c-0-map (kbd "r") 'recentf-ido-find-file)
;; (define-key ctrl-c-0-map (kbd "r") 'recentf-open-files)
(define-key ctrl-c-0-map (kbd "r") 'counsel-recentf)

(use-package counsel
  :ensure t
  :bind (("M-y" . counsel-yank-pop)
         :map ivy-minibuffer-map
         ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :bind (("C-x b"    . ivy-switch-buffer)
         :map ivy-minibuffer-map
         ("TAB"      . ivy-partial)
         ("<return>" . ivy-alt-done))
  :config
  (progn
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "%d/%d ")
    (setq ivy-display-style 'fancy)))


(use-package swiper
  :ensure t
  :bind (("C-s"     . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("<f1> f"  . counsel-describe-function)
         ("<f1> v"  . counsel-describe-variable)
         ("<f1> l"  . counsel-find-library)
         ("<f2> i"  . counsel-info-lookup-symbol)
         ("<f2> u"  . counsel-unicode-char)
         ("C-c g"   . counsel-git)
         ("C-c j"   . counsel-git-grep)
         ("C-c k"   . counsel-ag)
         ("C-x l"   . counsel-locate)
         ("C-S-o"   . counsel-rhythmbox))
  :config
  (progn
    ;; (ivy-mode 1)
    ;; (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; (setq ivy-count-format "%d/%d ")
    ;; (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r")  'counsel-expression-history)))
