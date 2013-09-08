;; multiple cursors
(global-set-key (kbd "C-S-c C-S-s") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; toggle word wrap
(global-set-key (kbd "<f5>") 'toggle-word-wrap)
