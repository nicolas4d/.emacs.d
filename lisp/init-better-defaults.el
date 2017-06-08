(global-linum-mode t)

(global-auto-revert-mode t)

(setq ring-bell-function 'ignore)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("n4d" "nicolas4d")
					    ;; emacs regex
					    ))

(setq make-backup-file nil)
(auto-save-mode nil)

(recentf-mode t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(set-default-font "-outline-幼圆-normal-normal-normal-mono-16-*-*-*-c-*-ascii-0")

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

(provide 'init-better-defaults)
