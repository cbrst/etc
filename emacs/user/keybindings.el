;; toggle truncate lines
(global-set-key (kbd "<f5>") 'toggle-truncate-lines)

;; i don't use fillcolumn
(global-set-key (kbd "C-x f") 'ido-find-file)

;; M-x is a pain to reach. Also, Smex.
(global-set-key (kbd "C-x x") 'smex)

;; in/decrement numbers
(global-set-key (kbd "C-c a") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c x") 'evil-numbers/dec-at-pt)

;; Magit keybindings
(global-set-key (kbd "C-c g") 'magit-status)

;; reindent buffer
(global-set-key (kbd "C-c i") 'cleanup-buffer)

;; expand-region
(global-set-key (kbd "C-+") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; ace-jump
(global-set-key (kbd "C-c f w") 'ace-jump-word-mode)
(global-set-key (kbd "C-c f c") 'ace-jump-char-mode)
(global-set-key (kbd "C-c f l") 'ace-jump-line-mode)

;; speedbar
(global-set-key (kbd "C-c b") 'sr-speedbar-toggle)

;; buffer killing
(global-set-key (kbd "C-x C-k") 'kill-default-buffer)

;; fast buffer switching
(global-set-key (kbd "C-x C-b") 'switch-to-previous-buffer)

(global-set-key (kbd "M-;") 'insert-semicolon-at-end-of-line)
(global-set-key (kbd "M-RET") 'newline-anywhere)

;; move text up/down
(global-set-key (kbd "C-<up>") 'move-text-up)
(global-set-key (kbd "C-<down>") 'move-text-down)

(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)

(global-set-key (kbd "M-/") 'replace-under-cursor)

(global-set-key (kbd "C-;") 'iedit-mode)
(global-set-key (kbd "C-c ;") 'iedit-dwim)

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

;; rebind <Esc> to C-g
(define-key evil-insert-state-map (kbd "C-g") 'evil-force-normal-state)

(defun evil-all-keys (keybind command)
  "Define keybinding in all of evil's modes"
  (define-key evil-normal-state-map keybind command)
  (define-key evil-insert-state-map keybind command)
  (define-key evil-visual-state-map keybind command))

;; Get back default emacs movement keys
(evil-all-keys (kbd "C-p") 'previous-logical-line)
(evil-all-keys (kbd "C-n") 'next-logical-line)
(evil-all-keys (kbd "C-d") 'delete-char)
(evil-all-keys (kbd "C-e") 'end-of-line)
(evil-all-keys (kbd "C-f") 'forward-char)
(evil-all-keys (kbd "C-b") 'backward-char)
