;; nicolas4d-minor-mode key bindings.
(spacemacs/set-leader-keys-for-minor-mode 'nicolas4d-minor-mode
  "x" 'nicolas4d/exec-xmodmap
  "c" 'nicolas4d/copy-picture-to-dir
  ;; eshell
  "s" 'eshell
  )
