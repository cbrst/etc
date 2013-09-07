(defun elisp-indentation ()
  "Mold indentation to my likes"
  (interactive)
  (setq indent-tabs-mode nil))

(add-hook 'emacs-lisp-mode-hook 'elisp-indentation)
