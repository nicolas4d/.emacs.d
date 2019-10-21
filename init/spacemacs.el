(setq name-list-package '())

(when package-alist
  (dolist (package package-alist)
    (push (car package) name-list-package))
  name-list-package)

;; spacemacs config start
(setq spacemacs-start-directory "~/.emacs.d/spacemacs/")
(load-file (concat spacemacs-start-directory "init.el"))
