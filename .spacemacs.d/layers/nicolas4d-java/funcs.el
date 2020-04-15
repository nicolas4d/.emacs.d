;;; java import
(setq
 java-import-case-import "import"
 java-import-case-package "package"
 java-import-case-none "none"
 )

(defvar java-import-find-func 'java-import-find
  "What function to use to find place.")

(defun java-import (class-name)
  "add import class for java mode."
  (interactive)
  (if (search-backward class-name 0 t)
      nil
    (progn
      ;;(java-import-find)
      (funcall java-import-find-func)
      (yas-expand-snippet (concat "import " class-name))))
  nil)

(defun java-import-find ()
  "Find place where to place the import statement."
  (or
   (and
    (search-backward java-import-case-import 0 t)
    (java-import-find-place java-import-case-import))
   (and
    (search-backward java-import-case-package 0 t)
    (java-import-find-place java-import-case-package))
   (and
    (java-import-find-place java-import-case-none)))
  )

(defun java-import-find-place (args)
  "Find place where to place the import statement.

args :: depend on this key word to find place."
  (if (string= args java-import-case-import)
      (progn
        (end-of-line)
        (newline-and-indent)))
  (if (string= args java-import-case-package)
      (progn
        (end-of-line)
        (newline-and-indent)
        (newline-and-indent)))
  (if (string= args java-import-case-none)
      (progn
        (beginning-of-buffer)))
  t)

;;; end of java import
