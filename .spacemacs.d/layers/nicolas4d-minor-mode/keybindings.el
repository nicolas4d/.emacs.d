;; nicolas4d-minor-mode key bindings.
(spacemacs/set-leader-keys-for-minor-mode 'nicolas4d-minor-mode
  "dx" 'nicolas4d/exec-xmodmap
  "dc" 'nicolas4d/copy-picture-to-dir
  "dt" 'tellme-new-snippet
  )
