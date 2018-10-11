;;; anaconda-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "anaconda-mode" "anaconda-mode.el" (0 0 0 0))
;;; Generated autoloads from anaconda-mode.el

(autoload 'anaconda-mode "anaconda-mode" "\
Code navigation, documentation lookup and completion for Python.\n\n\\{anaconda-mode-map}\n\n(fn &optional ARG)" t nil)

(autoload 'anaconda-eldoc-mode "anaconda-mode" "\
Toggle echo area display of Python objects at point.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "anaconda-mode" '("turn-o" "anaconda-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; anaconda-mode-autoloads.el ends here
