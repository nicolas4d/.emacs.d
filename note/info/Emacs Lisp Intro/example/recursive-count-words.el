(defun recursive-count-words (region-end)
  "Number of words between point and REGION-END."

     ;;; 1. do-again-test
  (if (and (< (point) region-end)
           (re-search-forward "\\w+\\W*" region-end t))

     ;;; 2. then-part: the recursive call
      (1+ (recursive-count-words region-end))

     ;;; 3. else-part
    0))

(defun count-words-example (beginning end)
  "Print number of words in the region.

     Words are defined as at least one word-constituent
     character followed by at least one character that is
     not a word-constituent.  The buffer's syntax table
     determines which characters these are."
  (interactive "r")
  (message "Counting words in region ... ")
  (save-excursion
    (goto-char beginning)
    (let ((count (recursive-count-words end)))
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))

