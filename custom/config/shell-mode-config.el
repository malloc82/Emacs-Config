(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook
          #'(lambda ()
              (ansi-color-for-comint-mode-on)
              (electric-pair-mode)
              (show-trailing-whitespace nil)
              (auto-complete-mode -1)))
