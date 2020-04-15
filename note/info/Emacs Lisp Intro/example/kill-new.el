(defun kill-new (string &optional replace yank-handler)
  "Make STRING the latest kill in the kill ring.
     Set `kill-ring-yank-pointer' to point to it.

     If `interprogram-cut-function' is non-nil, apply it to STRING.
     Optional second argument REPLACE non-nil means that STRING will replace
     the front of the kill ring, rather than being added to the list.
     ..."
  (if (> (length string) 0)
      (if yank-handler
          (put-text-property 0 (length string)
                             'yank-handler yank-handler string))
    (if yank-handler
        (signal 'args-out-of-range
                (list string "yank-handler specified for empty string"))))
  (if (fboundp 'menu-bar-update-yank-menu)
      (menu-bar-update-yank-menu string (and replace (car kill-ring))))
  (if (and replace kill-ring)
      (setcar kill-ring string)
    (push string kill-ring)
    (if (> (length kill-ring) kill-ring-max)
        (setcdr (nthcdr (1- kill-ring-max) kill-ring) nil)))
  (setq kill-ring-yank-pointer kill-ring)
  (if interprogram-cut-function
           (funcall interprogram-cut-function string (not replace))))
