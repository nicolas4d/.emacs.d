;;close auto save
(setq auto-save-default nil)

;;禁止备份文件的生成
(setq make-backup-files nil)

;;选中的文字，编辑覆盖
(delete-selection-mode 1)

;;; abbrev
(setq-default abbrev-mode t)

(define-abbrev-table 'global-abbrev-table '(
                                            ;; Shifu
                                            ("8zl" "zilongshanren")
                                            ;; Tudi
                                            ("8lxy" "lixinyang")
                                            ;;nicols4d
                                            ("n4d" "nicolas4d")
                                            ))
;;; abbrev ends here

;;;; rmail
(defun get-email-password-from-authinfo()
  "get email password from ~/.authinfo."
  (save-excursion
    (let (begPoint
          endPoint
          password)
      ;; prepare .authinfo
      (set-buffer (find-file-noselect "~/.authinfo"))
      (beginning-of-buffer)

      ;; get password
      (search-forward-regexp "nicolas4d")
      (search-forward-regexp "password")
      (forward-word)
      (setq endPoint (point))
      (backward-word)
      (setq begPoint (point))
      (copy-region-as-kill begPoint endPoint)
      (setq password (car kill-ring)
            kill-ring (cdr kill-ring)
            )

      ;; kill buffer .authinfo
      (kill-buffer (current-buffer))
      password)))

;;;; rmail ends here

;;;; mail

;;; sending mail
(setq smtpmail-smtp-server "smtp.qq.com"
      smtpmail-smtp-service 25
      user-full-name "nicolas4d"
      user-mail-address "nicolas4d@foxmail.com"
      )

;;;rmail
;; Configure IMAP
;; (setq rmail-primary-inbox-list (list "imap://nicolas4d@imap.qq.com")
;;       rmail-movemail-variant-in-use 'mailutils
;;       rmail-remote-password-required t
;;       )

;; configure pop3
(setq rmail-remote-password-required t
      rmail-remote-password (get-email-password-from-authinfo)
      rmail-movemail-variant-in-use 'mailutils
      rmail-primary-inbox-list (list "pop://nicolas4d@pop.qq.com")
      ;;rmail-primary-inbox-list '("pop://nicolas4d@qq.com") ;; this line is not working
      rmail-summary-line-count-flag nil
      rmail-file-name "~/emacs/.rmail"
      )

;; highlight and activate URLs:
(add-hook 'rmail-show-message-hook 'goto-address-mode)

;;;; mail ends here

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; plantuml
(setq org-plantuml-jar-path
      (expand-file-name "/home/d/.spacemacs.d/plantuml.jar")

      plantuml-jar-path
      (expand-file-name "/home/d/.spacemacs.d/plantuml.jar")
      )

;;; web-mode
;; set surffix
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))
;;; web-mode ends here

