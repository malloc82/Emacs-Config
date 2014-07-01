;; Scheme settings

(when (file-exists-p "quack.el")
  (require 'quack)
  (setq quack-programs (quote ("mzscheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi")))

  ;; ==========================================================
  ;; Install scribble and modify emacs startup file
  ;; ==========================================================
  ;; (require (planet neil/scribble-emacs:1:2/install-in-my-emacs))

  ;; ==========================================================
  ;; Install scribble without modifying emacs startup file
  ;; ==========================================================
  ;; (require (planet neil/scribble-emacs:1:2))

  (condition-case err
      (require 'scribble "/Users/zcai/Library/Racket/planet/300/5.1/cache/neil/scribble-emacs.plt/1/2/scribble")
    (error (message "Could not load Scribble Emacs: %s" err)))

  )
