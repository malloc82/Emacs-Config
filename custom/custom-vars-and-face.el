
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/custom/themes"))

;; Hashses are generated using 'shasum -a 256'
(custom-set-variables
 '(ansi-color-names-vector ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-safe-themes
   '("88e7e16a25bc0986f6c769961c21fa92d318ebbfe4d52f1913486cfbcc8bde77" ;; misterioso-custom
     "e08aa0022c3558978a3a36ad018c122320708084adde761c8fd1ed3e90e1791a" ;; dark-night-gray no italic comment
     "b4f25520a8e15ee3a81b932e32f0694bd51a0505c91537948bbdfb97e298a84e" ;; dark-night-white
     "d9c7b4341ddd9e78a1116f925a586f789aa613888053710fb5956a815e84183f" ;; radiance
     "616a92727cab6c74727abbadfa2a02420b3bc84079bd5d4b32d1d655565e5acc" ;; tango-custom
     "9f47e6729fc22d3e86d79f440d21f588006d733439f54ff4544d092f2a993563" ;; tango-dark-custom
     "5973b028c7b67e82d5e6d5cf715c8721e6699e376650fbc7170416541ce0cc4a" ;; base16-default, for running things in terminal
     "4f28dd3d47fcbd3b504235a55651225fa6befb09ab56156678c7470218a71cc2" ;; tron-legacy
     default))

 ;; '(ns-antialias-text nil) ;; for proggy font on mac with second monitor
 '(fci-rule-color "#383838"))

(if window-system
    ;; (setq custom-enabled-themes '(dark-night-gray))
    ;; (load-theme 'tron-legacy)
    (load-theme 'tango-custom)
  (load-theme 'base16-default))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/profiles"))

(cond ((eq system-type 'darwin)    ;; (load "mac_external_monitor")
       (load "mac_inconsolata.el"))
      ((eq system-type 'gnu/linux) (load "linux_proggy")))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  `(default ,(cond
;;              ((eq system-type 'gnu/linux)
;;               '((t (:family "ProggyCleanTTSZ" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))
;;               ;; '((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 99 :width normal)))
;;               ;; '((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 117 :width normal)))
;;               )
;;              ((eq system-type 'darwin)
;;               ;; '((t (:font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))) ;; emacs-24
;;               ;; '((t (:family "ProggyCleanTTSZ" :foundry "unknown" :slant normal :weight normal :height 160 :width normal)))
;;               '((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))
;;               ;; '((t (:family "Fira Code"   :foundry "Unknown" :slant normal :weight normal :height 120 :width normal)))
;;               ;; '((t (:family "Monoid"      :foundry "Unknown" :slant normal :weight normal :height 120 :width normal)))
;;               ;; '((t (:font "-*-Monaco-normal-normal-normal-*-10-*-*-*-m-0-iso10646-1")))
;;               ))))
