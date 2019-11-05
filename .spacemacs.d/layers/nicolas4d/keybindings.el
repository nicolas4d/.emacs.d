;;layout
(spacemacs/set-leader-keys "dll" 'nicolas4d/load-my-layout)
(spacemacs/set-leader-keys "dls" 'nicolas4d/save-my-layout)

;;porject open
(spacemacs/set-leader-keys "pf" 'nicolas4d/open-file-with-projectile-or-counsel-git)

(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "C-<tab>") 'spacemacs/alternate-buffer)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-w") 'copy-region-or-delete-backward)


;; indent
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
