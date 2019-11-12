;; yasnippet
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)

(spacemacs/set-leader-keys-for-minor-mode 'yas/minor-mode
  "yi" 'yas-insert-snippet
  "yn" 'yas-new-snippet
  "yt" 'yas-describe-tables
  )

;;; yasnippet ends here

