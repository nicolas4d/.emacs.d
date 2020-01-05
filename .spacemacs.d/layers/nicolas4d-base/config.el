;;; abbrev
(setq-default abbrev-mode t)

(define-abbrev-table 'global-abbrev-table '(
                                            ("n4d" "nicolas4d")
                                            ))
;;; abbrev ends here


;;; dired

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 单个缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 拷贝，两个窗口时自动选择另一个窗口
;;(setq dired-dwin-target 1)

;;; dired ends here
