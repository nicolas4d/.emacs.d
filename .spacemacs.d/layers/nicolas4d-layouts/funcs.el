;;layout
(defun nicolas4d/load-my-layouts()
  (interactive)
  (persp-load-state-from-file (concat persp-save-dir "d-layout")))

(defun nicolas4d/save-my-layouts ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "d-layout")))
