;; nicolas4d-minor-mode key bindings.
(spacemacs/set-leader-keys-for-minor-mode 'nicolas4d-minor-mode
  "xm" 'nicolas4d/exec-xmodmap
  "ym" 'tellme-new-snippet
  "se" 'eshell
  "sm" 'man
  "cd" 'calendar
  "mr" 'rmail

  ;; file
  "fw" 'find-website-file
  "fm" 'find-miscellaneous
  "fel" 'find-layers
  "fse" 'find-sis-event
  "fsc" 'find-ssr-cinfig
  "fc" 'nicolas4d/copy-picture-to-dir

  "y" 'youdao-dictionary-search-at-point
  )
