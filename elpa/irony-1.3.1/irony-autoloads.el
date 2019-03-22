;;; irony-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "irony" "irony.el" (0 0 0 0))
;;; Generated autoloads from irony.el

(defvar irony-additional-clang-options nil "\
Additional command line options to pass down to libclang.\n\nPlease, do NOT use this variable to add header search paths, only\nadditional warnings or compiler options.\n\nThese compiler options will be prepended to the command line, in\norder to not override the value coming from a compilation\ndatabase.")

(custom-autoload 'irony-additional-clang-options "irony" t)

(autoload 'irony-mode "irony" "\
Minor mode for C, C++ and Objective-C, powered by libclang.\n\n(fn &optional ARG)" t nil)

(autoload 'irony-version "irony" "\
Return the version number of the file irony.el.\n\nIf called interactively display the version in the echo area.\n\n(fn &optional SHOW-VERSION)" t nil)

(autoload 'irony-server-kill "irony" "\
Kill the running irony-server process, if any.\n\n(fn)" t nil)

(autoload 'irony-get-type "irony" "\
Get the type of symbol under cursor.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "irony" '("irony-")))

;;;***

;;;### (autoloads nil "irony-cdb" "irony-cdb.el" (0 0 0 0))
;;; Generated autoloads from irony-cdb.el

(autoload 'irony-cdb-autosetup-compile-options "irony-cdb" "\
\n\n(fn)" t nil)

(autoload 'irony-cdb-menu "irony-cdb" "\
\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "irony-cdb" '("irony-cdb-")))

;;;***

;;;### (autoloads nil "irony-cdb-clang-complete" "irony-cdb-clang-complete.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from irony-cdb-clang-complete.el

(autoload 'irony-cdb-clang-complete "irony-cdb-clang-complete" "\
\n\n(fn COMMAND &rest ARGS)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "irony-cdb-clang-complete" '("irony-cdb-clang-complete--")))

;;;***

;;;### (autoloads nil "irony-cdb-json" "irony-cdb-json.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from irony-cdb-json.el

(autoload 'irony-cdb-json "irony-cdb-json" "\
\n\n(fn COMMAND &rest ARGS)" nil nil)

(autoload 'irony-cdb-json-add-compile-commands-path "irony-cdb-json" "\
Add an out-of-source compilation database.\n\nFiles below the PROJECT-ROOT directory will use the JSON\nCompilation Database as specified by COMPILE-COMMANDS-PATH.\n\nThe JSON Compilation Database are often generated in the build\ndirectory. This functions helps mapping out-of-source build\ndirectories to project directory.\n\n(fn PROJECT-ROOT COMPILE-COMMANDS-PATH)" t nil)

(autoload 'irony-cdb-json-select "irony-cdb-json" "\
Select CDB to use with a prompt.\n\nIt is useful when you have several CDBs with the same project\nroot.\n\nThe completion function used internally is `completing-read' so\nit could easily be used with other completion functions by\ntemporarily using a let-bind on `completing-read-function'. Or\neven helm by enabling `helm-mode' before calling the function.\n\n(fn)" t nil)

(autoload 'irony-cdb-json-select-most-recent "irony-cdb-json" "\
Select CDB that is most recently modified.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "irony-cdb-json" '("irony-cdb-json--")))

;;;***

;;;### (autoloads nil "irony-cdb-libclang" "irony-cdb-libclang.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from irony-cdb-libclang.el

(autoload 'irony-cdb-libclang "irony-cdb-libclang" "\
\n\n(fn COMMAND &rest ARGS)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "irony-cdb-libclang" '("irony-cdb-libclang--")))

;;;***

;;;### (autoloads nil "irony-completion" "irony-completion.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from irony-completion.el

(autoload 'irony-completion-at-point "irony-completion" "\
\n\n(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "irony-completion" '("irony-")))

;;;***

;;;### (autoloads nil "irony-diagnostics" "irony-diagnostics.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from irony-diagnostics.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "irony-diagnostics" '("irony-diagnostics-")))

;;;***

;;;### (autoloads nil "irony-iotask" "irony-iotask.el" (0 0 0 0))
;;; Generated autoloads from irony-iotask.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "irony-iotask" '("irony-iotask-")))

;;;***

;;;### (autoloads nil "irony-snippet" "irony-snippet.el" (0 0 0 0))
;;; Generated autoloads from irony-snippet.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "irony-snippet" '("irony-snippet-")))

;;;***

;;;### (autoloads nil nil ("irony-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; irony-autoloads.el ends here