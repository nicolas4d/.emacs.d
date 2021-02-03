(defun java-package-add-package (rootDirectory)
  "Add package for java file according file path.

rootDirectory : is the root of source.
example : /home/d/src/com/person/Hello.java.
package is com.person."
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
      (when (or (string= cur rootDirectory))
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

(defun java-packages-src-as-root ()
  (interactive)
  (java-package-add-package "src"))

(defun java-packages-java-as-root ()
  (interactive)
  (java-package-add-package "java"))


