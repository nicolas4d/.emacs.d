(defun recursive-lengths-list-many-files (list-of-files)
  "Return list of lengths of each defun in LIST-OF-FILES."
  (if list-of-files                     ; do-again-test
      (append
       (lengths-list-file
        (expand-file-name (car list-of-files)))
       (recursive-lengths-list-many-files
        (cdr list-of-files)))))


(lengths-list-file "./add-elements.el")
(19)

(lengths-list-file "./count-words-example-with-bugs.el")
(109)

(lengths-list-file "./forward-sentence.el")
(117)

(recursive-lengths-list-many-files
 '("./forward-sentence.el"
   "./count-words-example-with-bugs.el"
   "./add-elements.el"))
(117 109 19)

(sort (recursive-lengths-list-many-files
       '("./forward-sentence.el"
         "./count-words-example-with-bugs.el"
         "./add-elements.el"))
      '<)
