;;; sesman-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "sesman" "sesman.el" (0 0 0 0))
;;; Generated autoloads from sesman.el

(autoload 'sesman-start "sesman" "\
Start a Sesman session.\n\n(fn)" t nil)

(autoload 'sesman-restart "sesman" "\
Restart sesman session.\nWhen WHICH is nil, restart the current session; when a single universal\nargument or 'linked, restart all linked sessions; when a double universal\nargument, t or 'all, restart all sessions. For programmatic use, WHICH can also\nbe a session or a name of the session, in which case that session is restarted.\n\n(fn &optional WHICH)" t nil)

(autoload 'sesman-quit "sesman" "\
Terminate a Sesman session.\nWhen WHICH is nil, kill only the current session; when a single universal\nargument or 'linked, kill all linked sessions; when a double universal argument,\nt or 'all, kill all sessions. For programmatic use, WHICH can also be a session\nor a name of the session, in which case that session is killed.\n\n(fn &optional WHICH)" t nil)

(autoload 'sesman-info "sesman" "\
Display info for all current sessions (`sesman-current-sessions').\nIn the resulting minibuffer display linked sessions are numbered and the\nother (friendly) sessions are not. When ALL is non-nil, show info for all\nsessions.\n\n(fn &optional ALL)" t nil)

(autoload 'sesman-link-with-buffer "sesman" "\
Ask for SESSION and link with BUFFER.\nBUFFER defaults to current buffer. On universal argument, or if BUFFER is 'ask,\nask for buffer.\n\n(fn &optional BUFFER SESSION)" t nil)

(autoload 'sesman-link-with-directory "sesman" "\
Ask for SESSION and link with DIR.\nDIR defaults to `default-directory'. On universal argument, or if DIR is 'ask,\nask for directory.\n\n(fn &optional DIR SESSION)" t nil)

(autoload 'sesman-link-with-project "sesman" "\
Ask for SESSION and link with PROJECT.\nPROJECT defaults to current project. On universal argument, or if PROJECT is\n'ask, ask for the project. SESSION defaults to the current session.\n\n(fn &optional PROJECT SESSION)" t nil)

(autoload 'sesman-link-with-least-specific "sesman" "\
Ask for SESSION and link with the least specific context available.\nNormally the least specific context is the project. If not in a project, link\nwith the `default-directory'. If `default-directory' is nil, link with current\nbuffer.\n\n(fn &optional SESSION)" t nil)

(autoload 'sesman-unlink "sesman" "\
Break any of the previously created links.\n\n(fn)" t nil)
 (autoload 'sesman-map "sesman" "Session management prefix keymap." t 'keymap)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sesman" '("sesman-")))

;;;***

;;;### (autoloads nil "sesman-browser" "sesman-browser.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from sesman-browser.el

(autoload 'sesman-browser "sesman-browser" "\
Display an interactive session browser.\nSee `sesman-browser-mode' for more details.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sesman-browser" '("sesman-")))

;;;***

;;;### (autoloads nil nil ("sesman-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; sesman-autoloads.el ends here
