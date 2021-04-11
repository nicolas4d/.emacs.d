(setq layouts-enable-autosave nil)

;; advice
(advice-add 'save-buffers-kill-terminal :before #'nicolas4d/save-all-layouts)
(advice-add 'dotspacemacs/user-config :after #'nicolas4d/define-custom-layouts)
