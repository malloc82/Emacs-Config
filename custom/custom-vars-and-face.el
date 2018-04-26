
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/custom/themes"))

(custom-set-variables
 '(ansi-color-names-vector ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-safe-themes
   '("88e7e16a25bc0986f6c769961c21fa92d318ebbfe4d52f1913486cfbcc8bde77" ;; misterioso-custom
     "cf72e0a50f17c83cdb5eac7d61e6a90ec3a7572095c612abddf1e5f4dd81d6cc" ;; dark-night-gray no italic comment
     ;; "2e4033c81d9465003246dfcac05220adaf303910d92cbb330c9cbd3e76f14c4f" ;; dark-night-gray
     "b4f25520a8e15ee3a81b932e32f0694bd51a0505c91537948bbdfb97e298a84e" ;; dark-night-white
     "d9c7b4341ddd9e78a1116f925a586f789aa613888053710fb5956a815e84183f" ;; radiance
     "d4b1adc34bc0c74bf19daaf499b7350bafc291e43f35e86e50191cd72fcf2edc" ;; tango-custom
     "bcf64603c4f487738683539c87378deec176ef27ebb88a14a01e398ce790ec4c" ;; tango-dark-custom
     "5973b028c7b67e82d5e6d5cf715c8721e6699e376650fbc7170416541ce0cc4a" ;; base16-default, for running things in terminal
     default))
 (if window-system
     '(custom-enabled-themes '(dark-night-gray))
   '(custom-enabled-themes '(base16-default)))
 '(ns-antialias-text nil) ;; for proggy font on mac with second monitor
 '(fci-rule-color "#383838"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 `(default ,(cond
             ((eq system-type 'gnu/linux)
              '((t (:family "ProggyCleanTTSZ" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))
              ;; '((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 99 :width normal)))
              ;; '((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 117 :width normal)))
              )
             ((eq system-type 'darwin)
              ;; '((t (:font "-apple-monaco-medium-r-normal--10-120-72-72-m-120-mac-roman"))) ;; emacs-24
              '((t (:family "ProggyCleanTTSZ" :foundry "unknown" :slant normal :weight normal :height 160 :width normal)))
              ;; '((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))
              ;; '((t (:font "-*-Monaco-normal-normal-normal-*-10-*-*-*-m-0-iso10646-1")))
              ))))
