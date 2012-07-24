;; Load and configure SLIME

(message "loading clojure settings ... ")
(add-to-list 'load-path "~/Installed/Emacs/clojure-slime/")

(require 'slime)
(eval-after-load 'slime '(setq slime-protocol-version 'ignore))
(slime-setup '(slime-repl))

;; Load a major mode for editing Clojure code.
;; (add-to-list 'load-path "/path/to/clojure-mode/checkout")
;; (require 'clojure-mode)
(require 'clojure-test-mode) ;; requires slime
(font-lock-add-keywords 'clojure-mode '(("(\\|)" . 'esk-paren-face)))
(message "done")

