

(setq eshell-prompt-function
      (lambda ()
        (concat (propertize (format-time-string "%Y-%m-%d %H:%M " (current-time)) 'face `(:foreground "teal"))
                ;; (file-name-nondirectory (eshell/pwd))
                (propertize (abbreviate-file-name (eshell/pwd)) 'face `(:foreground "green"))
                (propertize (if (= (user-uid) 0) "\n#" "\n$") 'face `(:foreground "purple"))
                (propertize " " 'face `(:foreground "white")))))

;; return value of eshell-prompt-function must match eshell-prompt-regexp
(setq eshell-prompt-regexp "^[^#$]*[#$] ")

;; ======================================================================================
;; Eshell Prompt: https://www.emacswiki.org/emacs/EshellPrompt

(require 'helm-eshell)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (paredit-mode)
              (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;; for shell-mode
(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)
;; ======================================================================================

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

(setq eshell-aliases-file "~/.emacs.d/eshell-alias")

(setenv "TERM" "eterm")
;; (setenv "GIT_PAGER" "less -FRSX")
;; (setenv "GIT_PAGER" "")

(defun eshell/ld-eshell () (load-file "~/.emacs.d/custom/config/eshell-config.el"))

(defun eshell/ed-eshell () (find-file "~/.emacs.d/custom/config/eshell-config.el"))

(setenv "PATH" (concat (getenv "PATH") ":/opt/local/libexec/git-core"))

(defun eshell/emacs (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      ;; If I just ran "emacs", I probably expect to be launching
      ;; Emacs, which is rather silly since I'm already in Emacs.
      ;; So just pretend to do what I ask.
      (bury-buffer)
      ;; We have to expand the file names or else naming a directory in an
      ;; argument causes later arguments to be looked for in that directory,
      ;; not the starting directory
      (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))

(defun eshell/vi (&rest args)
  "Invoke `find-file' on the file.
    \"vi +42 foo\" also goes to line 42 in the buffer."
  (while args
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
        (let* ((line (string-to-number (match-string 1 (pop args))))
               (file (pop args)))
          (find-file file)
          (goto-line line))
        (find-file (pop args)))))


(defun eshell/ssh (&rest args)
  "Secure shell"
  (let ((cmd (eshell-flatten-and-stringify
              (cons "ssh" args)))
        (display-type (framep (selected-frame))))
    (cond
     ((and
       (eq display-type 't)
       (getenv "STY"))
      (send-string-to-terminal (format "\033]83;screen %s\007" cmd)))
     ((eq display-type 'x)
      (eshell-do-eval
       (eshell-parse-command
	(format "rxvt -e %s &" cmd)))
      nil)
     (t
      (apply 'eshell-exec-visual (cons "ssh" args))))))

(defun eshell/git (&rest args)
  (apply 'eshell-exec-visual (cons "git" args)))

;; (defun eshell/hg (&rest args)
;;   (apply 'eshell-exec-visual (cons "hg" args)))

;; ======================================================================================
;; Eshell Completion: https://www.emacswiki.org/emacs/EshellCompletion

;; ======================================================================================
