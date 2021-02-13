(defun* nicolas4d/load-my-layouts()
  (interactive)
  (ignore-errors
    (spacemacs//activate-persp-mode)
    (persp-load-state-from-file (concat persp-save-dir "d-layout"))))

(defun nicolas4d/save-my-layouts ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "d-layout")))

(defun* nicolas4d/save-all-layouts (&optional ARG)
  "save all layouts"
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "d")))

(defun nicolas4d/define-custom-layouts ()
  (with-eval-after-load 'persp-mode
    (spacemacs//activate-persp-mode)

    (spacemacs|define-custom-layout "@AI"
      :binding "a"
      :body
      (progn
        ;; hook to add all el buffers to the layout
          (find-file-existing (concat user-home-directory "ai/note.org"))))

    (spacemacs|define-custom-layout "@Python"
      :binding "p"
      :body
      (progn
        ;; hook to add all el buffers to the layout
          (find-file-existing (concat user-home-directory "python/note.org"))))

    (spacemacs|define-custom-layout "@DesignPatterns"
      :binding "d"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-file-existing (concat user-home-directory "DesignPatterns/note.org"))))

    (spacemacs|define-custom-layout "@Resume"
      :binding "r"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-file-existing (concat user-home-directory "resume/resume-d.tex"))))

    (spacemacs|define-custom-layout "@Linux"
      :binding "l"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-file-existing (concat user-home-directory "linux/note.org"))))

    (spacemacs|define-custom-layout "@Spacemacs"
      :binding "e"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-layers)))

    (spacemacs|define-custom-layout "@cc++"
      :binding "c"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-file-existing (concat user-home-directory "cc++/note.org"))))

    (spacemacs|define-custom-layout "@Java"
      :binding "j"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        ;; (find-file-existing (concat user-home-directory ".workspaces/IdeaProjects")))
        (find-file-existing (concat user-home-directory ".java")))
      )

    (spacemacs|define-custom-layout "@v"
      :binding "v"
      :body
      (progn
        ;; hook to add all el buffers to the layout
        (find-file-existing (concat user-home-directory "workspaces/sis/js/event.js"))
        (split-window-horizontally)
        (find-file-existing (concat user-home-directory ".website.org"))
        (split-window-horizontally)
        (find-file-existing (concat user-home-directory ".data/ubuntu/miscellaneous"))
        ))

    (spacemacs|define-custom-layout "@sql"
      :binding "s"
      :body
      (progn
        (find-file-existing (concat user-home-directory "sql/note.org"))))

    (spacemacs|define-custom-layout "@zf"
      :binding "z"
      :body
      (progn
        (find-file-existing (concat user-home-directory ".data/zhengfangsoft/note.org"))
        (split-window-horizontally)
        (find-file-existing (concat user-home-directory ".data/zhengfangsoft/journal/note.org"))))

    (spacemacs|define-custom-layout "@Android"
      :binding "i"
      :body
      (progn
        ;; hook to add all el buffers to the layout
          (find-file-existing (concat user-home-directory "android/note.org"))))))
