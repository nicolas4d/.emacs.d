(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-m") 'set-mark-command)
(global-set-key (kbd "C-r") 'repeat)
(global-set-key (kbd "C-<tab>") 'spacemacs/alternate-buffer)
(global-set-key (kbd "M-c") 'kmacro-call-macro)
(global-set-key (kbd "C-M-k") 'kill-paragraph)

(spacemacs/set-leader-keys
  ;; kmacro
  "ms" 'kmacro-start-macro
  "me" 'kmacro-end-macro
  "mc" 'kmacro-call-macro
  "md" 'kmacro-edit-macro
  "mv" 'kmacro-view-macro
  "mrn" 'kmacro-cycle-ring-next
  "mrp" 'kmacro-cycle-ring-previous

  ;; buffer
  "bl" 'list-buffers

  ;; eshell
  "se" 'eshell

  ;; file
  "f SPC w" 'find-website-file
  "f SPC m" 'find-miscellaneous
  )
