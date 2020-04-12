;;; packages.el --- nicolas4d-python layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: nicolas4d <nicolas4d@foxmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `nicolas4d-layer-template-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `nicolas4d-layer-template/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `nicolas4d-layer-template/pre-init-PACKAGE' and/or
;;   `nicolas4d-layer-template/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst nicolas4d-python-packages
  '()
  ;; '(python :location built-in)
  "The list of Lisp packages required by the nicolas4d-layer-template layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


;;; packages.el ends here

(defun nicolas4d-python/post-init-python()
  (use-package python
    :config
    (defun python-default ()
      (setq mode-name "Python"
            tab-width python-tab-width
            fill-column python-fill-column)
      (when (version< emacs-version "24.5")
        ;; auto-indent on colon doesn't work well with if statement
        ;; should be fixed in 24.5 and above
        (setq electric-indent-chars (delq ?: electric-indent-chars)))
      (setq-local comment-inline-offset 2)
      (spacemacs/python-annotate-pdb)
      (local-set-key (kbd "C-j") 'end-of-line-and-new-line-and-indent))
    ))
