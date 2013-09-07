(defun js-indentation ()
	"Mold indentation to my likes"
	(interactive)
	(setq js-indent-level 3
	      tab-width 3))

(add-hook 'js-mode-hook 'js-indentation)
