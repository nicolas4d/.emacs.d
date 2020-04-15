(setq y 2) 2

(let* ((y 1)
       (z y))    ; Use the just-established value of ‘y’.
  (list y z)) (1 1)
