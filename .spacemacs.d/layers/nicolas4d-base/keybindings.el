(spacemacs/set-leader-keys
  ;; project open
  "pf" 'nicolas4d/open-file-with-projectile-or-counsel-git

  ;; occur
  "od" 'occur-dwim

  ;; find website.org
  "fw" 'find-website-file
  )

(spacemacs/set-leader-keys-for-major-mode 'prog-mode
  ;; imenu
  "ji" 'counsel-imenu
  )
