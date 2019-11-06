;;layout
(defun nicolas4d/load-my-layout ()
  (interactive)
  (persp-load-state-from-file (concat persp-save-dir "d-layout")))

(defun nicolas4d/save-my-layout ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "d-layout")))

(defun copy-region-or-delete-backward()
  (interactive)
  (if mark-active
      (kill-ring-save 0 0 t)
    (hungry-delete-backward 1)
    )
  )

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

;;; indent
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))
;;; indent ends here

;; find website.org file
(defun find-website-file()
  (interactive)
  (find-file "~/website.org"))
