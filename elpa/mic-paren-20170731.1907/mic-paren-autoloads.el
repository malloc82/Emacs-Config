;;; mic-paren-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "mic-paren" "mic-paren.el" (0 0 0 0))
;;; Generated autoloads from mic-paren.el

(autoload 'paren-activate "mic-paren" "\
Activate mic-paren parenthesis highlighting.\nNote: This also deactivates the paren.el\nand stig-paren.el packages if they are active!\n\nThe following options are available via the customize-feature:\n  `paren-priority'\n  `paren-overlay-priority'\n  `paren-sexp-mode'\n  `paren-highlight-at-point'\n  `paren-highlight-offscreen'\n  `paren-display-message'\n  `paren-message-linefeed-display'\n  `paren-message-no-match'\n  `paren-message-show-linenumber'\n  `paren-message-truncate-lines'\n  `paren-ding-unmatched'\n  `paren-delay'\n  `paren-dont-touch-blink'\n  `paren-match-face'\n  `paren-mismatch-face'\n  `paren-no-match-face'\n  `paren-bind-modified-sexp-functions'\n\nThe following options are settable via toggling functions (look at the\ndocumentation of these options for the names of these functions):\n  `paren-match-quoted-paren'\n  `paren-match-paired-delimiter'\n  `paren-open-paren-context-backward'\n\n(fn)" t nil)

(autoload 'paren-deactivate "mic-paren" "\
Deactivate mic-paren parenthesis highlighting.\n\n(fn)" t nil)

(autoload 'paren-toggle-matching-paired-delimiter "mic-paren" "\
Toggle matching paired delimiter.\nForce on with positive ARG.  Use this in mode hooks to activate or\ndeactivate paired delimiter matching.  If optional second argument\nNO-MESSAGE is non-nil then don't display a message about the\ncurrent activation state of the paired-delimiter-matching feature.\n\n(fn ARG &optional NO-MESSAGE)" t nil)

(autoload 'paren-toggle-matching-quoted-paren "mic-paren" "\
Toggle matching quoted parens.\nForce on with positive ARG.  Use this in mode hooks to activate or\ndeactivate quoted paren matching.  If optional second argument\nNO-MESSAGE is non-nil then don't display a message about the\ncurrent activation state of the quoted-paren-matching feature.\n\n(fn ARG &optional NO-MESSAGE)" t nil)

(autoload 'paren-toggle-open-paren-context "mic-paren" "\
Toggle whether or not to determine context of the matching open-paren.\nForce backward context with positive ARG.  Use this in mode-hooks.\nSee `paren-open-paren-context-backward'.\n\n(fn ARG)" t nil)

(autoload 'paren-forward-sexp "mic-paren" "\
Act like `forward-sexp' but also handle quoted parens.\nSee `paren-match-quoted-paren'.\n\n(fn &optional ARG)" t nil)

(autoload 'paren-backward-sexp "mic-paren" "\
Act like `backward-sexp' but also match quoted parens.\nSee `paren-match-quoted-paren'.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mic-paren" '("mic-paren-" "paren-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; mic-paren-autoloads.el ends here
