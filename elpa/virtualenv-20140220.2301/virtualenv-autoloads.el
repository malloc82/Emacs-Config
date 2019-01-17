;;; virtualenv-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "virtualenv" "virtualenv.el" (0 0 0 0))
;;; Generated autoloads from virtualenv.el

(autoload 'virtualenv-workon "virtualenv" "\
Activate a virtual environment for python.\nOptional argument ENV if non-nil, either use the string given as\nthe virtual environment or if not a string then query the user.\n\n(fn &optional ENV)" t nil)

(autoload 'virtualenv-deactivate "virtualenv" "\
\n\n(fn)" t nil)

(autoload 'virtualenv-minor-mode "virtualenv" "\
Toggle Virtualenv minor mode on or off.\nWith a prefix argument ARG, enable Virtualenv minor mode if ARG is\npositive, and disable it otherwise.  If called from Lisp, enable\nthe mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.\n\\{virtualenv-minor-mode-map}\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "virtualenv" '("virtualenv-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; virtualenv-autoloads.el ends here
