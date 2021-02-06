(defvar java-package-root-directory "java"
  "set java mode root directory as this variable.")

(defun java-package-src-as-root ()
  (interactive)
  (setq java-package-root-directory "src")
  (message "java root set as src"))

;; (java-package-src-as-root)

(defun java-package-java-as-root ()
  (interactive)
  (setq java-package-root-directory "java")
  (message "java root set as java"))

;; (java-package-java-as-root)

(defun java-package-add-package ()
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
      (when (or (string= cur java-package-root-directory))
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
  nil)


