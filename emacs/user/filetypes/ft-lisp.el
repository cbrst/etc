(defun lisp-indentation ()
  "Mold indentation to my likes"
  (interactive)
  (setq indent-tabs-mode nil))

(add-hook 'lisp-mode-hook 'lisp-indentation)

(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
