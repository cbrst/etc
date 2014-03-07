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

;; Magit keybindings
(global-set-key (kbd "C-c g") 'magit-status)

;; reindent buffer
(global-set-key (kbd "C-c i") 'indent-buffer)

;; expand-region
(global-set-key (kbd "C-+") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; ace-jump
(global-set-key (kbd "C-c f w") 'ace-jump-word-mode)
(global-set-key (kbd "C-c f c") 'ace-jump-char-mode)
(global-set-key (kbd "C-c f l") 'ace-jump-line-mode)

(global-set-key (kbd "C-<up>") 'move-text-up)
(global-set-key (kbd "C-<down>") 'move-text-down)

(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)

(global-set-key (kbd "M-/") 'replace-under-cursor)

;; EVIL

;; wrap selection
(define-key evil-visual-state-map (kbd "(")  'insert-pair)
(define-key evil-visual-state-map (kbd "[")  'insert-pair)
(define-key evil-visual-state-map (kbd "{")  'insert-pair)
(define-key evil-visual-state-map (kbd "\"") 'insert-pair)
(define-key evil-visual-state-map (kbd "\'") 'insert-pair)

;; wrap word
(defun wrap-word ()
  "Wrap the word under the pointer"
  (interactive) (evil-backward-word-begin) (mark-word) (insert-pair))

(define-key evil-normal-state-map (kbd "\"") 'wrap-word)
(define-key evil-normal-state-map (kbd "\'") 'wrap-word)

;; toggle comments
(define-key evil-normal-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)

;; string-rectangle from visual mode
(define-key evil-visual-state-map (kbd "r") 'string-rectangle)
