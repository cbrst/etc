(yas-global-mode 1)

<<<<<<< HEAD
(eval-after-load 'auto-complete
  '(progn
     (require 'auto-complete-config)
     (ac-config-default)
     (define-key ac-completing-map (kbd "ESC") 'ac-stop)
     (setq ac-delay 0.125
           ac-auto-show-menu 0.25
           ac-auto-start 3
           ac-quick-help-delay 2.0
           ac-ignore-case nil
           ac-candidate-menu-min 2
           ac-use-quick-help t
           ac-use-fuzzy t
           ac-disable-faces nil)
     (setq-default ac-sources
                   '(ac-source-abbrev
                     ac-source-words-in-buffer
                     ac-source-filename
                     ac-source-imenu
                     ac-source-dictionary
                     ac-source-yasnippet))))
=======
(require 'auto-complete-config)
(ac-config-default)

(setq ac-sources
      '(ac-source-words-in-same-mode-buffers
        ac-source-abbrev
        ac-source-dictionary
        ac-source-yasnippet))
>>>>>>> FETCH_HEAD
