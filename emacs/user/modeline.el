(make-face 'mode-line-evil)
(make-face 'mode-line-padder)
(set-face-attribute 'mode-line-evil nil :box nil)
(set-face-attribute 'mode-line-padder nil :box '(:line-width 4 :color "grey20"))

(add-to-list 'load-path (concat vendor-dir "evil-plugins/"))
(require 'evil-mode-line)

(which-function-mode)

(setq powerline-text-scale-factor 1)

(defun ml/fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when powerline-text-scale-factor
    (setq reserve (* powerline-text-scale-factor reserve)))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
              'face face))

(defun ml/width (values)
  "Get the length of VALUES."
  (if values
      (let ((val (car values)))
        (+ (cond
            ((stringp val) (length (format-mode-line val)))
            ((and (listp val) (eq 'image (car val)))
             (car (image-size val)))
            (t 0))
           (ml/width (cdr values))))
    0))

(defun ml/item-render (item)
  "Render a powerline ITEM."
  (cond
   ((and (listp item) (eq 'image (car item)))
    (propertize " " 'display item
                'face (plist-get (cdr item) :face)))
   (item item)))

(defun ml/render (values)
  "Render a list of powerline VALUES."
  (mapconcat 'ml/item-render values ""))

(defun ml/format (value fontface)
  (propertize (format-mode-line value) 'face fontface))

(defun ml/column ()
  (propertize "%c" 'face
              (if (>= (current-column) 80)
                  'mode-line-80col
                'mode-line-col)))

(defun makemodeline ()
  (setq-default mode-line-format
<<<<<<< HEAD
                '(""
                  (:eval
                   (let* ((lhs (list
                                (ml/format evil-mode-line-msg 'mode-line-evil)
                                " "
                                (ml/format "%b" 'mode-line-buffer-name)
                                " "
                                (ml/format mode-name 'mode-line-mode)
                                (ml/format minor-mode-alist 'mode-line-minor-mode)))
                          (rhs (list
                                (ml/format which-func-format 'mode-line-func)
                                " "
                                (ml/format "%4l:" 'mode-line-line)
                                (ml/column))))
                     (concat (ml/render lhs)
                             (ml/fill 'mode-line-line-face (ml/width rhs))
                             (ml/render rhs)))))))
=======
        '(""
          (:eval
           (let* ((lhs (list
                        (ml/format evil-mode-line-msg 'mode-line-evil)
                        " "
                        (ml/format "%b" 'mode-line-buffer-name)
                        " "
                        (ml/format mode-name 'mode-line-mode)
                        (ml/format minor-mode-alist 'mode-line-minor-mode)))
                  (rhs (list
                        (ml/format "%4l:" 'mode-line-line)
                        (ml/column)
                        " "
                        (ml/format which-func-format 'mode-line-func))))
             (concat (ml/render lhs)
                     (ml/fill 'mode-line-line-face (ml/width rhs))
                     (ml/render rhs)))))))
>>>>>>> FETCH_HEAD
(makemodeline)

(defvar mode-line-cleaner-alist
  `((auto-complete-mode . "")
    (yas-minor-mode . "")
    (smartparens-mode . " Φ")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (undo-tree-mode . "")
    (volatile-highlights-mode . " υ")
    (elisp-slime-nav-mode . " δ")
    (nrepl-mode . " ηζ")
    (nrepl-interaction-mode . " ηζ")
    (git-gutter+-mode . "")
    ;; Major modes
    (clojure-mode . "λ")
    (hi-lock-mode . "")
    (python-mode . "Py")
    (emacs-lisp-mode . "ELisp")
    (markdown-mode . "MDown"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")


(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                  (mode-str (cdr cleaner))
                  (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str))
             ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)
