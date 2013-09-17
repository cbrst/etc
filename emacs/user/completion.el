(yas-global-mode 1)

(require 'auto-complete-config)
(ac-config-default)

(setq ac-sources
      '(ac-source-abbrev
        ac-source-dictionary
        ac-source-words-in-same-mode-buffers
        ac-source-yasnippet))
