;;-------~---~----------~----------~----
;;
;; .---..---..-..-..-.-.-..---..-.-.-..-.-.-.
;;  \ \ `| |'| || || | | || |-'| | | || | | |
;; `---' `-' `----'`-'-'-'`-'  `-----'`-'-'-'
;;
;;-------~---~----------~----------~----
;;
;; last revision: 2013/10/25
;;
;;-------~---~----------~----------~----
;; SOFTWARE VERSIONS
;;-------~---~----------~----------~----
;;
;; +-> sbcl         => 1.1.12
;; | `-> quicklisp
;; |   |-> cl-ppcre => 2.0.4
;; |   `-> clx      => git: 2013/10/03
;; `-> stumpwm      => git: 2013/10/23
;;
;;-------~---~----------~----------~----
;; PATCHES
;;-------~---~----------~----------~----
;;
;; +-> Window-type-override
;; | `-> http://lists.gnu.org/archive/html/stumpwm-devel/2012-07/msg00000.html
;; |   `-> cleaned version that actually applies => http://paste.xinu.at/Hle/
;; |
;; `-> Hex-colors
;;   `-> http://www.mail-archive.com/stumpwm-devel@nongnu.org/msg02640.html
;;     `-> updated version for latest git checkouts => https://paste.xinu.at/uhFdS/
;; 
;;-------~---~----------~----------~----
;; VENDOR LISPS
;;-------~---~----------~----------~----
;;
;; +-> Octantis/gapps.lisp (Useless gaps):
;;   `-> https://gist.github.com/Octantis/5651256
;;
;;-------~---~----------~----------~----
;; THANKS
;;-------~---~----------~----------~----
;;
;; to Milomouse, for his seriously complete
;; configuration:
;; http://dotshare.it/dots/49
;;
;; I've recycled quite a bit from there.
;;
;;-------~---~----------~----------~----

(in-package :stumpwm)

;;-------~---~----------~----------~----
;; Set Directories
;;---~----~-~-------------~---------~---

(setf *home-dir*      (make-pathname :directory (getenv "XDG_CONFIG_HOME"))
      *stump-dir*     (merge-pathnames (make-pathname :directory '(:relative "stumpwm")) *home-dir*)
      *data-dir*      (merge-pathnames (make-pathname :directory '(:relative "storage")) *stump-dir*)
      *load-dir*      (merge-pathnames (make-pathname :directory '(:relative "lisp")) *stump-dir*)
      *undo-data-dir* (make-pathname :directory "/dev/shm/.1009")
      *debug-file*    (merge-pathnames (make-pathname :name "debug") *stump-dir*)
      *scratchpad-group-name* ".scratch")

;;-------~---~----------~----------~----
;; Define Variables
;;---~----~-~-------------~---------~---

;; Change welcome message
(setf *startup-message*
      "Forget Crackers. Polly needs some CRACK! Give Polly some CRACK!")

;; Make run-or-raise act globally instead of current group
(setf *run-or-raise-all-groups* t)

;; URxvt, duh!
(defvar *terminal* "urxvt"
  "Command to start a terminal.")

(defvar *terminal-smallfont* "urxvt -fn xft:Pragmata:size=7"
  "Command to start a terminal with small font.")

;;-------~---~----------~----------~----
;; Appearance
;;---~----~-~-------------~---------~---

;; Colors
(defun color (key) 
  (let ((colors '(:foreground   #xF8F8F2
                  :background-0 #x272822
                  :background-1 #x1C1D19
                  :background-2 #x3B3D34
                  :background-3 #xADAFA1
                  :black        #x37372F
                  :red          #xCC6633
                  :green        #x86A24E
                  :yellow       #xCB9752
                  :blue         #xA49E84
                  :magenta      #xAE81DF
                  :cyan         #x809EA3
                  :white        #x74705D
                  :black-1      #x424238
                  :red-1        #xD6855C
                  :green-1      #x9CB668
                  :yellow-1     #xD8B17D
                  :blue-1       #xBEBAA7
                  :magenta-1    #xD3BAED
                  :cyan-1       #xA0B7BA
                  :white-1      #x8B866F)))
    (getf colors key)))

;; Font
;; (set-font "-misc-fixed-medium-r-normal--8-80-75-75-c-50-iso8859-1")
(set-font "-misc-fixed-medium-r-semicondensed--12-110-75-75-c-60-iso8859-1")

;; Message Bar
(set-fg-color     (color :foreground))
(set-bg-color     (color :background-0))
(set-border-color (color :background-2))

(setf *message-window-padding* 10
      *message-window-gravity* :bottom-right
      *input-window-gravity* :bottom-right)

;; Modeline
; (setf *mode-line-foreground-color* "oldlace"
;       *mode-line-background-color* "dimgray"
;       *mode-line-border-color*     "oldlace")

;; Borders
(setf *maxsize-border-width*   0
      *transient-border-width* 2
      *normal-border-width*    1
      *window-border-style*    :thin)

(set-focus-color   (color :red))
(set-unfocus-color (color :background-2))
(set-win-bg-color  (color :background-0))

;;-------~---~----------~----------~----
;; Keyboard & Mouse
;;---~----~-~-------------~---------~---

(set-prefix-key (kbd "s-,"))

;; Focus follows Mouse
(setq *mouse-focus-policy* :click)

;;-------~---~----------~----------~----
;; Startup
;;---~----~-~-------------~---------~---

;; redefine run-shell-command for 'zsh', change :shell "", and fix a typo.
(defcommand run-shell-command (cmd &optional collect-output-p)
            ((:shell "execute: "))
            "Run the specified shell command. If @var{collect-output-p} is @code{T}
            then run the command synchronously and collect the output."
            (if collect-output-p
              (run-prog-collect-output *shell-program* "-c" cmd)
              (run-prog *shell-program* :args (list "-c" cmd) :wait nil)))
                                                   
(setf *shell-program* (getenv "SHELL"))
(defcommand-alias exec run-shell-command)

;; Run These
(run-shell-command "xsetroot -cursor_name left_ptr")
; (run-shell-command "feh --bg-tile ~/.wall.jpg")
; (run-shell-command "killall dzen.sh")
;(run-shell-command (format nil "~A/stumpwm/dzen/dzen.sh &" (getenv "XDG_CONFIG_HOME")))
; (run-shell-command "bar.sh")

;; Space for dzen
;; (resize-head 0 0 0 1280 800)

;; create given groups while keeping focus on current.
(defmacro make-groups-bg (&rest names)
  (let ((ns (mapcar #'(lambda (n) (concatenate 'string "gnewbg " n)) names)))
    `(run-commands ,@ns)))
   
;; restore data from previous exit (state StumpWM was last using),
(clear-window-placement-rules)
(setf (group-name
        (first
          (screen-groups (current-screen)))) "main")
(make-groups-bg "web")
(if (probe-file (data-dir-file "desktop.lisp"))
  (restore-from-file (data-dir-file "desktop.lisp")))
;; (restore-window-placement-rules (data-dir-file "tile-rules.lisp"))
(cond ((string-equal (group-name (current-group)) *scratchpad-group-name*) (gother)))

;;-------~---~----------~----------~----
;; Load
;;---~----~-~-------------~---------~---

(setq *useless-gaps-size* 1)
(setq *useless-gaps-on* t)

(load (merge-pathnames (make-pathname :name "gaps" :type "lisp"
                                      :directory '(:relative "vendor")) *load-dir*))

(loop for file in '("commands"
                    "functions"
                    "hooks"
                    "keymap"
                    "remember"
                    "websearch"
                    "window_rules")
      do (load (merge-pathnames (make-pathname :name file :type "lisp"
                                               :directory '(:relative "my")) *load-dir*)))
