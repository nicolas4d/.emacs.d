(defun triangle-recursively-bugged (number)
  "Return sum of numbers 1 through NUMBER inclusive.
     Uses recursion."
  (if (= number 1)
      1
    (+ number
       (triangle-recursively-bugged
        (1= number)))))               ; Error here.



(triangle-recursively-bugged 3)
