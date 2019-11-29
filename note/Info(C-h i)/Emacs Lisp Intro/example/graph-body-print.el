(defun graph-body-print (numbers-list)
  "Print a bar graph of the NUMBERS-LIST.
     The numbers-list consists of the Y-axis values."

  (let ((height (apply 'max numbers-list))
        (symbol-width (length graph-blank))
        from-position)

    (while numbers-list
      (setq from-position (point))
      (insert-rectangle
       (column-of-graph height (car numbers-list)))
      (goto-char from-position)
      (forward-char symbol-width)
      ;; Draw graph column by column.
      (sit-for 0)
      (setq numbers-list (cdr numbers-list)))
    ;; Place point for X axis labels.
    (forward-line height)
    (insert "\n")
    ))
(graph-body-print '(1 2 3 4 6 4 3 5 7 6 5 2 3))

        *    
    *   **   
    *  ****  
   *** ****  
  ********* *
 ************
*************
