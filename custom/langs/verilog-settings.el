(setq show-trailing-whitespace t)
;; (add-paredit verilog-mode-map)
(electric-pair-mode +1)
(yas-minor-mode +1)
(define-key verilog-mode-map ";" nil) ;; not using 'electric-verilog-semi
