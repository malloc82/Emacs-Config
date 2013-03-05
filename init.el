;; ~/.emacs.d/init.el

;; ===========================
;; Used for ~/.emacs
;; ===========================
;; Timer Part1
(defvar *emacs-load-start* (current-time))

(setq current-path (getenv "PWD"))
(cd "~/.emacs.d/")

(setq load-path (append '("~/.emacs.d/" "~/.emacs.d/my-packages" "PACKAGE_DIRECTORY") load-path))

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(load-library "my-env-settings")

(if (string= system-type "darwin")
    (progn
      (setq ns-command-modifier 'meta)
      (setq ns-alternate-modifier 'none)))
;; ==========================================================
;; Load path
;; ==========================================================

;; (require 'cl)

(normal-top-level-add-subdirs-to-load-path)
(setq exec-path (append '("/usr/local/bin/"
                          "/opt/local/bin/"
                          "/usr/local/cuda/bin"
                          "/usr/texbin"
                          "~/racket/bin")
                        exec-path))

(cond ((string= system-type "darwin")
       (add-to-list 'load-path "/Library/Python/2.6/site-packages/Pymacs")
       ;; (require 'growl)
       ;; (growl "Emacs" "Loading init.el ... ")
       )
      
      ((string= system-type "gnu/linux")
       (add-to-list 'load-path "~/lib/python2.7/site-packages/Pymacs"))
      )

(setq turn-on-follow-mouse t)

;; version control
;; (require 'mercurial)
(require 'emacs-lock)

(if (eq current-path nil)
    (cd "~/.")
    (cd current-path))

;; tab completion for compile command for <=emacs22.3
(when (< emacs-major-version 23)
  (require 'shell-command)
  (shell-command-completion-mode))

(require 'ascii)
(require 'multi-term)
(setq multi-term-program "/bin/bash")
(setq multi-term-switch-after-close nil)

(setq desktop-enable-save-on-exit nil)

(dolist (config-file '("my-behaviour"
                       "my-keys" "my-backup" "my-mouse" "my-dired.el"
                       "my-eshell" "my-abbrev" "my-tramp" "my-org-mode"
                       "my-syntax"  "my-color" 
                       "my-gud" "my-utils"
                       "my-cl-slime" ;; "my-clojure-setting"
                       ;; "my-desktop"
                       ;; "my-mail"
                       ))
  (load-library config-file))

;; start emacs server: 
;; (server-force-delete)
;; (if (>= emacs-major-version 23)
;;     (server-force-delete))
;; (server-start)

(load-theme 'cyberpunk t)
(eshell)

(when (boundp '*my-version*)
  (cond ((equal *my-version* "clojure-dev") (load-clojure-settings))
        ((equal *my-version* "lambda")      (load-library "my-cl-slime"))
        ((equal *my-version* "thesis")      (load-library "thesis-settings"))
        ((equal *my-version* "work")        (load-library "work-settings"))
        (t (message "Unknown version ... skip."))))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;; Timer Part2
(message "My init.el loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*) (second *emacs-load-start*)))))

;; (when (string= system-type "darwin")
;;   (growl "Emacs"
;;          (format "My init.el loaded in %ds"
;;                  (destructuring-bind (hi lo ms) (current-time)
;;                    (- (+ hi lo)
;;                       (+ (first *emacs-load-start*) (second *emacs-load-start*)))))))

(message "Emacs version = %ds" emacs-major-version)
(message "Emacs is running on: %s" system-type)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(default-truncate-lines nil t)
 '(display-time-mode t)
 '(isearch-highlight t)
 '(large-file-warning-threshold nil)
 '(org-agenda-files (quote ("~/Documents/TODOs/todo.org")))
 '(paren-sexp-mode nil)
 '(py-shell-name "/usr/local/bin/ipython")
 '(search-highlight t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(truncate-partial-width-windows nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white" :font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))))
 '(button ((t (:background "black" :weight bold))))
 '(cursor ((t (:background "yellow" :foreground "white"))))
 '(dired-directory ((t (:foreground "Skyblue2"))))
 '(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
 '(font-lock-comment-face ((t (:foreground "chocolate1" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "Aquamarine"))))
 '(font-lock-function-name-face ((t (:foreground "DeepSkyBlue"))))
 '(font-lock-keyword-face ((t (:foreground "Cyan1"))))
 '(font-lock-number-face ((t (:foreground "LightSalmon"))) t)
 '(font-lock-string-face ((t (:foreground "LightSalmon"))))
 '(font-lock-type-face ((t (:foreground "PaleGreen"))))
 '(font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
 '(font-lock-warning-face ((t (:foreground "Pink" :weight bold))))
 '(fringe ((t (:background "grey10"))))
 '(minibuffer-prompt ((t (:foreground "cyan"))))
 '(mode-line ((t (:background "grey70" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:background "grey30" :foreground "grey80" :box (:line-width -1 :style pressed-button)))))
 '(org-hide ((t (:foreground "black"))))
 '(region ((t (:background "blue4"))))
 '(secondary-selection ((t (:background "PaleVioletRed3")))))
