
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
;; add more personal require
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybinddings)

(setq custom-file (expand-file-name "~/.emacs.d/lisp/custom.el" user-emacs-directory))
(load-file custom-file)
