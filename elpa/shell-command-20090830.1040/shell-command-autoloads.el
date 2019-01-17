;;; shell-command-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "shell-command" "shell-command.el" (0 0 0 0))
;;; Generated autoloads from shell-command.el

(autoload 'shell-command-completion-mode "shell-command" "\
Enable or disable tab-completion for some commands.\nThe commands are `shell-command', `shell-command-on-region', `grep',\n`grep-find' and `compile'.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "shell-command" '("shell-command" "compile-prompt" "grep-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; shell-command-autoloads.el ends here
