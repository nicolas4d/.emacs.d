;; cask
(require 'cask "/home/d/.cask/cask.el")
(cask-initialize)

;;; pallet
(package-install 'pallet)

(require 'pallet)
(pallet-mode t)
;;; pallet ends here

(defvar emacs-or-space nil
  "emacs if value is t.
spacemacs if value is nil"
  )

;; load configurations
(if emacs-or-space
    ;; emacs
    (load-file (concat user-emacs-directory "init/emacs.el"))
  ;; spacemacs
  (load-file (concat user-emacs-directory "init/spacemacs.el"))
)
