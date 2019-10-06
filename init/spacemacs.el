;; use cask elpa
(setq elpa-of-cask
      (concat "~/.emacs.d/.cask/"
	      (number-to-string emacs-major-version)
	      "."
	      (number-to-string emacs-minor-version)
	      "/elpa")
      
      package-user-dir
      elpa-of-cask
      )

;; Get a name-list of installed packages.
;; used by spacemacs init.el
(package-initialize)
(setq name-list-package '())
(when package-alist
  (dolist (package package-alist)
    (push (car package) name-list-package))
  name-list-package)

;; spacemacs config start
(setq spacemacs-start-directory "~/.emacs.d/spacemacs/")
(load-file (concat spacemacs-start-directory "init.el"))
