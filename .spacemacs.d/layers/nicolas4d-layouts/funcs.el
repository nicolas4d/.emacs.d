(defun nicolas4d/load-my-layouts()
  (interactive)
  (ignore-errors
    (spacemacs//activate-persp-mode)
    (persp-load-state-from-file (concat persp-save-dir "d-layout"))))

(defun nicolas4d/save-my-layouts ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "d-layout")))

(defun nicolas4d/save-all-layouts (&optional ARG)
  "save all layouts"
  (interactive)
  (when (functionp 'persp-save-state-to-file)
    (persp-save-state-to-file (concat persp-save-dir "d")))
  )

(defun nicolas4d/define-custom-layouts ()
  (with-eval-after-load 'persp-mode
    (spacemacs//activate-persp-mode)

    (spacemacs|define-custom-layout "@Spacemacs"
      :binding "e"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-layers)))

    (spacemacs|define-custom-layout "@Java"
      :binding "j"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-file-existing (concat user-home-directory ".4D/data/java/note.org"))))

    (spacemacs|define-custom-layout "@Work"
      :binding "w"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-file-existing (concat user-home-directory ".4D/data/gientech"))))

    (spacemacs|define-custom-layout "@Archlinux"
      :binding "a"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-file-existing (concat user-home-directory ".4D/data/linux/archlinux/note.org"))))

    (spacemacs|define-custom-layout "@Miscellaneous"
      :binding "m"
      :body
      (find-file-existing (concat user-home-directory ".4D/data/backup/miscellaneous")))


    (spacemacs|define-custom-layout "@Web"
      :binding "s"
      :body
      (progn
        (find-ssr-config)
        (split-window-horizontally)
        (find-sis-event)
        (split-window-horizontally)
        (find-website-file)
        ))))
