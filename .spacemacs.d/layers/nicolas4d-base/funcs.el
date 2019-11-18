;; project find file
(defun find-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (git-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (counsel-projectile-find-file)
      (counsel-file-jump))))

(defun git-project-root ()
  "Return the project root for current buffer."
  (let ((directory default-directory))
    (locate-dominating-file directory ".git")))

;; project find file ends here

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

