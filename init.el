(require 'cask "/home/d/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)


(defvar emacs-or-space nil
  "emacs if value is t.
spacemacs if value is nil"
  )

(if emacs-or-space
    ;; emacs
    (load-file "~/.emacs.d/init/emacs.el")
  ;; spacemacs
  (load-file "~/.emacs.d/init/spacemacs.el")
)
