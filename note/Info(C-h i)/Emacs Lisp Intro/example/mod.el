;; kill-ring-yank-pointer and kill-ring have a length of four
;; and (mod (- 0 4) 4) ⇒ 0
(nthcdr (mod (- 0 4) 4)
        '("fourth line of text"
          "third line"
          "second piece of text"
          "first some text"))

When the first argument to the ‘current-kill’ function is one, the
‘nthcdr’ expression returns the list without its first element.

(nthcdr (mod (- 1 4) 4)
        '("fourth line of text"
          "third line"
          "second piece of text"
          "first some text"))
