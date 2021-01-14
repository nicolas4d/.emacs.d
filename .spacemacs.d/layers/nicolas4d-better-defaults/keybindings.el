(global-set-key (kbd "C-w") 'spacemacs/backward-kill-word-or-region)

(define-key dired-mode-map (kbd "f") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "SPC") 'nicolas4d/toggle-dired-dwim-target)
