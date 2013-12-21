;; Handle TAB behaviour
(defun sgml-handle-tab ()
  "Handle TAB behaviour for SGML modes
   - turn off AC
   - turn on emmet"
  (interactive)
  (auto-complete-mode 0)
  (emmet-mode 1))

(add-hook 'sgml-mode-hook 'sgml-handle-tab)
(add-hook 'css-mode-hook 'sgml-handle-tab)

;; Indentation
(add-hook 'sgml-mode-hook (lambda ()
                            (set (make-local-variable 'sgml-basic-offset) 2)
                            (sgml-guess-indent)))

;; Emmet settings
(add-hook 'emmet-mode-hook (lambda ()
                             (setq emmet-indentation 3
                                   emmet-preview-default nil)))

;; MMM for node.js ejs template files
;; (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
;; (mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
;; (mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)

;; (add-to-list 'auto-mode-alist '(".ejs" . html-erb-mode))

;; reindent after deleting tag
(defadvice sgml-delete-tag (after reindent-buffer activate)
  (cleanup-buffer))

;; redefine newline
(defun sgml-before-is-opening-tag ()
  "Check if the tag preceding point is an opening tag."
  (save-excursion
    (let ((pre-tag-position (search-backward "<")))
      (if (string= (string (char-after (+ pre-tag-position 1))) "/")
          nil
        t))))

(defun sgml-after-is-closing-tag ()
  "Check if the tag following point is a closing tag."
  (save-excursion
    (let ((post-tag-position (search-forward "<")))
      (if (string= (string (char-after post-tag-position)) "/")
          t
        nil))))

(defun sgml-is-between-tags ()
  "Check if point is immediately between two tags (>|<)"
  (let ((before (string (preceding-char)))
        (after  (string (following-char))))
    (if (and
         (string= before ">")
         (string= after "<"))
        t 
      nil)))

(defun sgml-newline ()
  "Insert two newlines when point is between opening and closing tags (>|</)"
  (interactive)
  (if (and
       (sgml-is-between-tags)
       (sgml-before-is-opening-tag)
       (sgml-after-is-closing-tag))
      (progn
        (newline-and-indent)
        (newline-and-indent)
        (forward-line -1)
        (indent-according-to-mode))
    (newline-and-indent)))

;; keybindings
(eval-after-load "sgml-mode"
  '(progn
     (define-key sgml-mode-map (kbd "C-c C-r") 'mc/mark-sgml-tag-pair)
     (define-key sgml-mode-map (kbd "RET") 'sgml-newline)))

