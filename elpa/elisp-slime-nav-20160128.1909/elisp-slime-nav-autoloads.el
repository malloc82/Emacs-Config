;;; elisp-slime-nav-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "elisp-slime-nav" "elisp-slime-nav.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from elisp-slime-nav.el

(autoload 'elisp-slime-nav-mode "elisp-slime-nav" "\
Enable Slime-style navigation of elisp symbols using M-. and M-,\n\n(fn &optional ARG)" t nil)

(autoload 'turn-on-elisp-slime-nav-mode "elisp-slime-nav" "\
Explicitly enable `elisp-slime-nav-mode'.\n\n(fn)" nil nil)

(autoload 'elisp-slime-nav-find-elisp-thing-at-point "elisp-slime-nav" "\
Find the elisp thing at point, be it a function, variable, library or face.\n\nWith a prefix arg, or if there is no thing at point, prompt for\nthe symbol to jump to.\n\nArgument SYM-NAME is the thing to find.\n\n(fn SYM-NAME)" t nil)

(autoload 'elisp-slime-nav-describe-elisp-thing-at-point "elisp-slime-nav" "\
Display the full documentation of the elisp thing at point.\n\nThe named subject may be a function, variable, library or face.\n\nWith a prefix arg, or if there is not \"thing\" at point, prompt\nfor the symbol to jump to.\n\nArgument SYM-NAME is the thing to find.\n\n(fn SYM-NAME)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elisp-slime-nav" '("elisp-slime-nav-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; elisp-slime-nav-autoloads.el ends here
