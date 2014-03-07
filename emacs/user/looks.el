(add-to-list 'custom-theme-load-path
             (concat emacs-dir "themes/"))

(when window-system
  (setq-default line-spacing 2)
  (set-face-font 'default "Source Code Pro-11")
  (set-face-font 'variable-pitch "Lucida Grande-11")
  (set-face-font 'fixed-pitch "Source Code Pro-11"))

;; minibuffer doesn't like line-spacing != 0
(add-hook 'minibuffer-setup-hook
          (lambda ()
            (set (make-local-variable 'line-spacing) 0)))

(defadvice load-theme
  (after load-theme-extension activate)
  "Load custom theme extensions"
  (when (not (equal theme 'extensions))
    (load-theme 'extensions t)))  

(setq solarized-high-contrast-mode-line t)

(load-theme 'solarized-light t)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 1)
(blink-cursor-mode 0)
(setq inhibit-splash-screen t)
(global-hl-line-mode 1)

(setq linum-format " %3d")

(global-rainbow-delimiters-mode t)

