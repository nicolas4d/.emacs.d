(defun kill-region (beg end)
  "Kill (\"cut\") text between point and mark.
     This deletes the text from the buffer and saves it in the kill ring.
     The command \\[yank] can retrieve it from there. ... "

  ;; • Since order matters, pass point first.
  (interactive (list (point) (mark)))
  ;; • And tell us if we cannot cut the text.
  ;; 'unless' is an 'if' without a then-part.
  (unless (and beg end)
    (error "The mark is not set now, so there is no region"))

  ;; • 'condition-case' takes three arguments.
  ;;    If the first argument is nil, as it is here,
  ;;    information about the error signal is not
  ;;    stored for use by another function.
  (condition-case nil

      ;; • The second argument to 'condition-case' tells the
      ;;    Lisp interpreter what to do when all goes well.

      ;;    It starts with a 'let' function that extracts the string
      ;;    and tests whether it exists.  If so (that is what the
      ;;    'when' checks), it calls an 'if' function that determines
      ;;    whether the previous command was another call to
      ;;    'kill-region'; if it was, then the new text is appended to
      ;;    the previous text; if not, then a different function,
      ;;    'kill-new', is called.

      ;;    The 'kill-append' function concatenates the new string and
      ;;    the old.  The 'kill-new' function inserts text into a new
      ;;    item in the kill ring.

      ;;    'when' is an 'if' without an else-part.  The second 'when'
      ;;    again checks whether the current string exists; in
      ;;    addition, it checks whether the previous command was
      ;;    another call to 'kill-region'.  If one or the other
      ;;    condition is true, then it sets the current command to
      ;;    be 'kill-region'.
      (let ((string (filter-buffer-substring beg end t)))
        (when string                    ;STRING is nil if BEG = END
          ;; Add that string to the kill ring, one way or another.
          (if (eq last-command 'kill-region)
              ;;    − 'yank-handler' is an optional argument to
              ;;    'kill-region' that tells the 'kill-append' and
              ;;    'kill-new' functions how deal with properties
              ;;    added to the text, such as 'bold' or 'italics'.
              (kill-append string (< end beg) yank-handler)
            (kill-new string nil yank-handler)))
        (when (or string (eq last-command 'kill-region))
          (setq this-command 'kill-region))
        nil)

    ;;  • The third argument to 'condition-case' tells the interpreter
    ;;    what to do with an error.
    ;;    The third argument has a conditions part and a body part.
    ;;    If the conditions are met (in this case,
    ;;             if text or buffer are read-only)
    ;;    then the body is executed.
    ;;    The first part of the third argument is the following:
    ((buffer-read-only text-read-only) ;; the if-part
     ;; ...  the then-part
     (copy-region-as-kill beg end)
     ;;    Next, also as part of the then-part, set this-command, so
     ;;    it will be set in an error
     (setq this-command 'kill-region)
     ;;    Finally, in the then-part, send a message if you may copy
     ;;    the text to the kill ring without signaling an error, but
     ;;    don't if you may not.
     (if kill-read-only-ok
         (progn (message "Read only text copied to kill ring") nil)
       (barf-if-buffer-read-only)
       ;; If the buffer isn't read-only, the text is.
       (signal 'text-read-only (list (current-buffer)))))

