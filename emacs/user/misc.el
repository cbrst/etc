(setq make-backup-files nil)
(setq auto-save-default nil)

(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode t)

(setq require-final-newline t)

(paredit-mode 1)

(smart-tabs-insinuate
 'c
 'c++
 'java
 'javascript)

(setq tetris-score-file "~/etc/emacs/tetris-scores")
