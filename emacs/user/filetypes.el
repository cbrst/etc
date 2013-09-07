;; individual file type settings are stored here
(defvar filetypes-dir (concat module-dir "filetypes/"))
(add-to-list 'load-path filetypes-dir)

(mapc 'load (directory-files filetypes-dir nil "^[^#].*el$"))


;; emacs doesn't know about these by default.
(add-to-list 'auto-mode-alist
             '(".zsh"  . sh-mode)
             '(".hamd" . haml-mode))

