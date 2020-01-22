(spacemacs/set-leader-keys
  ;; project open
  "pf" 'nicolas4d/open-file-with-projectile-or-counsel-git

  ;; occur
  "so" 'occur-dwim
  )

(define-key dired-mode-map (kbd "r") 'dired-up-directory)
