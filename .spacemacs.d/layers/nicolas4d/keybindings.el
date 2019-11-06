(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "C-<tab>") 'spacemacs/alternate-buffer)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-w") 'copy-region-or-delete-backward)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(spacemacs/set-leader-keys
  ;; youdao
  "y" 'youdao-dictionary-search-at-point

  ;; layout
  "dll" 'nicolas4d/load-my-layout
  "dls" 'nicolas4d/save-my-layout

  ;; project open
  "pf" 'nicolas4d/open-file-with-projectile-or-counsel-git

  ;; kmacro
  "ms" 'kmacro-start-macro
  "me" 'kmacro-end-macro
  "mc" 'kmacro-call-macro
  "md" 'kmacro-edit-macro
  "mv" 'kmacro-view-macro
  "mrn" 'kmacro-cycle-ring-next
  "mrp" 'kmacro-cycle-ring-previous

  ;; iedit
  "di" 'iedit-mode
  "do" 'occur-mode

  ;; find website.org
  "fw" 'find-website-file
  )

