(defun great-or-less-then-fill-column(&optional arg)
  "compare with fill-column"
  (interactive "P")
  (if (> (prefix-numeric-value arg) fill-column)
      (message "number > fill-column")
    (message "number < fill-column")))

(great-or-less-then-fill-column 1)
(great-or-less-then-fill-column 100)
(great-or-less-then-fill-column)
