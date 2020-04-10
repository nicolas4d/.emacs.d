;;; java import

(setq
 java-import-case-import "import"
 java-import-case-namespace "namespace"
 java-import-case-none "none")

(defun java-import (class-name)
  "add import class for java mode."
  (interactive)
  (if (search-backward class-name 0 t)
      nil
    (progn
      (or
       (and
        (search-backward java-import-case-import 0 t)
        (java-import-indent java-import-case-import))
       (and
        (search-backward java-import-case-namespace 0 t)
        (java-import-indent java-import-case-namespace))
       (and
        (java-import-indent java-import-case-none)))
      (yas-expand-snippet (concat "import " class-name))))
  nil)

(defun java-import-indent (args)
  "indent when using java-import defun."
  (if (string= args java-import-case-import)
      (progn
        (end-of-line)
        (newline-and-indent)))
  (if (string= args java-import-case-namespace)
      (progn
        (end-of-line)
        (newline-and-indent)
        (newline-and-indent)))
  (if (string= args java-import-case-none)
      (progn
        (beginning-of-buffer)))
  t)

;;; end of java import
