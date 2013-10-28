;; multiple cursors
(global-set-key (kbd "C-S-c C-S-s") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; toggle truncate lines
(global-set-key (kbd "<f5>") 'toggle-truncate-lines)

;; i don't use fillcolumn
(global-set-key (kbd "C-x f") 'ido-find-file)

;; M-x is a pain to reach
(global-set-key (kbd "C-x x") 'execute-extended-command)

;; in/decrement numbers
(global-set-key (kbd "C-c a") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c x") 'evil-numbers/dec-at-pt)

;; EVIL

;; wrap selection
(define-key evil-visual-state-map (kbd "(")  'insert-pair)
(define-key evil-visual-state-map (kbd "[")  'insert-pair)
(define-key evil-visual-state-map (kbd "{")  'insert-pair)
(define-key evil-visual-state-map (kbd "\"") 'insert-pair)
(define-key evil-visual-state-map (kbd "\'") 'insert-pair)

;; toggle comments
(define-key evil-normal-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)

