;;; haskell-tab-indent-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "haskell-tab-indent" "haskell-tab-indent.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-tab-indent.el

(autoload 'haskell-tab-indent-mode "haskell-tab-indent" "\
Haskell indentation mode for projects requiring that only tabs\n-- with no spaces -- be used for indentation.\n\nBinds the TAB key to cycle between possible indents.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "haskell-tab-indent" '("haskell-tab-indent")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; haskell-tab-indent-autoloads.el ends here
