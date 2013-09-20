;; default window size
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
      (progn
        (add-to-list 'default-frame-alist (cons 'height 60))
        (add-to-list 'default-frame-alist (cons 'width 120)))))
(set-frame-size-according-to-resolution)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode t)

(setq require-final-newline t)

(smart-tabs-insinuate
 'c
 'c++
 'java
 'javascript)

(setq tetris-score-file "~/etc/emacs/tetris-scores")

(ido-mode t)

;; i'm too lazy to type 2-3 characters
(defalias 'yes-or-no-p 'y-or-n-p)

;; enable autopair mode globally.
(autopair-mode 1)
