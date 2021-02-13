;; (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                          ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(defvar emacs-or-space nil
  "emacs if value is t.
spacemacs if value is nil"
  )

;; load configurations
(if emacs-or-space
    ;; emacs
    (load-file (concat user-emacs-directory "init/emacs.el"))
  ;; spacemacs
  (load-file (concat user-emacs-directory "init/spacemacs.el")))
