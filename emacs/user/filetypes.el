;; emacs doesn't know about these by default.
(setq auto-mode-alist
      (nconc
       '((".hamd"      . haml-mode))
       '((".zsh"       . sh-mode))
       auto-mode-alist))

;; individual file type settings are stored here
(defvar filetypes-dir (concat module-dir "filetypes/"))
(add-to-list 'load-path filetypes-dir)

(mapc 'load (directory-files filetypes-dir nil "^[^#].*el$"))
