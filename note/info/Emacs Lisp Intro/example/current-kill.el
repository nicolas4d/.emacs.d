(defun current-kill (n &optional do-not-move)
  "Rotate the yanking point by N places, and then return that kill.
     If N is zero and `interprogram-paste-function' is set to a
     function that returns a string or a list of strings, and if that
     function doesn't return nil, then that string (or list) is added
     to the front of the kill ring and the string (or first string in
     the list) is returned as the latest kill.
     If N is not zero, and if `yank-pop-change-selection' is
     non-nil, use `interprogram-cut-function' to transfer the
     kill at the new yank point into the window system selection.
     If optional arg DO-NOT-MOVE is non-nil, then don't actually
     move the yanking point; just return the Nth kill forward."

  (let ((interprogram-paste (and (= n 0)
                                 interprogram-paste-function
                                 (funcall interprogram-paste-function))))
    (if interprogram-paste
        (progn
          ;; Disable the interprogram cut function when we add the new
          ;; text to the kill ring, so Emacs doesn't try to own the
          ;; selection, with identical text.
          (let ((interprogram-cut-function nil))
            (if (listp interprogram-paste)
                (mapc 'kill-new (nreverse interprogram-paste))
              (kill-new interprogram-paste)))
          (car kill-ring))
      (or kill-ring (error "Kill ring is empty"))
      (let ((ARGth-kill-element
             (nthcdr (mod (- n (length kill-ring-yank-pointer))
                          (length kill-ring))
                     kill-ring)))
        (unless do-not-move
          (setq kill-ring-yank-pointer ARGth-kill-element)
          (when (and yank-pop-change-selection
                     (> n 0)
                     interprogram-cut-function)
            (funcall interprogram-cut-function (car ARGth-kill-element))))
        (car ARGth-kill-element)))))


(funcall interprogram-paste-function)
(gui-selection-value)

interprogram-cut-function
(gui-select-text "sf")
