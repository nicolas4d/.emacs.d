(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "p" 'org-previous-visible-heading
  "n" 'org-next-visible-heading
  "u" 'outline-up-heading
  "t" 'org-todo
  "l" 'org-insert-link
  "o" 'org-open-at-point
  "l" nil
  "lt" 'org-toggle-latex-fragment
  )

(spacemacs/set-leader-keys
  "oa" 'org-agenda
  )

;; unset keys
(define-key org-mode-map (kbd "C-<tab>") nil)
