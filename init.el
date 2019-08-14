(package-initialize)

(require 'org-install)
(require 'ob-tangle)
;; org 文件名不可以是init.org
(org-babel-load-file (expand-file-name "init-org.org" user-emacs-directory))
