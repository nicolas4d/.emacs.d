(when emacs-or-space

  ;;yasnippet
  (require 'yasnippet)
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)

  ;;flycheck
  (add-hook 'js2-mode-hook 'flycheck-mode)

  ;; smartparens
  (require 'smartparens-config)
  (smartparens-global-mode t)

  ;;自动加载外部修改过的文件
  (global-auto-revert-mode 1)

  ;;close auto save
  (setq auto-save-default nil)

  ;;光标移动到，新创建的窗口
  (require 'popwin)
  (popwin-mode 1)

  ;;close beep
  (setq ring-bell-function 'ignore)

  ;;yes to y, no to n
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; 关闭启动帮助画面
  (setq inhibit-splash-screen 1)

  ;; 开启全局 Company 补全
  (global-company-mode 1)

  ;;禁止备份文件的生成
  (setq make-backup-files nil)

  ;;选中的文字，编辑覆盖
  (delete-selection-mode 1)

  ;; '' isue ' 
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
  ;; `` isuse `
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "`" nil :actions nil)

  ;;js2-refactor
  (add-hook 'js2-mode-hook #'js2-refactor-mode)

  ;; witch-key
  (require 'which-key)
  (which-key-mode)

;;; js2-mode
  (defun js2-imenu-make-index ()
    (interactive)
    (save-excursion
      ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
      (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                                 ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                 ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                 ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                                 ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                                 ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
  (add-hook 'js2-mode-hook
            (lambda ()
              (setq imenu-create-index-function 'js2-imenu-make-index)))
;;; js2-mode ends here



;;; dos 换行符
  ;;首先下面是隐藏的方法:
  (defun hidden-dos-eol ()
    "Do not show ^M in files containing mixed UNIX and DOS line endings."
    (interactive)
    (unless buffer-display-table
      (setq buffer-display-table (make-display-table)))
    (aset buffer-display-table ?\^M []))

  ;;以定义函数将此换行符删除，
  (defun remove-dos-eol ()
    "Replace DOS eolns CR LF with Unix eolns CR"
    (interactive)
    (goto-char (point-min))
    (while (search-forward "\r" nil t) (replace-match "")))
;;; dos 换行符 ends here

;;; show-paren-mode
  ;;Highlight Matching Parenthesis
  (add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

  (define-advice show-paren-function (:around (fn) fix-show-paren-function)
    "Highlight enclosing parens."
    (cond ((looking-at-p "\\s(") (funcall fn))
          (t (save-excursion
               (ignore-errors (backward-up-list))
               (funcall fn)))))
;;; show-paren-mode ends here

  ;; recentf
  (require 'recentf)
  (recentf-mode 1)
  (setq
   recentf-max-menu-item 10
   recentf-max-saved-items 40
   )

;;; ivy
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)

  ;; enable this if you want `swiper' to use it
  (setq search-default-mode #'char-fold-to-regexp)
;;; ivy ends here

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

  ;; Hippie
  (setq hippie-expand-try-function-list '(try-expand-debbrev
                                          try-expand-debbrev-all-buffers
                                          try-expand-debbrev-from-kill
                                          try-complete-file-name-partially
                                          try-complete-file-name
                                          try-expand-all-abbrevs
                                          try-expand-list
                                          try-expand-line
                                          try-complete-lisp-symbol-partially
                                          try-complete-lisp-symbol))

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

  ;; C-x C-j into dired
  (require 'dired-x)

  ;; 拷贝，两个窗口时自动选择另一个窗口
  (setq dired-dwin-target 1)
;;; dired ends here

  ;;window-numbering
  (window-numbering-mode 1)

  ;;;nodejs-repl
  (require 'nodejs-repl)

  ;; Find Executable Path on OS X
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))
  ;;;nodejs-repl

  ;; enable narrow
  (put 'narrow-to-region 'disabled nil)
  
  )

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

;; alter set-mark-command
(if (string= system-type "window-nt")
    ((global-unset-key (kbd "C-SPC"))
     (global-set-key (kbd "M-SPC") 'set-mark-command)
     ))

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

;; counsel-etags
(setq counsel-etags-tags-program "ctags -e -R") 
