;; nicolas4d-minor-mode key bindings.
(spacemacs/set-leader-keys-for-minor-mode 'nicolas4d-minor-mode
  "xm" 'nicolas4d/exec-xmodmap
  "ydc" 'dc-yasnippet-new-snippet
  "se" 'eshell
  "sm" 'man
  "cd" 'calendar
  "mr" 'rmail

  ;; file
  "fw" 'find-website-file
  "fel" 'find-layers
  "fse" 'find-sis-event
  "fsc" 'find-ssr-cinfig
  "fm" 'find-miscellaneous
  "fc" 'nicolas4d/copy-picture-to-dir
  "fdc" 'find-dc-yasnippet

  "db" 'docbook-find-file
  )
