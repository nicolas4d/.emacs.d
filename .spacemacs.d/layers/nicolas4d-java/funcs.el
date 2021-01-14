(defun java-package-add-package ()
  "Add package for java file according directory name's src."
  (interactive)

  (let* ((file-name)
         (package-string "")
         (cur)
         (dir-name-list))
    ;; Get file-name.
    (setq file-name (buffer-file-name))
    (setq dir-name-list (butlast (split-string file-name "/")))
    ;; Build package string.
    (while (setq cur (pop dir-name-list))
      (when (or (string= cur "java"))
        (progn
          (setq package-string
                (concat "package "
                        (nicolas4d/list-to-string dir-name-list ".")
                        ";"
                        )))))

    (unless (string= package-string "")
      (save-excursion
        (beginning-of-buffer)
        ;; search package string.
        (when (not (search-forward package-string nil t))
          ;; Insert package string.
          (insert package-string)
          (newline-and-indent)))))

  (end-of-line)
  (newline-and-indent)
  (newline-and-indent)
  nil)

;;(setq dir-name-list '("test" "cn" "itcast" "test"))
