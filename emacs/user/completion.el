(yas-global-mode 1)

(defvar smart-tab-using-hippie-expand t)
(require 'smart-tab)
(global-smart-tab-mode 1)

(setq hippie-expand-try-functions-list
      '(yas-hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-complete-file-name-partially
        try-expand-all-abbrevs))
