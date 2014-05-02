(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))

(defun paste-xinu (start end)
  "Paste current region or buffer to paste.xinu.at.
 Needs the command line client to be in $PATH."
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (shell-command (concat "fb <<\"EOF\" \n"
                         (if (and start end)
                             (buffer-substring-no-properties start end)
                           (buffer-substring-no-properties (point-min) (point-max))))))

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (beginning-of-line)
    (when (or (> arg 0) (not (bobp)))
      (forward-line)
      (when (or (< arg 0) (not (eobp)))
        (transpose-lines arg))
      (forward-line -1)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(defun prefixr-region (start end)
  "Run active region through the Prefixr API."
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list (point-min) (point-max))))
  (let ((str (buffer-substring-no-properties start end)))
    (shell-command-on-region start end
                             (concat "curl -sSd css=\"" str "\" http://prefixr.com/api/index.php") t t)))

(defun replace-under-cursor (word)
  "Replace all occurences of the word under the cursor"
  (interactive "sReplace with: ")
  (save-excursion
    (forward-word)
    (let ((end (point)))
      (backward-word)
      (kill-ring-save (point) end)
      (replace-string (current-kill 0) word nil (point-min) (point-max)))))

(defun insert-semicolon-at-end-of-line ()
  "Add a semicolon from anywhere in the line."
  (interactive)
  (save-excursion
    (end-of-line)
    (insert ";")))

(defun newline-anywhere ()
  "Add a newline from anywhere in the line"
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun kill-default-buffer ()
  "Kill the currently active buffer"
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

(defun kill-buffer-if-file (buf)
  "Kill a buffer only if it is file-based"
  (interactive)
  (when (buffer-file-name buf)
    (when (buffer-modified-p buf)
      (when (y-or-n-p (format "Buffer %s is modified - save it?" (buffer-name buf)))
        (save-some-buffers nil buf)))
    (set-buffer-modified-p nil)
    (kill-buffer buf)))

(defun kill-all-buffers ()
  "Kill all file-based buffers."
  (interactive)
  (mapc (lambda (buf) (kill-buffer-if-file buf))
        (buffer-list)))

(defun iedit-dwim (arg)
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        (if iedit-mode
            (iedit-done)
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer
   (other-buffer
    (current-buffer) 1)))
