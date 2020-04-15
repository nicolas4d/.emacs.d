(defun triangle (number-of-rows)    ; Version with
                                        ;   incrementing counter.
  "Add up the number of pebbles in a triangle.
     The first row has one pebble, the second row two pebbles,
     the third row three pebbles, and so on.
     The argument is NUMBER-OF-ROWS."
  (let ((total 0)
        (row-number 1))
    (while (<= row-number number-of-rows)
      (setq total (+ total row-number))
      (setq row-number (1+ row-number)))
    total))

(triangle 4)

(triangle 7) 

(defun triangle (number)                ; Second version.
  "Return sum of numbers 1 through NUMBER inclusive."
  (let ((total 0))
    (while (> number 0)
      (setq total (+ total number))
      (setq number (1- number)))
    total))

