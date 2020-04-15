(defun display-first-60-character()
  "display first 60 charactors
   even if narrowed"
  (interactive)
  (save-restriction
    (widen)
    (save-excursion
      (let ((point-max (max-60)))
        (buffer-substring (point-min) point-max)))))

(display-first-60-character)

(defun max-60()
    (if (> (point-max) 60)
        60
      (point-max)))

(max-60)
