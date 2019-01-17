;;; ssh-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ssh" "ssh.el" (0 0 0 0))
;;; Generated autoloads from ssh.el
 (add-hook 'same-window-regexps "^\\*ssh-.*\\*\\(\\|<[0-9]+>\\)")

(autoload 'ssh "ssh" "\
Open a network login connection via `ssh' with args INPUT-ARGS.\nINPUT-ARGS should start with a host name; it may also contain\nother arguments for `ssh'.\n\nInput is sent line-at-a-time to the remote connection.\n\nCommunication with the remote host is recorded in a buffer `*ssh-HOST*'\n(or `*ssh-USER@HOST*' if the remote username differs).\nIf a prefix argument is given and the buffer `*ssh-HOST*' already exists,\na new buffer with a different connection will be made.\n\nWhen called from a program, if the optional second argument BUFFER is\na string or buffer, it specifies the buffer to use.\n\nThe variable `ssh-program' contains the name of the actual program to\nrun.  It can be a relative or absolute path.\n\nThe variable `ssh-explicit-args' is a list of arguments to give to\nthe ssh when starting.  They are prepended to any arguments given in\nINPUT-ARGS.\n\nIf the default value of `ssh-directory-tracking-mode' is t, then the\ndefault directory in that buffer is set to a remote (FTP) file name to\naccess your home directory on the remote machine.  Occasionally this causes\nan error, if you cannot access the home directory on that machine.  This\nerror is harmless as long as you don't try to use that default directory.\n\nIf `ssh-directory-tracking-mode' is neither t nor nil, then the default\ndirectory is initially set up to your (local) home directory.\nThis is useful if the remote machine and your local machine\nshare the same files via NFS.  This is the default.\n\nIf you wish to change directory tracking styles during a session, use the\nfunction `ssh-directory-tracking-mode' rather than simply setting the\nvariable.\n\nThe variable `ssh-x-display-follow-current-frame' can be used to specify\nhow ssh X display tunelling interacts with frames on remote displays.\n\n(fn INPUT-ARGS &optional BUFFER)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ssh" '("ssh-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ssh-autoloads.el ends here
