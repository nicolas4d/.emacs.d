;; nicolas4d-minor-mode key bindings.
(spacemacs/set-leader-keys-for-minor-mode 'nicolas4d-minor-mode
  "<SPC> x" 'nicolas4d/exec-xmodmap
  "<SPC> c" 'nicolas4d/copy-picture-to-dir

  ;; eshell
  "<SPC> s" 'eshell
  )