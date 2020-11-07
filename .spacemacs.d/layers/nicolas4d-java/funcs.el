(defun java-package-add-package ()
  "Add package for java file according directory name's src."
  (interactive)

  (let* ((file-name)
         (package-string)
         (cur)
         (file-name-list))
    ;; Get file-name.
    (setq file-name (buffer-file-name))
    (setq file-name-list (split-string file-name "/"))
    ;; Build package string.
    (while (setq cur (pop file-name-list))
      (when (string= cur "src")
        (progn
          (setq package-string
                (concat "package "
                        (substring
                         (nicolas4d/list-to-string file-name-list ".") 0 -5)
                        ";"
                        )))))
    (beginning-of-buffer)
    ;; search package string.
    (when (not (search-forward package-string nil t))
      ;; Insert package string.
      (insert package-string)
      (newline-and-indent)))
  nil)
