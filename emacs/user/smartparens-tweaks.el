(smartparens-global-mode t)

(defun sp-pair-on-newline (id action context)
  "Put trailing pair on newline and return to point"
  (save-excursion
    (newline)
    (indent-according-to-mode)))

(defun sp-pair-on-newline-and-indent (id action context)
  "Open a new brace or bracket expression, with relevant newlines and indent"
  (sp-pair-on-newline id action context)
  (indent-according-to-mode))

(sp-pair "{" nil :post-handlers
         '(:add ((lambda (id action context)
                   (sp-pair-on-newline-and-indent id action context)) "RET")))

(sp-pair "[" nil :post-handlers
         '(:add ((lambda (id action context)
                   (sp-pair-on-newline-and-indent id action context)) "RET")))

(sp-local-pair '(markdown-mode gfm-mode) "*" "*"
               :unless '(sp-in-string-p)
               :actions '(insert wrap))

(sp-pair "\"" nil :unless '(sp-point-after-word-p))
(sp-pair "'" nil :unless '(sp-point-after-word-p))
