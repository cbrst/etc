(add-to-list 'custom-theme-load-path
             (concat emacs-dir "themes/"))

(when window-system
  (set-face-font 'default "Meslo LG L DZ-11")
  (set-face-font 'variable-pitch "Lucida Grande-11")
  (set-face-font 'fixed-pitch "Meslo LG L DZ-11"))

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
(load-theme 'solarized-grey t)

;; Change title format
(setq frame-title-format "%f")

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 1)
;; (blink-cursor-mode 0)
(setq inhibit-splash-screen t)
;; (global-hl-line-mode 1)

(setq linum-format " %3d")

(global-rainbow-delimiters-mode t)

(let ((accent-red    "#e36f3e")
      (accent-green  "#00a978")
      (accent-yellow "#be8612"))
  (custom-set-faces
   `(git-gutter+-added
     ((t (:background ,accent-green :foreground ,accent-green
                      :weight bold))))
   `(git-gutter+-deleted
     ((t (:background ,accent-red :foreground ,accent-red
                      :weight bold))))
   `(git-gutter+-modified
     ((t (:background ,accent-yellow :foreground ,accent-yellow
                      :weight bold))))))
