(defun nicolas4d/org-source-indent ()
  "Indent source resion."
  (interactive)
  (org-edit-special)
  (indent-region-or-buffer)
  (end-of-buffer)
  (newline-and-indent)
  (org-edit-src-exit))
