;;; packages.el --- nicolas4d-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: d <d@d-c>
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
;; added to `nicolas4d-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `nicolas4d-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `nicolas4d-org/pre-init-PACKAGE' and/or
;;   `nicolas4d-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst nicolas4d-org-packages
  '(org)
  "The list of Lisp packages required by the nicolas4d-org layer.

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

(defun nicolas4d-org/post-init-org()
  (use-package org
    :config
    (progn
      ;;capture templates
      (setq org-capture-templates
            '(("t" "Todo" entry (file+headline "~/emacs/gtd.org" "工作安排")
               "* TODO [#B] %?\n  %i\n"
               :empty-lines 1)))

      ;;org-pomodoro
      (set-language-environment "UTF-8")

      (with-eval-after-load 'org
        ;; Org 模式相关设定
        (require 'org-pomodoro)
        )
      
      (setq
       org-file-apps (append '(("\\.jpg\\'" . "google-chrome-stable %s"))
                             '(("\\.png\\'" . "google-chrome-stable %s"))
                             org-file-apps
                             )
       org-agenda-files '("~/emacs/.org")
       org-return-follows-link t
       )

      ;; cdlatex
      (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
      (add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode
      (add-hook 'org-mode-hook 'turn-on-cdlatex)

      ;;keybindings
      (global-set-key (kbd "C-c r") 'org-capture)
      (global-set-key "\C-c L" 'org-insert-link-global)
      (global-set-key "\C-c o" 'org-open-at-point-global)
      (define-key org-mode-map (kbd "C-c l") 'org-insert-link)
      (define-key org-mode-map (kbd "C-c t") 'org-todo)
      (define-key org-mode-map (kbd "C-c n") 'org-next-visible-heading)
      (define-key org-mode-map (kbd "C-c p") 'org-previous-visible-heading)
      (define-key org-mode-map (kbd "C-c u") 'outline-up-heading)
      (define-key org-mode-map (kbd "C-<tab>") nil)

      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "p" 'org-previous-visible-heading
        "n" 'org-next-visible-heading
        "u" 'outline-up-heading
        "t" 'org-todo
        "l" 'org-insert-link
        )

      (spacemacs/set-leader-keys
        "oa" 'org-agenda
        )
)))
;;; packages.el ends here
