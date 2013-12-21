;; default window size
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
      (progn
        (add-to-list 'default-frame-alist (cons 'height 60))
        (add-to-list 'default-frame-alist (cons 'width 120)))))
(set-frame-size-according-to-resolution)

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

;; enable some modes
(ido-mode t)
(autopair-mode 1)
(show-paren-mode 1)

(defadvice server-done (before save-before-server-done activate)
  "Automatically save buffer when done."
  (when (buffer-modified-p)
    (save-buffer)))
