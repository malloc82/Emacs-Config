;;; elixir-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "elixir-format" "elixir-format.el" (0 0 0 0))
;;; Generated autoloads from elixir-format.el

(autoload 'elixir-format "elixir-format" "\
\n\n(fn &optional CALLED-INTERACTIVELY-P)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elixir-format" '("elixir-format-")))

;;;***

;;;### (autoloads nil "elixir-mode" "elixir-mode.el" (0 0 0 0))
;;; Generated autoloads from elixir-mode.el

(autoload 'elixir-mode-open-github "elixir-mode" "\
Elixir mode open GitHub page.\n\n(fn)" t nil)

(autoload 'elixir-mode-open-elixir-home "elixir-mode" "\
Elixir mode go to language home.\n\n(fn)" t nil)

(autoload 'elixir-mode-open-docs-master "elixir-mode" "\
Elixir mode go to master documentation.\n\n(fn)" t nil)

(autoload 'elixir-mode-open-docs-stable "elixir-mode" "\
Elixir mode go to stable documentation.\n\n(fn)" t nil)

(autoload 'elixir-mode-version "elixir-mode" "\
Get the Elixir-Mode version as string.\n\nIf called interactively or if SHOW-VERSION is non-nil, show the\nversion in the echo area and the messages buffer.\n\nThe returned string includes both, the version from package.el\nand the library version, if both a present and different.\n\nIf the version number could not be determined, signal an error,\nif called interactively, or if SHOW-VERSION is non-nil, otherwise\njust return nil.\n\n(fn &optional SHOW-VERSION)" t nil)

(autoload 'elixir-mode "elixir-mode" "\
Major mode for editing Elixir code.\n\n\\{elixir-mode-map}\n\n(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.elixir\\'" . elixir-mode))

(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-mode))

(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elixir-mode" '("elixir-")))

;;;***

;;;### (autoloads nil "elixir-smie" "elixir-smie.el" (0 0 0 0))
;;; Generated autoloads from elixir-smie.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elixir-smie" '("elixir-" "verbose-elixir-smie-rules")))

;;;***

;;;### (autoloads nil nil ("elixir-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; elixir-mode-autoloads.el ends here
