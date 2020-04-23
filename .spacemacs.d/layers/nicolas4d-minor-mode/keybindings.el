;; nicolas4d-minor-mode key bindings.
(spacemacs/set-leader-keys-for-minor-mode 'nicolas4d-minor-mode
  "SPC x" 'nicolas4d/exec-xmodmap
  "SPC fc" 'nicolas4d/copy-picture-to-dir
  "SPC t" 'tellme-new-snippet
  "SPC s" 'eshell
  "SPC c" 'calendar
  )
