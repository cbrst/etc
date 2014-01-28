(add-to-list 'custom-theme-load-path
             (concat emacs-dir "themes/"))

(if (eq system-type 'darwin)
    (set-face-attribute 'default nil :font "Source Code Pro-11")
  (set-face-attribute 'default nil :font "PragmataPro-7"))

(load-theme 'erosion t)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 1)
(blink-cursor-mode 0)
(setq inhibit-splash-screen t)
(global-hl-line-mode 1)

(setq linum-format " %3d")

(global-rainbow-delimiters-mode t)
