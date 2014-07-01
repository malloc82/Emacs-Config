;; -*- mode: emacs-lisp -*-
;; Erlang settings

(let ((path (find-expand-file-path "/opt/local/lib/erlang/lib/" "emacs")))
  (unless (null path)
    (message "erlang emacs found: %s" path)
    (push path load-path)
    (setq erlang-root-dir "/opt/local/lib/erlang/")
    (setq exec-path (append '("/opt/local/lib/erlang/bin") exec-path))
    (require 'erlang-start)))

(setq show-trailing-whitespace t)
