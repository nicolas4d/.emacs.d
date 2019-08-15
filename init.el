(require 'cask "~/.cask/cask.el")
(cask-initialize)   

(require 'pallet)
(pallet-mode t)  

(require 'org-install)
(require 'ob-tangle)
;; org 文件名不可以是init.org
(org-babel-load-file (expand-file-name "init-org.org" user-emacs-directory))
