;; ============================
;; Key mappings
;; ============================

;; (global-set-key [(M-down)]   'scroll-up)        ; C-.
;; (global-set-key [(M-up)]     'scroll-down)      ; C-;

(line-number-mode 'default )

(define-key global-map '[f2] 'delete-window)
(define-key global-map '[f3] 'uncomment-region)
(define-key global-map '[f4] 'comment-region)
(define-key global-map '[f5] 'list-buffers)
(global-set-key (kbd "<f6>") 'toggle-truncate-lines)
(global-set-key [f7] 'compile)
(global-set-key [M-f7] 'compile)

;; (define-key global-map '[M-f8] 'first-error) ;; C-x `
;; (define-key global-map '[M-f9] 'next-error)  ;; C-x` or M-g n or M-g M-n
;; (define-key global-map '[C-f9] 'previous-error) ;; M-g p or M-g M-p

;;(define-key global-map '[f12] 'bury-buffer)

;; (define-key global-map '[f7] 'compile)
;; set up the compiling options
(setq compile-command "make"
      compilation-ask-about-save nil
      compilation-window-height 10)

;; goto line
;; default: M-g g
(define-key global-map [?\C-l]  'goto-line)

(define-key global-map [?\M-\`] 'other-frame)
(define-key global-map [?\M-\\] 'other-window)
(global-unset-key [?\M-\d])  ;; unset M-backsapce
(global-set-key        [?\M-\[] 'previous-buffer)
(global-set-key        [?\M-\]] 'next-buffer)

(global-set-key [M-S-left]  'windmove-left)   ; move to left windnow
(global-set-key [M-S-right] 'windmove-right)  ; move to right window
(global-set-key [M-S-up]    'windmove-up)     ; move to upper window
(global-set-key [M-S-down]  'windmove-down)   ; move to downer window

(global-set-key [M-left]    'windmove-left)   ; move to left windnow
(global-set-key [M-right]   'windmove-right)  ; move to right window
(global-set-key [M-up]      'windmove-up)     ; move to upper window
(global-set-key [M-down]    'windmove-down)   ; move to downer window

;; forward-word M-f
;; backward-word M-b

;; shrink window vertically
(define-key global-map [?\C-x ?&] 'shrink-window)

;; (global-set-key (kbd "C-c b")   'beginning-of-buffer)
;; (global-set-key (kbd "C-c e")   'end-of-buffer)

(when window-system
  (require 'redo+) 
  (global-set-key (kbd "C-'")     'redo)
  (global-set-key [ (control \')] 'redo)
  (global-set-key [ (control /)]  'undo))

(global-set-key [C-tab]       'hide-subtree)
(global-set-key (kbd "C-`")   'show-subtree)
(global-set-key (kbd "C-c s") 'show-subtree)

;; hi-lock-mode
;; C-x w l

(require 'highlight-symbol)
(global-set-key (kbd "<f10>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f11>") 'highlight-symbol-next)
(global-set-key (kbd "<f12>") 'highlight-symbol-prev)

;;(defun scroll-up-one-line ()
;;      (interactive)
;;            (scroll-up 1))

;;(defun scroll-down-one-line ()
;;      (interactive)
;;            (scroll-down 1)) 
;;

(global-set-key (kbd "C-l") 'load-current-buffer-p)

;; =================
;; VC-mode
;; =================
(global-set-key (kbd "C-x v =") 'ediff-current-buffer-revision) ;; my-utils.el

;; =================
;; multi-term
;; =================
(global-set-key (kbd "C-c t") 'multi-term)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-c y") 'term-paste)

