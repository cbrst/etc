;; ELPA Stuff

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
	     '("melpa"     . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Make sure these are installed
(defvar elpa-required-packages '(
                                 auto-complete
                                 autopair
                                 evil
                                 evil-leader
                                 evil-nerd-commenter
                                 evil-numbers
                                 evil-paredit
                                 haml-mode
                                 haskell-mode
                                 lua-mode
                                 magit
                                 markdown-mode
                                 mmm-mode
                                 multiple-cursors
                                 paredit
                                 rainbow-delimiters
                                 rainbow-mode
                                 sawfish
                                 smart-tab
                                 smart-tabs-mode
                                 stylus-mode
                                 sws-mode
                                 undo-tree
                                 yasnippet)
  "Default Packages")

(dolist (pkg elpa-required-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Load vendor and custom files
;;(defvar emacs-dir (file-name-directory load-file-name)
(defvar emacs-dir "/home/crshd/etc/emacs/"
	"top level emacs dir")

(defvar vendor-dir (concat emacs-dir "vendor/")
	"packages not from ELPA")

(defvar module-dir (concat emacs-dir "user/")
	"don't enter here. magic!")


;; Add to load path
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path module-dir)


;; Require packages in module dir
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))
