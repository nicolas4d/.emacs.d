(global-linum-mode t)

(global-auto-revert-mode t)

(setq ring-bell-function 'ignore)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("n4d" "nicolas4d")
					    ;; emacs regex
					    ))

(setq make-backup-files nil)
(auto-save-mode nil)

(recentf-mode t)

;; fix show-paren-mode
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

;; program code indent config
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
	(message "Indent buffer.")))))

;; hippie expand
(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)

;; dired
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; unique buffer
(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)

;; hide ^M in html
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

;; remove ^M in html
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; occur   do what I mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

;;coding system
(set-language-environment "UTF-8")
;;(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(set-clipboard-coding-system 'utf-8)
;;(set-buffer-file-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(modify-coding-system-alist 'process "*" 'utf-8)


(provide 'init-better-defaults)
