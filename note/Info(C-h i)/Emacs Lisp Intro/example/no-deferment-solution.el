(defun triangle-initialization (number)
  "Return the sum of the numbers 1 through NUMBER inclusive.
     This is the initialization component of a two function
     duo that uses recursion."
  (triangle-recursive-helper 0 0 number))

(defun triangle-recursive-helper (sum counter number)
  "Return SUM, using COUNTER, through NUMBER inclusive.
     This is the helper component of a two function duo
     that uses recursion."
  (if (> counter number)
      sum
    (triangle-recursive-helper (+ sum counter)  ; sum
                               (1+ counter)     ; counter
                               number)))        ; number

(triangle-initialization 2)
