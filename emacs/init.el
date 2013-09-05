;; ELPA Stuff

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
	     '("melpa"     . "http://melpa.milkbox.net/packages/") t)

(package-initialize)


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
