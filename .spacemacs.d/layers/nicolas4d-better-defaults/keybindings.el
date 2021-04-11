(global-set-key (kbd "C-w") 'spacemacs/backward-kill-word-or-region)

(define-key dired-mode-map (kbd "f") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "SPC") 'nicolas4d/toggle-dired-dwim-target)
(define-key dired-mode-map (kbd "r") 'dired-do-rename)

(evil-define-key 'normal dired-mode-map
  "e" 'spacemacs/open-file-or-directory-in-external-app
  "r" 'dired-do-rename
  "f" 'dired-find-alternate-file
  "v" 'nicolas4d/toggle-dired-dwim-target
  "o" 'dired-find-file-other-window
  "s" 'dired-sort-toggle-or-edit
  "i" 'nicolas4d/do-nothing
  )
