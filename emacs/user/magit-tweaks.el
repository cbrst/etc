;; Add extra newline to separate commit messages
(defun magit-commit-mode-init ()
  (when (looking-at "\n")
    (open-line 1)))

(add-hook 'git-commit-mode-hook 'magit-commit-mode-init)

;; Ammend commit without prompt
(defun magit-just-ammend ()
  "Append last commit without a prompt"
  (interactive)
  (save-window-excursion
    (magit-with-refresh
     (shell-command "git --no-pager commit --amend --reuse-message=HEAD"))))

;; close popup when committing
(defadvice git-commit-commit (after delete-window activate)
  (delete-window))

;; Keybindings
(eval-after-load "magit"
  '(define-key magit-status-mode-map (kbd "C-c C-a") 'magit-just-ammend))

;; ask to increase version number before push
(defadvice ask-version-number (around magit-push activate)
  "Ask a reminder to increase version numbers before push."
  (when (y-or-n-p "Did you increase the version number?")
    ad-do-it))
