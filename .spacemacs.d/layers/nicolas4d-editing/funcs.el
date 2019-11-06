;;; indent
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))
;;; indent ends here

(defun copy-region-or-delete-backward()
  (interactive)
  (if mark-active
      (kill-ring-save 0 0 t)
    (hungry-delete-backward 1)
    )
  )
