;; ============================
;; Key mappings
;; ============================

(global-set-key [(M-down)]   'scroll-up)        ; C-.
(global-set-key [(M-up)]     'scroll-down)      ; C-;

(line-number-mode 'default )

(define-key global-map '[f3] 'uncomment-region)
(define-key global-map '[f4] 'comment-region)

;; goto line
;; default: M-g g
(define-key global-map [?\C-l]  'goto-line)

(define-key global-map [?\M-\`] 'other-frame)
(define-key global-map [?\M-\\] 'other-window)
(global-set-key        [?\M-\]] 'previous-buffer)
(global-set-key        [?\M-\[] 'next-buffer)


;; shrink window vertically
(define-key global-map [?\C-x ?&] 'shrink-window)

;; (define-key global-map '[f7] 'compile)
;; set up the compiling options
(setq compile-command "make"
      compilation-ask-about-save nil
      compilation-window-height 10)

(global-set-key [f7] 'compile)

(define-key global-map '[f8]   'first-error)
(define-key global-map '[f9]   'next-error)
(define-key global-map '[C-f9] 'previous-error)
;;(define-key global-map '[f12] 'bury-buffer)

(global-set-key (kbd "C-c b")   'beginning-of-buffer)
(global-set-key (kbd "C-c e")   'end-of-buffer)

(if window-system
    (progn
      (require 'redo) 
      (global-set-key (kbd "C-'")     'redo)
      (global-set-key [ (control \')] 'redo)
      (global-set-key [ (control /)]  'undo)))


(global-set-key [C-tab]         'hide-subtree)
(global-set-key (kbd "C-c s")   'show-subtree)

;; multi-term
(global-set-key (kbd "C-c t") 'multi-term)

;; hi-lock-mode
;; C-x w l


;;(defun scroll-up-one-line ()
;;      (interactive)
;;            (scroll-up 1))

;;(defun scroll-down-one-line ()
;;      (interactive)
;;            (scroll-down 1)) 
;;
