;; backspace to C-h
(keyboard-translate ?\C-h ?\C-?)

(setq
 auto-save-default nil
 make-backup-files nil)

(nicolas4d-minor-mode t)
(delete-selection-mode t)

(advice-add 'dotspacemacs/user-config :after #'nicolas4d/user-config)

(put 'narrow-to-page 'disabled nil)

(electric-pair-mode 1)
