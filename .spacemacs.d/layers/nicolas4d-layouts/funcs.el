;;layout
(defun* nicolas4d/load-my-layouts()
  (interactive)
  (persp-load-state-from-file (concat persp-save-dir "d-layout")
                              *persp-hash*
                              names-regexp
                              set-persp-file)
  )

(defun nicolas4d/save-my-layouts ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "d-layout")))

(defun* nicolas4d/save-all-layouts (&optional ARG)
  "save all layouts"
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "d")))
