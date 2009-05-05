

;; (setq send-mail-function 'smtpmail-send-it
;;       message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials
;;       '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials
;;       '(("smtp.gmail.com" 587 "ritchiecai@gmail.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-debug-info t)
;; (require 'smtpmail)


;; ===========================
;; Veiw Mail
;; ===========================

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/vm/lisp"))
(add-to-list 'Info-default-directory-list
             (expand-file-name "~/.emacs.d/vm/info"))


(require 'vm-autoloads)

(setq vm-init-file nil)

(setq vm-primary-inbox "~/Mail/inbox.mbox")
(setq vm-crash-box     "~/Mail/inbox.crash.mbox")

;; (setq vm-spool-files `((,vm-primary-inbox
;;                         "/var/mail/Me"
;;                         ,vm-crash-box)))

(setq vm-spool-files `(
                       ("~/Mail/inbox.mbox"
                        "imap-ssl:imap.gmail.com:993:inbox:login:voodoochild2006:*"
                        "~/Mail/inbox.crash.mbox")))


(setq vm-imap-auto-expunge-alist
      '(
        ;; leave message on the server
        ("imap-ssl:imap.gmail.com:993:inbox:login:voodoochild2006:*" . nil)
        ;; expunge immediately
        ;; ("imap:hilo.harkie.org:143:inbox:login:kyle:*" . t)
        )
      )

;; (add-to-list 'vm-spool-files
;;              '("~/Mail/ritchiecai@gmail.com"
;;                "imap:imap.gmail.com:993:ritchiecai@gmail.com:login:ritchie:*"
;;                "~/Mail/IMAP-INBOX.CRASH"))