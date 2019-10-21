(load-file "~/.emacs.d/init/ui.el")
(load-file "~/.emacs.d/init/better-defaults.el")
(load-file "~/.emacs.d/init/funcs.el")
(load-file "~/.emacs.d/init/spacemacs-funcs.el")
(load-file "~/.emacs.d/init/org.el")
(load-file "~/.emacs.d/init/keybindings.el")

(setq custom-file (expand-file-name "~/.emacs.d/init/custom.el" default-directory))
(load custom-file 'no-error 'no-message)

;;; buckup org babel config
;;(require 'org-install)
;;(require 'ob-tangle)
;;org 文件名不可以是init.org
;;(org-babel-load-file (expand-file-name "~/.emacs.d/init/orgemacs.org" user-emacs-directory))
