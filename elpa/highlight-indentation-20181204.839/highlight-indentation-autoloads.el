;;; highlight-indentation-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "highlight-indentation" "highlight-indentation.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from highlight-indentation.el

(autoload 'highlight-indentation-mode "highlight-indentation" "\
Highlight indentation minor mode highlights indentation based on spaces\n\n(fn &optional ARG)" t nil)

(autoload 'highlight-indentation-set-offset "highlight-indentation" "\
Set indentation offset localy in buffer, will prevent\nhighlight-indentation from trying to guess indentation offset\nfrom major mode\n\n(fn OFFSET)" t nil)

(autoload 'highlight-indentation-current-column-mode "highlight-indentation" "\
Hilight Indentation minor mode displays a vertical bar\ncorresponding to the indentation of the current line\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "highlight-indentation" '("highlight-indentation-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; highlight-indentation-autoloads.el ends here
