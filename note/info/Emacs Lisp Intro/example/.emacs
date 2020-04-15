;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;; Text mode and Auto Fill mode
;; The next two lines put Emacs into Text mode
;; and Auto Fill mode, and are for writers who
;; want to start writing prose rather than code.

(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq colon-double-space t)

;;; Mail mode
; To enter mail mode, type 'C-x m'
; To enter RMAIL (for reading mail),
; type 'M-x rmail'
(setq mail-aliases t)

;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

;;; Compare windows
(global-set-key "\C-cw" 'compare-windows)

;;; Keybinding for 'occur'
; I use occur a lot, so let's bind it to a key:
(global-set-key "\C-co" 'occur)

;;; Unbind 'C-x f'
;(global-unset-key "\C-xf")

;;; Rebind 'C-x C-b' for 'buffer-menu'
(global-set-key "\C-x\C-b" 'buffer-menu)

(defun texinfo-insert-@group ()
  "Insert the string @group in a Texinfo buffer."
  (interactive)
  (beginning-of-line)
  (insert "@group\n"))

;;(define-key texinfo-mode-map "\C-c\C-cg" 'texinfo-insert-@group)

;;(load "~/emacs/slowsplit")

(autoload 'html-helper-mode
  "html-helper-mode" "Edit HTML documents" t)

     ;;; Line to top of window;
     ;;; replace three keystroke sequence  C-u 0 C-l
(defun line-to-top-of-window ()
  "Move the line point is on to top of window."
  (interactive)
  (recenter 0))

;; Set cursor color
(set-cursor-color "white")

;; Set mouse color
(set-mouse-color "white")

;; Set foreground and background
(set-foreground-color "white")
(set-background-color "darkblue")

     ;;; Set highlighting colors for isearch and drag
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")

(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")

(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;; Set calendar highlighting colors
(add-hook 'calendar-load-hook
          (lambda ()
            (set-face-foreground 'diary-face   "skyblue")
            (set-face-background 'holiday-face "slate blue")
            (set-face-foreground 'holiday-face "white")))

;; Translate 'C-h' to <DEL>.
; (keyboard-translate ?\C-h ?\C-?)

;; Translate <DEL> to 'C-h'.
; (keyboard-translate ?\C-? ?\C-h)

