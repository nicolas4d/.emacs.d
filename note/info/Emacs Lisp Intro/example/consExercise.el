(cons 'bird1 ())
(cons 'bird2 (cons 'bird1 ()))
(cons 'bird3 (cons 'bird2 (cons 'bird1 ())))
(cons 'bird4 (cons 'bird3 (cons 'bird2 (cons 'bird1 ()))))

(setq birds (cons 'bird4 (cons 'bird3 (cons 'bird2 (cons 'bird1 ())))))
birds
(setcar birds 'fish)
birds
(setcdr birds '(fish fish fish))
birds
