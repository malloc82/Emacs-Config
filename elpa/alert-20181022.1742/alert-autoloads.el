;;; alert-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "alert" "alert.el" (0 0 0 0))
;;; Generated autoloads from alert.el

(autoload 'alert-add-rule "alert" "\
Programmatically add an alert configuration rule.\n\nNormally, users should custoimze `alert-user-configuration'.\nThis facility is for module writers and users that need to do\nthings the Lisp way.\n\nHere is a rule the author currently uses with ERC, so that the\nfringe gets colored whenever people chat on BitlBee:\n\n(alert-add-rule :status   \\='(buried visible idle)\n                :severity \\='(moderate high urgent)\n                :mode     \\='erc-mode\n                :predicate\n                #\\='(lambda (info)\n                    (string-match (concat \"\\\\`[^&].*@BitlBee\\\\\\='\")\n                                  (erc-format-target-and/or-network)))\n                :persistent\n                #\\='(lambda (info)\n                    ;; If the buffer is buried, or the user has been\n                    ;; idle for `alert-reveal-idle-time' seconds,\n                    ;; make this alert persistent.  Normally, alerts\n                    ;; become persistent after\n                    ;; `alert-persist-idle-time' seconds.\n                    (memq (plist-get info :status) \\='(buried idle)))\n                :style \\='fringe\n                :continue t)\n\n(fn &key SEVERITY STATUS MODE CATEGORY TITLE MESSAGE PREDICATE ICON (STYLE alert-default-style) PERSISTENT CONTINUE NEVER-PERSIST APPEND)" nil nil)

(autoload 'alert "alert" "\
Alert the user that something has happened.\nMESSAGE is what the user will see.  You may also use keyword\narguments to specify additional details.  Here is a full example:\n\n(alert \"This is a message\"\n       :severity \\='high          ;; The default severity is `normal'\n       :title \"Title\"           ;; An optional title\n       :category \\='example       ;; A symbol to identify the message\n       :mode \\='text-mode         ;; Normally determined automatically\n       :buffer (current-buffer) ;; This is the default\n       :data nil                ;; Unused by alert.el itself\n       :persistent nil          ;; Force the alert to be persistent;\n                                ;; it is best not to use this\n       :never-persist nil       ;; Force this alert to never persist\n       :id \\='my-id)              ;; Used to replace previous message of\n                                ;; the same id in styles that support it\n       :style \\='fringe)          ;; Force a given style to be used;\n                                ;; this is only for debugging!\n\nIf no :title is given, the buffer-name of :buffer is used.  If\n:buffer is nil, it is the current buffer at the point of call.\n\n:data is an opaque value which modules can pass through to their\nown styles if they wish.\n\nHere are some more typical examples of usage:\n\n  ;; This is the most basic form usage\n  (alert \"This is an alert\")\n\n  ;; You can adjust the severity for more important messages\n  (alert \"This is an alert\" :severity \\='high)\n\n  ;; Or decrease it for purely informative ones\n  (alert \"This is an alert\" :severity \\='trivial)\n\n  ;; Alerts can have optional titles.  Otherwise, the title is the\n  ;; buffer-name of the (current-buffer) where the alert originated.\n  (alert \"This is an alert\" :title \"My Alert\")\n\n  ;; Further, alerts can have categories.  This allows users to\n  ;; selectively filter on them.\n  (alert \"This is an alert\" :title \"My Alert\"\n         :category \\='some-category-or-other)\n\n(fn MESSAGE &key (SEVERITY \\='normal) TITLE ICON CATEGORY BUFFER MODE DATA STYLE PERSISTENT NEVER-PERSIST ID)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "alert" '("alert-" "x-urgen")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; alert-autoloads.el ends here
