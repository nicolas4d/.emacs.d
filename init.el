;; init file for windows, .emacs.d\init.el not work

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "nicolas4d.org" user-emacs-directory))

;; 什么玩意儿 不知道
;;(put 'narrow-to-region 'disabled nil)
;;(put 'narrow-to-page 'disabled nil)

;; autoload test
;;(autoload 'test-autoload "autoloadtest")
;;(test-autoload)

;;(update-file-autoloads "~/.emacs.d/lisp/autoloadtest.el" t "~/.emacs.d/lisp/autoloadtest-autoload.el")
;;(load "autoloadtest-autoload")
;;(test-autoload)
