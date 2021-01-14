(spacemacs/set-leader-keys
  ;; project open
  "pf" 'find-file-with-projectile-or-counsel-git

  ;; occur
  "so" 'occur-dwim
  )

(define-key dired-mode-map (kbd "b") 'dired-up-directory)
(define-key dired-mode-map (kbd "e") 'spacemacs/open-file-or-directory-in-external-app)
