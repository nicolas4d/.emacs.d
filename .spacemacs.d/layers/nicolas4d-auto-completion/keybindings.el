(require 'yasnippet)

(setq yas/root-directory
      (list (concat user-emacs-directory "snippets")))

;; yasnippet
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)

(spacemacs/set-leader-keys-for-minor-mode 'yas/minor-mode
  "yi" 'yas-insert-snippet
  "yn" 'yas-new-snippet
  "yt" 'yas-describe-tables
  )


;; Hippie
(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))
