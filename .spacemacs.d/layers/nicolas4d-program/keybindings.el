(require 'yasnippet)

;; load yasnippet-snippet
(yas-reload-all)

;;auto-yasnippet
(global-set-key (kbd "C-c d w") #'aya-create)
(global-set-key (kbd "C-c d y") #'aya-expand)

;; yasnippet
(define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)

(spacemacs/set-leader-keys-for-minor-mode 'yas/minor-mode
;;  dotspacemacs-major-mode-leader-key 'prog-mode
  "yi" 'yas/insert-snippet
  "yc" 'yas/new-snippet
  "yt" 'yas/describe-tables
  )





;;web-mode indent
(with-eval-after-load 'web-mode
  (define-key web-mode-map (kbd "C-c t i") 'my-toggle-web-indent)
  )
