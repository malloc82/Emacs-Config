;;; flymake-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "flymake" "flymake.el" (0 0 0 0))
;;; Generated autoloads from flymake.el

(autoload 'flymake-log "flymake" "\
Log, at level LEVEL, the message MSG formatted with ARGS.\nLEVEL is passed to `display-warning', which is used to display\nthe warning.  If this form is included in a byte-compiled file,\nthe generated warning contains an indication of the file that\ngenerated it.\n\n(fn LEVEL MSG &rest ARGS)" nil t)

(autoload 'flymake-make-diagnostic "flymake" "\
Make a Flymake diagnostic for BUFFER's region from BEG to END.\nTYPE is a key to symbol and TEXT is a description of the problem\ndetected in this region.  DATA is any object that the caller\nwishes to attach to the created diagnostic for later retrieval.\n\nOVERLAY-PROPERTIES is an an alist of properties attached to the\ncreated diagnostic, overriding the default properties and any\nproperties of `flymake-overlay-control' of the diagnostic's\ntype.\n\n(fn BUFFER BEG END TYPE TEXT &optional DATA OVERLAY-PROPERTIES)" nil nil)

(autoload 'flymake-diagnostics "flymake" "\
Get Flymake diagnostics in region determined by BEG and END.\n\nIf neither BEG or END is supplied, use the whole buffer,\notherwise if BEG is non-nil and END is nil, consider only\ndiagnostics at BEG.\n\n(fn &optional BEG END)" nil nil)

(autoload 'flymake-diag-region "flymake" "\
Compute BUFFER's region (BEG . END) corresponding to LINE and COL.\nIf COL is nil, return a region just for LINE.  Return nil if the\nregion is invalid.\n\n(fn BUFFER LINE &optional COL)" nil nil)

(autoload 'flymake-mode "flymake" "\
Toggle Flymake mode on or off.\n\nFlymake is an Emacs minor mode for on-the-fly syntax checking.\nFlymake collects diagnostic information from multiple sources,\ncalled backends, and visually annotates the buffer with the\nresults.\n\nFlymake performs these checks while the user is editing.  The\ncustomization variables `flymake-start-on-flymake-mode',\n`flymake-no-changes-timeout' and\n`flymake-start-syntax-check-on-newline' determine the exact\ncircumstances whereupon Flymake decides to initiate a check of\nthe buffer.\n\nThe commands `flymake-goto-next-error' and\n`flymake-goto-prev-error' can be used to navigate among Flymake\ndiagnostics annotated in the buffer.\n\nThe visual appearance of each type of diagnostic can be changed\nby setting properties `flymake-overlay-control', `flymake-bitmap'\nand `flymake-severity' on the symbols of diagnostic types (like\n`:error', `:warning' and `:note').\n\nActivation or deactivation of backends used by Flymake in each\nbuffer happens via the special hook\n`flymake-diagnostic-functions'.\n\nSome backends may take longer than others to respond or complete,\nand some may decide to disable themselves if they are not\nsuitable for the current buffer. The commands\n`flymake-running-backends', `flymake-disabled-backends' and\n`flymake-reporting-backends' summarize the situation, as does the\nspecial *Flymake log* buffer.\n\n(fn &optional ARG)" t nil)

(autoload 'flymake-mode-on "flymake" "\
Turn Flymake mode on.\n\n(fn)" nil nil)

(autoload 'flymake-mode-off "flymake" "\
Turn Flymake mode off.\n\n(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flymake" '("flymake-")))

;;;***

;;;### (autoloads nil nil ("flymake-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flymake-autoloads.el ends here
