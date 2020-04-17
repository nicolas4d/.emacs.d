(keyboard-translate ?\C-h ?\C-?)

(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-m") 'set-mark-command)
(global-set-key (kbd "C-<tab>") 'spacemacs/alternate-buffer)
(global-set-key (kbd "M-x") nil)
(global-set-key (kbd "M-x") 'kmacro-call-macro)
(global-set-key (kbd "C-M-k") 'kill-paragraph)
(global-set-key (kbd "C-j") 'end-of-line-and-new-line-and-indent)
(global-unset-key (kbd "C-<SPC>"))
(define-key dired-mode-map (kbd "r") 'dired-do-rename)

(spacemacs/set-leader-keys
  ;; layout
  "<tab>" 'spacemacs/jump-to-last-layout

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

  ;; file
  "fw" 'find-website-file
  "fm" 'find-miscellaneous
  "fel" 'find-layers
  "fs" 'nil
  "fse" 'find-sis-event
  "fsc" 'find-ssr-cinfig

  ;; info
  "ho" 'info
  )
