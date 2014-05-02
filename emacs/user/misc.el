;; default window size
;; (defun set-frame-size-according-to-resolution ()
;;   (interactive)
;;   (if window-system
;;       (progn
;;         (add-to-list 'default-frame-alist (cons 'height 47))
;;         (add-to-list 'default-frame-alist (cons 'width 90)))))
;; (set-frame-size-according-to-resolution)

;; those backup files are annoying. that's what git is for
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Indentation
(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode t)

(setq require-final-newline t)

(smart-tabs-insinuate
 'c
 'c++
 'java
 'javascript)

;; save tetris score here
(setq tetris-score-file "~/etc/emacs/tetris-scores")

;; i'm too lazy to type 2-3 characters
(defalias 'yes-or-no-p 'y-or-n-p)

;; ido
(ido-mode t)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

;; load smartparens config
(require 'smartparens-config)

;; git gutter
(global-git-gutter+-mode 1)

;; show-paren-mode
(show-paren-mode 1)

;; disable bell
(setq ring-bell-function 'ignore)

;; fix lambda-mode symbol
(setq lambda-symbol "λ")

;; scrolling behavior
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't
      mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; append PATH
(let ((paths
       '("/usr/local/bin"
         "/usr/pkg/bin"
         "/sbin")))
  (setq exec-path (append exec-path paths)))

(setq markdown-command "/usr/pkg/bin/markdown")

(defadvice server-done (before save-before-server-done activate)
  "Automatically save buffer when done."
  (when (buffer-modified-p)
    (save-buffer)))
