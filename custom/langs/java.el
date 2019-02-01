;; source: http://www.goldsborough.me/emacs,/java/2016/02/24/22-54-16-setting_up_emacs_for_java_development/

(require 'eclim)
(add-hook 'java-mode-hook 'eclim-mode)

(require 'eclimd)
(setq eclimd-executable "~/eclipse/java-oxygen/Eclipse.app/Contents/Eclipse/eclimd")

(require 'company)
(global-company-mode t)

(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

