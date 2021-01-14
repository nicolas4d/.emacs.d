(with-eval-after-load 'projectile
  (push "target" projectile-globally-ignored-directories)
  (setq projectile-globally-ignored-file-suffixes '("class")))

