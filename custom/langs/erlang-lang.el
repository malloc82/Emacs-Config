;; -*- mode: emacs-lisp -*-
;; Erlang settings

(let ((path (m-expand-file-path "emacs" "/opt/local/lib/erlang/lib/")))
  (unless (null path)
    (message "erlang emacs found: %s" path)
    (push path load-path)
    (setq erlang-root-dir "/opt/local/lib/erlang/")
    (setq exec-path (append '("/opt/local/lib/erlang/bin") exec-path))
    (require 'erlang-start)))
