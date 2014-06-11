;; Custom paths
(defvar emacs-dir (if (eq system-type 'darwin)
                      (concat (getenv "HOME") "/etc/emacs/")
                    (concat (getenv "XDG_CONFIG_HOME") "/emacs/"))
  "top level emacs dir")

(defvar vendor-dir (concat emacs-dir "vendor/")
  "packages not from ELPA")

(defvar module-dir (concat emacs-dir "user/")
  "don't enter here. magic!")

(defvar elpa-dir (concat emacs-dir "elpa/")
  "all elpa stuffs here")


;; ELPA Stuff

(setq package-check-signature 'nil)
(require 'package)

;; Add some repos
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa"     . "http://melpa.milkbox.net/packages/") t)

;; Check if elpa dir exists, otherwise get archives
(unless (file-exists-p elpa-dir)
  (package-refresh-contents))

(package-initialize)

;; Packages I use
(defvar elpa-required-packages '(
                                 ace-jump-mode
                                 auto-complete
                                 emmet-mode
                                 expand-region
                                 evil
                                 git-gutter-fringe+
                                 ido-vertical-mode
                                 iedit
                                 magit
                                 rainbow-delimiters
                                 rainbow-mode
                                 smart-tab
                                 smart-tabs-mode
                                 smartparens
                                 smex
                                 solarized-theme
                                 sr-speedbar
                                 undo-tree
                                 yasnippet
                                 ;; Filetypes
                                 haml-mode
                                 markdown-mode
                                 stylus-mode
                                 sws-mode
                                 yaml-mode
                                 scss-mode
                                 ;; From here on, these packages depend on one
                                 ;; or more of the above, so they have to be
                                 ;; installed last
                                 ac-emmet
                                 evil-leader
                                 evil-nerd-commenter
                                 evil-numbers)
  "Default Packages")

;; Make sure those are installed
(dolist (pkg elpa-required-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))


;; Add to load path
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path module-dir)

;; Require packages in module dir
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))
(mapc 'load (directory-files vendor-dir nil "^[^#].*el$"))

;; Start server
(server-start)

