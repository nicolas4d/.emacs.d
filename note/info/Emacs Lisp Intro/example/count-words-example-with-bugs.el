     ;;; First version; has bugs!
(defun count-words-example (beginning end)
  "Print number of words in the region.
     Words are defined as at least one word-constituent
     character followed by at least one character that
     is not a word-constituent.  The buffer's syntax
     table determines which characters these are."
  (interactive "r")
  (message "Counting words in region ... ")

     ;;; 1. Set up appropriate conditions.
  (save-excursion
    (goto-char beginning)
    (let ((count 0))

     ;;; 2. Run the while loop.
      (while (< (point) end)
        (re-search-forward "\\w+\\W*")
        (setq count (1+ count)))

     ;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))


