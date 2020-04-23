;;;layout
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

(spacemacs|define-custom-layout "@AI"
  :binding "a"
  :body
  (progn
    ;; hook to add all el buffers to the layout
    (defun spacemacs-layouts/add-el-buffer-to-persp ()
      (find-file (concat user-home-directory "ai/note.org")))))

(spacemacs|define-custom-layout "@Python"
  :binding "p"
  :body
  (progn
    ;; hook to add all el buffers to the layout
    (defun spacemacs-layouts/add-el-buffer-to-persp ()
      (find-file (concat user-home-directory "python/note.org")))))

(spacemacs|define-custom-layout "@DP"
  :binding "d"
  :body
  (progn
    ;; hook to add all el buffers to the layout
    (defun spacemacs-layouts/add-el-buffer-to-persp ()
      (find-file (concat user-home-directory "DesignPatterns/note.org")))))

(spacemacs|define-custom-layout "@Android"
  :binding "i"
  :body
  (progn
    ;; hook to add all el buffers to the layout
    (defun spacemacs-layouts/add-el-buffer-to-persp ()
      (find-file (concat user-home-directory "android/note.org")))))
