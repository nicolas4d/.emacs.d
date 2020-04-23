;;; packages.el --- nicolas4d-test-layout-1 layer packages file for Spacemacs.
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
;; added to `nicolas4d-test-layout-1-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `nicolas4d-test-layout-1/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `nicolas4d-test-layout-1/pre-init-PACKAGE' and/or
;;   `nicolas4d-test-layout-1/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst nicolas4d-test-layout-1-packages
  '(abc-mode)
  "The list of Lisp packages required by the nicolas4d-test-layout-1 layer.

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

(defun nicolas4d-test-layout-1/pre-abc-mode ()
  (with-eval-after-load 'abc-mode
    (message "nicolas4d-test-layout-1 package.el nicolas4d-test-layout-1/pre-abc-mode")
    )

  (use-package abc-mode
    :init
    :config
    (with-eval-after-load 'abc-mode
      (message "nicolas4d-test-layout-1 package.el use-package nicolas4d-test-layout-1/pre-abc-mode")
      )
    )
  )

(defun nicolas4d-test-layout-1/init-abc-mode ()
  (use-package abc-mode
    :init
    :config
    (message "nicolas4d-test-layout-1 package.el nicolas4d-test-layout-1/init-abc-mode")
    ))

(advice-add 'nicolas4d-test-layout-1/init-abc-mode :before #'nicolas4d-test-layout-1/pre-abc-mode)


(message "nicolas4d-test-layout-1 package.el")
