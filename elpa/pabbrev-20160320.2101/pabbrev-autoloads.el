;;; pabbrev-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pabbrev" "pabbrev.el" (0 0 0 0))
;;; Generated autoloads from pabbrev.el

(autoload 'pabbrev-mode "pabbrev" "\
Toggle pabbrev mode.\nWith arg, turn on Predicative Abbreviation mode if and only if arg is\npositive.\n\nThis mode is another abbreviation expansion mode somewhat like\n`dabbrev-expand', in that it looks through the current buffer for\nsymbols that can complete the current symbol. Unlike `dabbrev-expand',\nit does this by discovering the words during the Emacs idle time, and\nplaces the results into data structures which enable very rapid\nextraction of expansions. The upshot of this is that it can offer\nsuggestions as you type, without causing an unacceptable slow down.\n\nThere is an associated `global-pabbrev-mode' which turns on the mode\non in all buffers.\n\n(fn &optional ARG)" t nil)

(defvar global-pabbrev-mode nil "\
Non-nil if Global Pabbrev mode is enabled.\nSee the `global-pabbrev-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `global-pabbrev-mode'.")

(custom-autoload 'global-pabbrev-mode "pabbrev" nil)

(autoload 'global-pabbrev-mode "pabbrev" "\
Toggle Pabbrev mode in all buffers.\nWith prefix ARG, enable Global Pabbrev mode if ARG is positive;\notherwise, disable it.  If called from Lisp, enable the mode if\nARG is omitted or nil.\n\nPabbrev mode is enabled in all buffers where\n`pabbrev-global-mode' would do it.\nSee `pabbrev-mode' for more information on Pabbrev mode.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pabbrev" '("pabbrev-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pabbrev-autoloads.el ends here
