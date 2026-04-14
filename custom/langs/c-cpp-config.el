
(require 'eglot)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-or-c++-mode-hook 'eglot-ensure)
(add-hook 'c-mode-common-hook 'eglot-ensure)

(use-package highlight-symbol
  :ensure t
  :config
  (setq highlight-symbol-on-navigation-p t)
  (add-hook 'prog-mode-hook 'highlight-symbol-mode))

(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))

(add-hook 'c++-mode-hook
          (lambda ()
            ;; Use company-capf (LSP/Clangd) AND company-dabbrev-code (Buffer words)
            ;; The list inside a list '(X Y) means "try both and merge results"
            (setq-local company-backends
                        '((company-capf company-dabbrev-code)
                          company-dabbrev))
            (local-set-key (kbd "<tab>") 'company-indent-or-complete-common)))

(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))


(defun my/c-cpp-setup ()
  ;; see ~/.clang-format
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (c-set-offset 'defun-block-intro '+)
  (c-set-offset 'statement-block-intro '+)
  (c-set-offset 'substatement-open 0)
  )

(add-hook 'c-mode-common-hook 'my/c-cpp-setup)
(add-hook 'c-mode-common-hook 'electric-pair-local-mode)

(require 'flymake)

(defun my/flymake-toggle-diagnostics-buffer ()
  (interactive)
  ;; Check if we are in the diagnostics buffer.
  (if (string-search "*Flymake diagnostics" (buffer-name))
      (delete-window)
    (progn
      ;; Activate the Flymake diagnostics buffer.
      ;; and switch to it
      (flymake-show-buffer-diagnostics)
      (let ((name (flymake--diagnostics-buffer-name)))
        (if (get-buffer name)
            (switch-to-buffer-other-window name)
          (error "No Flymake diagnostics buffer found")
          )))))

(global-set-key [(f8)] #'my/flymake-toggle-diagnostics-buffer)

(global-set-key (kbd "C-c f b") #'flymake-show-buffer-diagnostics)
(global-set-key (kbd "C-c f p") #'flymake-show-project-diagnostics)

;; (add-hook 'c-mode-common-hook (electric-indent-local-mode -1))
;; (keymap-set c-mode-map "<Return>" 'electric-newline-and-maybe-indent)
;; (keymap-set c++-mode-map "<Return>" 'electric-newline-and-maybe-indent)

