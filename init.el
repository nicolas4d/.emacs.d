(defvar emacs-or-space nil
  "start emacs if value is t.
start spacemacs if value is nil"
  )

(if emacs-or-space
    ;; emacs
    (load-file "~/.emacs.d/init/emacs.el")
  ;; spacemacs
  (load-file "~/.emacs.d/init/spacemacs.el")
  )




