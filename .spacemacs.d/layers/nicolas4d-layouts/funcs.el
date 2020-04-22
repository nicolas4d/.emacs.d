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

;; (spacemacs|define-custom-layout "@Spacemacs"
;;   :binding "e"
;;   :body
;;   (progn
;;     ;; hook to add all el buffers to the layout
;;     (defun spacemacs-layouts/add-el-buffer-to-persp ()
;;       (persp-add-buffer (current-buffer)
;;                         (persp-get-by-name "@Spacemacs")
;;                         persp-switch-to-added-buffer)
;;       (persp-switch "@Spacemacs")
;;       (add-hook 'emacs-lisp-mode-hook #'spacemacs-layouts/add-el-buffer-to-persp))))
