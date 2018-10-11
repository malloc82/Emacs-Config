;;; pyvenv-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pyvenv" "pyvenv.el" (0 0 0 0))
;;; Generated autoloads from pyvenv.el

(autoload 'pyvenv-activate "pyvenv" "\
Activate the virtual environment in DIRECTORY.\n\n(fn DIRECTORY)" t nil)

(autoload 'pyvenv-deactivate "pyvenv" "\
Deactivate any current virtual environment.\n\n(fn)" t nil)

(autoload 'pyvenv-workon "pyvenv" "\
Activate a virtual environment from $WORKON_HOME.\n\n(fn NAME)" t nil)

(defvar pyvenv-mode nil "\
Non-nil if Pyvenv mode is enabled.\nSee the `pyvenv-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `pyvenv-mode'.")

(custom-autoload 'pyvenv-mode "pyvenv" nil)

(autoload 'pyvenv-mode "pyvenv" "\
Global minor mode for pyvenv.\n\nWill show the current virtualenv in the mode line, and respect a\n`pyvenv-workon' setting in files.\n\n(fn &optional ARG)" t nil)

(defvar pyvenv-tracking-mode nil "\
Non-nil if Pyvenv-Tracking mode is enabled.\nSee the `pyvenv-tracking-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `pyvenv-tracking-mode'.")

(custom-autoload 'pyvenv-tracking-mode "pyvenv" nil)

(autoload 'pyvenv-tracking-mode "pyvenv" "\
Global minor mode to track the current virtualenv.\n\nWhen this mode is active, pyvenv will activate a buffer-specific\nvirtualenv whenever the user switches to a buffer with a\nbuffer-local `pyvenv-workon' or `pyvenv-activate' variable.\n\n(fn &optional ARG)" t nil)

(autoload 'pyvenv-restart-python "pyvenv" "\
Restart Python inferior processes.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pyvenv" '("pyvenv-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pyvenv-autoloads.el ends here
