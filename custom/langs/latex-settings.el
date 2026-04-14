;; -*- lexical-binding: t -*-

;; ============================
;; AUCTeX Settings
;; ============================

;; Ensure AUCTeX configuration is applied only after it's loaded
(with-eval-after-load 'tex

  ;; Basic AUCTeX settings
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq LaTeX-math-mode t)
  (setq LaTeX-command "latex -file-line-error")
  (setq LaTeX-math-menu-unicode t)

  ;; Setup Viewer (macOS / Linux)
  (cond ((string= system-type "darwin")
         (add-to-list 'TeX-view-program-list
                      '("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))
         (add-to-list 'TeX-view-program-selection '(output-pdf "Skim")))
        (t
         (add-to-list 'TeX-view-program-list '("kdvi" "kdvi %o"))
         (add-to-list 'TeX-view-program-selection '(output-dvi "kdvi"))
         (add-to-list 'TeX-view-program-selection '(output-pdf "Evince"))))

  ;; Add Latexmk as a command
  (add-to-list 'TeX-command-list
               '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t        :help "Run latexmk on file"))
  (add-to-list 'TeX-command-list
               '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t  :help "Run XeLaTeX for Chinese language tex files"))
  (add-to-list 'TeX-command-list
               '("latexmk-xe" "latexmk -xelatex %s" TeX-run-TeX nil t :help "Run latexmk with XeLaTeX engine"))
  (setq TeX-command-default "latexmk"))

;; Apply minor modes specifically when entering LaTeX mode
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (yas-minor-mode 1)
            (smartparens-mode 1)
            (electric-pair-local-mode -1)
            (outline-minor-mode 1)
            (turn-on-reftex)
            (setq-local show-trailing-whitespace t)

            ;; RefTeX needs to know about AUCTeX
            (setq reftex-plug-into-AUCTeX t)))

;; Note on Environments:
;; Instead of the `insert-latex-block` macro, use AUCTeX's built-in feature:
;; Press `C-c C-e` (LaTeX-environment) inside a .tex file.
;; It will prompt you for an environment (e.g., "equation", "matrix")
;; and insert both the \begin and \end tags perfectly formatted.
