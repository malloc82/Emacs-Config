;; -*- mode: emacs-lisp -*-

;; Perl 

;; cperl-mode is preferred to perl-mode                                        
;; "Brevity is the soul of wit" <foo at acm.org>                               
(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          #'(lambda ()
              (setq cperl-electric-keywords t)
              (setq show-trailing-whitespace t)))
