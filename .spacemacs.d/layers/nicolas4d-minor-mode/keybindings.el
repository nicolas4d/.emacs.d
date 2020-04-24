;; nicolas4d-minor-mode key bindings.
(spacemacs/set-leader-keys-for-minor-mode 'nicolas4d-minor-mode
  "xm" 'nicolas4d/exec-xmodmap
  "fc" 'nicolas4d/copy-picture-to-dir
  "ym" 'tellme-new-snippet
  "es" 'eshell
  "cd" 'calendar
  "ft" 'nicolas4d/trash-empty)
