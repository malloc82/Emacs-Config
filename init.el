;; -*- mode: Emacs-Lisp -*-

;; Timer
(defvar *emacs-load-start* (current-time))

;; Meta key setup
(cond ((eq system-type 'darwin)
       (setq mac-command-modifier 'meta) ; make cmd key do Meta
       (setq mac-option-modifier 'super) ; make opt key do Super
       ;; (setq mac-control-modifier 'control) ; make Control key do Control
       (setq ns-function-modifier 'hyper) ; make Fn key do Hyper
       )
      ((eq system-type 'windows)
       (setq w32-pass-lwindow-to-system nil)
       (setq w32-lwindow-modifier 'super) ; Left Windows key

       (setq w32-pass-rwindow-to-system nil)
       (setq w32-rwindow-modifier 'super) ; Right Windows key

       (setq w32-pass-apps-to-system nil)
       (setq w32-apps-modifier 'hyper) ; Menu/App key
       ))

;; (when (eq system-type 'darwin)
;;   (setq ns-command-modifier 'meta)
;;   (setq ns-alternate-modifier 'none))

(setq custom-file "~/.emacs.d/custom-init.el")
(setq current-path (getenv "PWD"))
(cd "~/.emacs.d/custom") ;; all sub dir will be added to the load-path

(dolist (path `(,(expand-file-name "~/.emacs.d/custom")
                ,(expand-file-name "~/.emacs.d/vendor")
                "PACKAGE_DIRECTORY"))
  (add-to-list 'load-path path))

(when (>= emacs-major-version 24) (load "packages-settings"))

;; (message "Emacs ELPA loaded in %ds"
;;          (destructuring-bind (hi lo ms &optional ps) (current-time)
;;            (- (+ hi lo)
;;               (+ (first *emacs-load-start*) (second *emacs-load-start*)))))


(load "env") ;; takes 1s to loade
(load "keys")

(if (eq current-path nil)
    (cd "~/.")
  (cd current-path))

(load "functions")
(load "general")  ;; takes 2s to load
(load "faces")
(load "lang") ;; takes 1s to load

(message "Emacs config loaded in %ds"
         (destructuring-bind (hi lo ms &optional ps) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*) (second *emacs-load-start*)))))

(load "custom-vars-and-face")

;;
;; END init.el
;;
