(defun copy-to-ued-as-snippets (dir)
  "copy directory to user-emacs-directory as snippets."

  (let ((new-snippets (concat user-emacs-directory "snippets")))
    (copy-directory dir new-snippets nil t t))

  (message "copy dir done"))

;; (copy-to-ued-as-snippets yasnippet-snippets-dir)

(defun copy-snippets-to-ued()
  "copy snippets in yas/root-directory to user-emacs-directory"

  (let ((snippets-dir)
        (snippets-eval-dir))

    (dolist (snippets-dir yas/root-directory)

      ;;(print snippets-dir)
      ;;(print (eval snippets-dir t))

      (setq snippets-eval-dir (eval snippets-dir))
      (if (file-exists-p  snippets-eval-dir) 
          (copy-to-ued-as-snippets snippets-eval-dir)
        )))
  (message "copy snippets done")
  )

;; (copy-snippets-to-ued)

(defun directory-files-recursion(dir)
  "find all files recursively except . .. from given directory. "
  (let ((files-and-attributes)
        (file)
        (files nil)
        )

    ;; get files and attributes
    (setq dir (concat (directory-file-name dir) "/"))
    (setq files-and-attributes (directory-files-and-attributes dir t))

    ;; iterate files and attributes
    (dolist (file-and-attribute files-and-attributes)
      (setq file (car file-and-attribute))

      ;; exclude prefix with .
      (unless (string-suffix-p "." file)
        ;; if directory recursively
        (if (nth 1 file-and-attribute)
            (progn
              ;;              (print file)
              (setq files (append (directory-files-recursion file) files)))
          ;; else push to list
          (push file files)
          )))
    files)
  )

;; (directory-files-recursion "~/.emacs.d/snippets/")

(defun add-semicolon-to-snippet-key(snippet-file-full-name);
  "add semicolon to key word of snippet."
  (with-temp-buffer
    (find-file-literally snippet-file-full-name)

    (search-forward "# --" nil t)

    (while (not (or
                 (bobp) ; not seached for "# --" or "key:";
                 (eobp) ; not seached for "# --"
                 ))
      (search-backward "key:" nil 1);
      (end-of-line)
      (insert ";")
      (beginning-of-line)
      )

    (save-buffer)
    (kill-buffer)))

;; (add-semicolon-to-snippet-key "~/.emacs.d/snippets/emacs-lisp-mode/setq")

(defun add-semicolon-to-all-snippets (snippets-dir)
  "add semicolon to snippet in directory"
  (let ((files (directory-files-recursion snippets-dir)))

    (dolist (file files)
      (print file)
      (add-semicolon-to-snippet-key file)
      )

    )
  (message "add semicolon done"))

;; (add-semicolon-to-all-snippets "~/.emacs.d/snippets/")
