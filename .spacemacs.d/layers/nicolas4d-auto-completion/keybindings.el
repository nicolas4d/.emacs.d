;;; yasnippet
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)

(spacemacs/set-leader-keys
  ;; yasnippet
  "yi" 'yas-insert-snippet
  "yn" 'yas-new-snippet
  "yt" 'yas-describe-tables
  "yv" 'yas-visit-snippet-file
  "yo" 'yas-tryout-snippet
  "yr" 'yas-reload-all

  ;; auto-yasnippet
  "yac" #'aya-create
  "yae" #'aya-expand
  )
