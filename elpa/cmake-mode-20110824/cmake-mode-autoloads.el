;;; cmake-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "cmake-mode" "cmake-mode.el" (0 0 0 0))
;;; Generated autoloads from cmake-mode.el
 (add-to-list 'auto-mode-alist '("^CMakeLists\\.txt\\'" . cmake-mode))
 (add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

(autoload 'cmake-mode "cmake-mode" "\
Major mode for editing CMake source files.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "cmake-mode" '("cmake-" "unscreamify-cmake-buffer")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cmake-mode-autoloads.el ends here
