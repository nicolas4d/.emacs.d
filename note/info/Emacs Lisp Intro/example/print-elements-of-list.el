(setq animals '(gazelle giraffe lion tiger))

(defun print-elements-of-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (print (car list))
    (setq list (cdr list))))

(print-elements-of-list animals)



(setq animals '(gazelle giraffe lion tiger))

(defun print-elements-recursively (list)
  "Print each element of LIST on a line of its own.
     Uses recursion."
  (when list                            ; do-again-test
    (print (car list))              ; body
    (print-elements-recursively     ; recursive call
     (cdr list))))                  ; next-step-expression

(print-elements-recursively animals)


gazelle

giraffe

lion

tiger
nil
