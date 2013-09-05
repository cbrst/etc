(add-to-list 'custom-theme-load-path
						 (concat emacs-dir "themes/"))

(load-theme 'dotshare t)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(blink-cursor-mode 0)
(setq inhibit-splash-screen t)
(global-hl-line-mode 1)

(linum-mode t)
(setq linum-format " %3d")