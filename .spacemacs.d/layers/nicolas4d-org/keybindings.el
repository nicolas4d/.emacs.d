(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "p" 'org-previous-visible-heading
  "n" 'org-next-visible-heading
  "u" 'outline-up-heading
  "t" 'org-todo
  "o" 'org-open-at-point
  "l" nil
  "l" 'org-toggle-latex-fragment
  "si" 'nicolas4d/org-source-indent
  "fa" 'org-footnote-action
  "Tnpp" 'nicolas4d/toggle-notify-picture-dir-add-file
  "Tnpv" 'nicolas4d/toggle-notify-bind-buffer
  )

(spacemacs/set-leader-keys
  "oa" 'org-agenda
  "of" 'org-cycle-agenda-files
  )

;; unset keys
(define-key org-mode-map (kbd "C-<tab>") nil)
