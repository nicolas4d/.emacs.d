(defun yank (&optional arg)
  "Reinsert (\"paste\") the last stretch of killed text.
     More precisely, reinsert the stretch of killed text most recently
     killed OR yanked.  Put point at end, and set mark at beginning.
     With just \\[universal-argument] as argument, same but put point at beginning (and mark at end).
     With argument N, reinsert the Nth most recently killed stretch of killed
     text.

     When this command inserts killed text into the buffer, it honors
     `yank-excluded-properties' and `yank-handler' as described in the
     doc string for `insert-for-yank-1', which see.

     See also the command `yank-pop' (\\[yank-pop])."
  (interactive "*P")
  (setq yank-window-start (window-start))
  ;; If we don't get all the way thru, make last-command indicate that
  ;; for the following command.
  (setq this-command t)
  (push-mark (point))
  (insert-for-yank (current-kill (cond
                                  ((listp arg) 0)
                                  ((eq arg '-) -2)
                                  (t (1- arg)))))
  (if (consp arg)
      ;; This is like exchange-point-and-mark, but doesn't activate the mark.
      ;; It is cleaner to avoid activation, even though the command
      ;; loop would deactivate the mark because we inserted text.
      (goto-char (prog1 (mark t)
                   (set-marker (mark-marker) (point) (current-buffer)))))
  ;; If we do get all the way thru, make this-command indicate that.
  (if (eq this-command t)
      (setq this-command 'yank))
  nil)



