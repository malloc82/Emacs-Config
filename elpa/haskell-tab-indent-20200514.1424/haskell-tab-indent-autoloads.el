;;; haskell-tab-indent-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "haskell-tab-indent" "haskell-tab-indent.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from haskell-tab-indent.el

(autoload 'haskell-tab-indent-mode "haskell-tab-indent" "\
Haskell indentation mode for projects requiring that only tabs
-- with no spaces -- be used for indentation.

This is a minor mode.  If called interactively, toggle the
`Haskell-Tab-Indent mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `haskell-tab-indent-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

Binds the TAB key to cycle between possible indents.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; haskell-tab-indent-autoloads.el ends here
