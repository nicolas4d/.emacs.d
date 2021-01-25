(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-m") 'set-mark-command)
(global-set-key (kbd "C-<tab>") 'spacemacs/alternate-buffer)
(global-set-key (kbd "M-=") 'kmacro-call-macro)
(global-set-key (kbd "C-M-k") 'kill-paragraph)
(global-set-key (kbd "C-j") 'end-new-line-indent)
(global-unset-key (kbd "C-<SPC>"))
(define-key dired-mode-map (kbd "r") 'dired-do-rename)

;; downcase lowercase
(unbind-key (kbd "M-l"))
(global-set-key (kbd "M-l l") 'downcase-word)
(global-set-key (kbd "M-l c") 'string-inflection-lower-camelcase)

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

  "ho" 'info

  "y" 'youdao-dictionary-search-at-point
  )
