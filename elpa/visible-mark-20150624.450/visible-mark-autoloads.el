;;; visible-mark-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "visible-mark" "visible-mark.el" (0 0 0 0))
;;; Generated autoloads from visible-mark.el

(autoload 'visible-mark-mode "visible-mark" "\
A mode to make the mark visible.\n\n(fn &optional ARG)" t nil)

(defvar global-visible-mark-mode nil "\
Non-nil if Global Visible-Mark mode is enabled.\nSee the `global-visible-mark-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `global-visible-mark-mode'.")

(custom-autoload 'global-visible-mark-mode "visible-mark" nil)

(autoload 'global-visible-mark-mode "visible-mark" "\
Toggle Visible-Mark mode in all buffers.\nWith prefix ARG, enable Global Visible-Mark mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nVisible-Mark mode is enabled in all buffers where\n`visible-mark-mode-maybe' would do it.\nSee `visible-mark-mode' for more information on Visible-Mark mode.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "visible-mark" '("visible-mark-" "global-visible-mark-mode-exclude-alist")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; visible-mark-autoloads.el ends here
