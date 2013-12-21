(setq mmm-global-mode 'maybe)

(mmm-add-mode-ext-class 'html-mode nil 'javascript-mode)
;; (mmm-add-mode-ext-class 'html-mode "\\.html\\'" 'python-mode)

(setq mmm-major-mode-preferences
      '((javascript js3-mode js2-mode javascript-mode c++-mode)
        (perl cperl-mode perl-mode)
        (python python-mode)
        (css css-mode c++-mode)))
