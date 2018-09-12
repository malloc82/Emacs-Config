;;; cuda-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "cuda-mode" "cuda-mode.el" (0 0 0 0))
;;; Generated autoloads from cuda-mode.el

(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))

(autoload 'cuda-mode "cuda-mode" "\
Major mode for editing CUDA.\nCuda is a C like language extension for mixed native/GPU coding\ncreated by NVIDIA\n \nThe hook `c-mode-common-hook' is run with no args at mode\ninitialization, then `cuda-mode-hook'.\n\nKey bindings:\n\\{cuda-mode-map}\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "cuda-mode" '("cuda-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; cuda-mode-autoloads.el ends here
