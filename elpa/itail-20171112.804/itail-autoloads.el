;;; itail-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "itail" "itail.el" (0 0 0 0))
;;; Generated autoloads from itail.el

(autoload 'itail "itail" "\
Tail file FILE in itail mode.  Supports remote tailing through tramp 

\(fn FILE &optional LINES)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "itail" '("itail-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; itail-autoloads.el ends here
