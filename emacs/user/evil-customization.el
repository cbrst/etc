(evil-mode 1)

(setq evil-default-cursor t)

(setq evil-normal-state-msg "N"
			evil-insert-state-msg "I"
			evil-replace-state-msg "R"
			evil-emacs-state-msg "X"
			evil-visual-state-msg "V")

(evil-set-initial-state 'magit-log-edit-mode 'emacs)
