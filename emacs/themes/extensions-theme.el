(defvar theme-font-height
  (face-attribute 'default :height)
  "Default font height.")

(defvar theme-small-font-height
  (floor (* .917 theme-font-height))
  "Relative size for 'small' fonts.")

(deftheme extensions "Some additions to any theme")

(custom-theme-set-faces
 'extensions
 `(speedbar-directory-face
   ((t (:foreground unspecified
                    :background unspecified
                    :inherit variable-pitch
                    :weight bold
                    :height ,theme-small-font-height))))
 `(speedbar-file-face
   ((t (:foreground unspecified
                    :inherit speedbar-directory-face
                    :weight normal))))
 `(speedbar-selected-face
   ((t (:background unspecified
                    :foreground unspecified
                    :height unspecified
                    :inherit (speedbar-file-face font-lock-function-name-face)))))
 `(speedbar-highlight-face
   ((t (:background unspecified
                    :inherit region))))
 `(speedbar-button-face
   ((t (:foreground unspecified
                    :background unspecified
                    :inherit file-name-shadow))))
 `(speedbar-tag-face
   ((t (:background unspecified
                    :foreground unspecified
                    :height unspecified
                    :inherit speedbar-file-face))))
 `(speedbar-separator-face
   ((t (:foreground unspecified
                    :background unspecified
                    :inverse-video nil
                    :inherit speedbar-directory-face
                    :overline nil
                    :weight bold))))
 `(linum
   ((t (:height ,theme-small-font-height
                :foreground unspecified
                :inherit 'shadow
                :slant normal))))
 `(visible-mark-face
   ((t (:foreground unspecified
                    :background unspecified
                    :inverse-video unspecified
                    :inherit 'hl-line))))
 `(hl-sexp-face
   ((t (:bold nil
              :background unspecified
              :inherit 'hl-line))))
 `(fringe
   ((t (:background unspecified))))
 `(vertical-border
   ((t (:background unspecified
                    :inherit file-name-shadow))))
 `(font-lock-comment-face
   ((t (:slant normal))))
 `(font-lock-doc-face
   ((t (:slant normal))))
 `(popup-face
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit linum
                    :height ,theme-font-height))))
 `(popup-scroll-bar-foreground-face
   ((t (:background unspecified
                    :inherit region))))
 `(popup-scroll-bar-background-face
   ((t (:background unspecified
                    :inherit popup-face))))
 `(ac-completion-face
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit popup-face))))
 `(ac-candidate-face
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit linum
                    :height ,theme-font-height))))
 `(ac-selection-face
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit font-lock-variable-name-face
                    :inverse-video t))))
 `(ac-candidate-mouse-face
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit region))))
 `(ac-dabbrev-menu-face
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit popup-face))))
 `(ac-dabbrev-selection-face
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit ac-selection-face))))
 `(flymake-warnline
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit font-lock-preprocessor-face))))
 `(web-mode-symbol-face
   ((t (:foreground unspecified
                    :inherit font-lock-constant-face))))
 `(web-mode-builtin-face
   ((t (:foreground unspecified
                    :inherit default))))
 `(web-mode-doctype-face
   ((t (:foreground unspecified
                    :inherit font-lock-comment-face))))
 `(web-mode-html-tag-face
   ((t (:foreground unspecified
                    :inherit font-lock-function-name-face))))
 `(web-mode-html-attr-name-face
   ((t (:foreground unspecified
                    :inherit font-lock-variable-name-face))))
 `(web-mode-html-param-name-face
   ((t (:foreground unspecified
                    :inherit font-lock-constant-face))))
 `(web-mode-whitespace-face
   ((t (:foreground unspecified
                    :inherit whitespace-space))))
 `(web-mode-block-face
   ((t (:foreground unspecified
                    :inherit highlight))))
 `(sp-show-pair-match-face
   ((t (:foreground unspecified
                    :background unspecified
                    :inherit show-paren-match))))
 `(sp-show-pair-mismatch-face
   ((t (:foreground unspecified
                    :background unspecified
                    :inherit show-paren-mismatch))))
 `(vr/match-0
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit font-lock-regexp-grouping-construct
                    :inverse-video t))))
 `(vr/match-1
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit font-lock-regexp-grouping-backslash
                    :inverse-video t))))
 `(vr/group-0
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit font-lock-keyword-face
                    :inverse-video t))))
 `(vr/group-1
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit font-lock-function-name-face
                    :inverse-video t))))
 `(vr/group-2
   ((t (:background unspecified
                    :foreground unspecified
                    :inherit font-lock-constant-face
                    :inverse-video t))))
 `(whitespace-space
   ((t (:foreground unspecified
                    :background unspecified
                    :inherit highlight)))))

(provide-theme 'extensions)
