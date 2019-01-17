;;; matlab-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "cedet-matlab" "cedet-matlab.el" (0 0 0 0))
;;; Generated autoloads from cedet-matlab.el

(autoload 'matlab-cedet-setup "cedet-matlab" "\
Update various paths to get SRecode to identify our macros.\n\n(fn)" t nil)

;;;***

;;;### (autoloads nil "company-matlab-shell" "company-matlab-shell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-matlab-shell.el

(autoload 'company-matlab-shell "company-matlab-shell" "\
A `company-mode' completion backend for `matlab-shell'.\n\n(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "company-matlab-shell" '("company-matlab-shell-")))

;;;***

;;;### (autoloads nil "linemark" "linemark.el" (0 0 0 0))
;;; Generated autoloads from linemark.el

(autoload 'enable-visual-studio-bookmarks "linemark" "\
Bind the viss bookmark functions to F2 related keys.\n\\<global-map>\n\\[viss-bookmark-toggle]     - To=ggle a bookmark on this line.\n\\[viss-bookmark-next-buffer]   - Move to the next bookmark.\n\\[viss-bookmark-prev-buffer]   - Move to the previous bookmark.\n\\[viss-bookmark-clear-all-buffer] - Clear all bookmarks.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "linemark" '("viss-bookmark-" "linemark-")))

;;;***

;;;### (autoloads nil "matlab" "matlab.el" (0 0 0 0))
;;; Generated autoloads from matlab.el

(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))

(autoload 'matlab-mode "matlab" "\
MATLAB(R) mode is a major mode for editing MATLAB dot-m files.\n\\<matlab-mode-map>\nConvenient editing commands are:\n \\[matlab-comment-region]   - Comment/Uncomment out a region of code.\n \\[matlab-fill-comment-line] - Fill the current comment line.\n \\[matlab-fill-region] - Fill code and comments in region.\n \\[matlab-fill-paragraph]     - Refill the current command or comment.\n \\[matlab-complete-symbol]   - Symbol completion of matlab symbolsbased on the local syntax.\n \\[matlab-indent-sexp] - Indent syntactic block of code.\n\nConvenient navigation commands are:\n \\[matlab-beginning-of-command]   - Move to the beginning of a command.\n \\[matlab-end-of-command]   - Move to the end of a command.\n \\[matlab-beginning-of-defun] - Move to the beginning of a function.\n \\[matlab-end-of-defun] - Move do the end of a function.\n \\[matlab-forward-sexp] - Move forward over a syntactic block of code.\n \\[matlab-backward-sexp] - Move backwards over a syntactic block of code.\n\nConvenient template insertion commands:\n \\[tempo-template-matlab-function] - Insert a function definition.\n \\[tempo-template-matlab-if] - Insert an IF END block.\n \\[tempo-template-matlab-for] - Insert a FOR END block.\n \\[tempo-template-matlab-switch] - Insert a SWITCH END statement.\n \\[matlab-insert-next-case] - Insert the next CASE condition in a SWITCH.\n \\[matlab-insert-end-block] - Insert a matched END statement.  With optional ARG, reindent.\n \\[matlab-stringify-region] - Convert plain text in region to a string with correctly quoted chars.\n\nVariables:\n  `matlab-indent-level'		Level to indent blocks.\n  `matlab-cont-level'		Level to indent continuation lines.\n  `matlab-cont-requires-ellipsis' Does your MATLAB support implied elipsis.\n  `matlab-case-level'		Level to unindent case statements.\n  `matlab-indent-past-arg1-functions'\n                                Regexp of functions to indent past the first\n                                  argument on continuation lines.\n  `matlab-maximum-indents'      List of maximum indents during lineups.\n  `matlab-comment-column'       Goal column for on-line comments.\n  `fill-column'			Column used in auto-fill.\n  `matlab-indent-function-body' If non-nil, indents body of MATLAB functions.\n  `matlab-functions-have-end'	If non-nil, MATLAB functions terminate with end.\n  `matlab-return-function'	Customize RET handling with this function.\n  `matlab-auto-fill'            Non-nil, do auto-fill at startup.\n  `matlab-fill-code'            Non-nil, auto-fill code.\n  `matlab-fill-strings'         Non-nil, auto-fill strings.\n  `matlab-verify-on-save-flag'  Non-nil, enable code checks on save.\n  `matlab-highlight-block-match-flag'\n                                Enable matching block begin/end keywords.\n  `matlab-vers-on-startup'	If t, show version on start-up.\n  `matlab-handle-simulink'      If t, enable simulink keyword highlighting.\n\nAll Key Bindings:\n\\{matlab-mode-map}\n\n(fn)" t nil)

(autoload 'matlab-shell "matlab" "\
Create a buffer with MATLAB running as a subprocess.\n\nMATLAB shell cannot work on the MS Windows platform because MATLAB is not\na console application.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matlab" '("matlab-" "gud-matlab-")))

;;;***

;;;### (autoloads nil "matlab-publish" "matlab-publish.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from matlab-publish.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matlab-publish" '("matlab-")))

;;;***

;;;### (autoloads nil "mlint" "mlint.el" (0 0 0 0))
;;; Generated autoloads from mlint.el

(autoload 'mlint-minor-mode "mlint" "\
Toggle mlint minor mode, a mode for showing mlint errors.\nWith prefix ARG, turn mlint minor mode on iff ARG is positive.\n\\{mlint-minor-mode-map\\}\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mlint" '("mlint-" "initialize-instance" "linemark-")))

;;;***

;;;### (autoloads nil "semantic-matlab" "semantic-matlab.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from semantic-matlab.el

(autoload 'semantic-default-matlab-setup "semantic-matlab" "\
Set up a buffer for parsing of MATLAB files.\n\n(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "semantic-matlab" '("semantic-" "matlab-mode")))

;;;***

;;;### (autoloads nil "semanticdb-matlab" "semanticdb-matlab.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from semanticdb-matlab.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "semanticdb-matlab" '("semantic" "matlab-mode")))

;;;***

;;;### (autoloads nil "srecode-matlab" "srecode-matlab.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from srecode-matlab.el

(autoload 'srecode-semantic-handle-:matlab "srecode-matlab" "\
Add macros into the dictionary DICT based on the current MATLAB buffer.\nAdds the following:\nFILE_SYMBOL - The file name as a symbol.\nFILE_DOC_SYMBOL - The file name as a symbol for doc strings.\nPACKAGE - The package this file is in, or empty if none.\nFILE_CLASS - Show section if filename should be a class.\nFILE_FUNCTION - Show setion if filename is a function.\n\nOn class prediction - when filling in an empty file, if the filename and directory it is in\nmatch, for example @foo/foo.m then foo should be a classdef.\n\n(fn DICT)" nil nil)

;;;***

;;;### (autoloads nil "tlc" "tlc.el" (0 0 0 0))
;;; Generated autoloads from tlc.el

(autoload 'tlc-mode "tlc" "\
Major mode for editing Tlc files, or files found in tlc directories.\n\n(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.tlc$" . tlc-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tlc" '("tlc-")))

;;;***

;;;### (autoloads nil nil ("matlab-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; matlab-mode-autoloads.el ends here
