;; js-mode
(defun js-indentation ()
  "Mold indentation to my likes"
  (interactive)
  (setq indent-tabs-mode t
        tab-width 3
        js-indent-level 3))

(add-hook 'js-mode-hook 'js-indentation)

;; keybindings
(eval-after-load 'js-mode
  '(define-key js-mode-map (kbd "<S-return>") (lambda () (interactive)
                                                (insert ";")
                                                (newline-and-indent))))
