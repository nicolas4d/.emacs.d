(defun recursive-graph-body-print (numbers-list)
"Print a bar graph of the NUMBERS-LIST.
     The numbers-list consists of the Y-axis values."
(let ((height (apply 'max numbers-list))
      (symbol-width (length graph-blank))
      from-position)
  (recursive-graph-body-print-internal
   numbers-list
   height
   symbol-width)))

(defun recursive-graph-body-print-internal
    (numbers-list height symbol-width)
  "Print a bar graph.
     Used within recursive-graph-body-print function."

  (when numbers-list
    (setq from-position (point))
    (insert-rectangle
     (column-of-graph height (car numbers-list)))
    (goto-char from-position)
    (forward-char symbol-width)
    (sit-for 0)     ; Draw graph column by column.
    (recursive-graph-body-print-internal
     (cdr numbers-list) height symbol-width)))

(recursive-graph-body-print '(3 2 5 6 7 5 3 4 6 4 3 2 1))
    *        
   **   *    
  ****  *    
  **** ***   
* *********  
************ 
*************
