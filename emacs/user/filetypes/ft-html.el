;; MMM for node.js ejs template files
(mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)

(add-to-list 'auto-mode-alist '(".ejs" . html-erb-mode))

;; autocomplete-emmet
(add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
(add-hook 'css-mode-hook 'ac-emmet-css-setup)
