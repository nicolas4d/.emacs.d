;; nicolas4d-minor-mode key bindings.
(spacemacs/set-leader-keys-for-minor-mode 'nicolas4d-minor-mode
  "xm" 'nicolas4d/exec-xmodmap
  "fc" 'nicolas4d/copy-picture-to-dir
  "ym" 'tellme-new-snippet
  "se" 'eshell
  "sm" 'man
  "cd" 'calendar
  "mr" 'rmail
  )
