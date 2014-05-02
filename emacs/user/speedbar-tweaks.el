(eval-after-load 'sr-speedbar
  '(progn
     (setq speedbar-hide-button-brackets-flag t
           speedbar-show-unknown-files t
           speedbar-smart-directory-expand-flag t
           speedbar-directory-button-trim-method 'trim
           speedbar-use-images nil
           sr-speedbar-auto-refresh nil
           sr-speedbar-width 20
           sr-speedbar-width-x 20
           sr-speedbar-right-side nil)

     (add-hook 'speedbar-mode-hook
               '(lambda ()
                  (hl-line-mode 1)
                  (visual-line-mode -1)
                  (setq automatic-hscrolling nil)
                  (let ((sb-display-table (make-display-table)))
                    (set-display-table-slot sb-display-table 0 8230)
                    (setq buffer-display-table sb-display-table))))))
