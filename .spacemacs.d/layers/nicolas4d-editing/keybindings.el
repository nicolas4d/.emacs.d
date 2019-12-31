(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-w") 'copy-region-or-delete-backward)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(spacemacs/set-leader-keys
  ;; iedit
  "ei" 'iedit-mode
  )
