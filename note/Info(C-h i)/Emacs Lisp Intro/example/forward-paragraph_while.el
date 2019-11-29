;; going forwards and not at the end of the buffer
(while (and (> arg 0) (not (eobp)))

  ;; between paragraphs
  ;; Move forward over separator lines...
  (while (and (not (eobp))
              (progn (move-to-left-margin) (not (eobp)))
              (looking-at parsep))
    (forward-line 1))
  ;;  This decrements the loop
  (unless (eobp) (setq arg (1- arg)))
  ;; ... and one more line.
  (forward-line 1)

  (if fill-prefix-regexp
      ;; There is a fill prefix; it overrides parstart;
      ;; we go forward line by line
      (while (and (not (eobp))
                  (progn (move-to-left-margin) (not (eobp)))
                  (not (looking-at parsep))
                  (looking-at fill-prefix-regexp))
        (forward-line 1))

    ;; There is no fill prefix;
    ;; we go forward character by character
    (while (and (re-search-forward sp-parstart nil 1)
                (progn (setq start (match-beginning 0))
                       (goto-char start)
                       (not (eobp)))
                (progn (move-to-left-margin)
                       (not (looking-at parsep)))
                (or (not (looking-at parstart))
                    (and use-hard-newlines
                         (not (get-text-property (1- start) 'hard)))))
      (forward-char 1))

    ;; and if there is no fill prefix and if we are not at the end,
    ;;     go to whatever was found in the regular expression search
    ;;     for sp-parstart
    (if (< (point) (point-max))
        (goto-char start))))



