;;; packages.el --- nicolas4d-misc layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
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
;; added to `nicolas4d-misc-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `nicolas4d-misc/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `nicolas4d-misc/pre-init-PACKAGE' and/or
;;   `nicolas4d-misc/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst nicolas4d-misc-packages
  '(
    w3m
    html2org
    autodisass-java-bytecode
    vue-html-mode
    vue-mode
    )
  "The list of Lisp packages required by the nicolas4d-misc layer.

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

(defun nicolas4d-misc/init-w3m ()
  (use-package w3m
    :defer t
    :init
    ))

(defun nicolas4d-misc/init-html2org ()
  (use-package html2org
    :defer t
    :init
    ))

(defun nicolas4d-misc/init-autodisass-java-bytecode ()
  (use-package autodisass-java-bytecode
    :defer t
    :init
    ))

(defun nicolas4d-misc/init-vue-html-mode ()
  (use-package vue-html-mode
    :defer t
    :init
    ))

(defun nicolas4d-misc/init-vue-mode ()
  (use-package vue-mode
    :defer t
    :init
    ))

;;; packages.el ends here
