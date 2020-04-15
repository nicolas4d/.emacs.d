(defun square-numbers (number-of-rows)
  "square of each row number"
  (let ((row-number 1))
    (while (<= row-number number-of-rows)
      (print (* row-number row-number))
      (setq row-number (1+ row-number))
      )
    )
  )

(square-numbers 3)

(defun square-numbers-recursive (number)
  (if (= 0 number)
      nil
    (print (* number number))
    (square-numbers-recursive (- number 1))))

(square-numbers-recursive 2)

(defun square-numbers-recursive-cond (number)
  (cond
   ((= 0 number) t)
   ((< 0 number)
    (print (* number number))
    (square-numbers-recursive-cond (- number 1)))))

(square-numbers-recursive-cond 2)

(defun add-value(number)
  "add value of number.
1 to each number"
  (let ((cur-number 1)
        (total 0))
    (while (<= cur-number number)
      (setq total (+ total cur-number))
      (setq cur-number (1+ cur-number)))
    total))

(add-value 3)

(defun add-value-recursive (number)
  (let ((total 0))
    (if (> number 0)
        (progn
          ;;(print number)
          (setq total (+ total number (add-value-recursive (- number 1))))))
          ;;(setq total (+ total number))
          ;;(setq total (+ total (add-value-recursive (- number 1))))))
    total))

(add-value-recursive 3)

(defun add-value-recursive-cond (number)
  (let ((total 0))
    (cond
     ((< number 0) nil)
     ((> number 0)
      (setq total (+ total number (add-value-recursive-cond (- number 1))))))
    total))

(add-value-recursive-cond 3)
