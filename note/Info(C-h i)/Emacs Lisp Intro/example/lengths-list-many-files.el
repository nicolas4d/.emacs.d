     ;;; Use ‘while’ loop.
(defun lengths-list-many-files (list-of-files)
  "Return list of lengths of defuns in LIST-OF-FILES."
  (let (lengths-list)

     ;;; true-or-false-test
    (while list-of-files
      (setq lengths-list
            (append
             lengths-list

     ;;; Generate a lengths’ list.
             (lengths-list-file
              (expand-file-name (car list-of-files)))))

     ;;; Make files’ list shorter.
      (setq list-of-files (cdr list-of-files)))

     ;;; Return final value of lengths’ list.
    lengths-list))
