(defun nicolas4d/dired-alternate-buffer ()
  "Dired mode one buffer."
  ;; 单个缓冲区
  (put 'dired-find-alternate-file 'disabled nil)

  ;; 主动加载 Dired Mode
  ;; (require 'dired)
  ;; (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  ;; (define-key dired-mode-map (kbd "f") 'dired-find-alternate-file)

  ;; 延迟加载
  (with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)))
