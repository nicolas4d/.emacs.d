(defconst nicolas4d-editing-packages
  '(
    hungry-delete
    ))

(defun nicolas4d-editing/init-hungry-delete ()
  (use-package hungry-delete
    :init
    :config
    (global-hungry-delete-mode)
    ))
