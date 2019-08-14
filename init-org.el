;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
(when (>= emacs-major-version 24)
  (require 'package)
  ;;(package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      ;;smex
		      swiper
		      counsel
		      smartparens
		      ;; --- Major Mode ---
		      js2-mode
		      ;; --- Minor Mode ---
		      nodejs-repl
		      ;;exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      ;; solarized-theme
		      popwin
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

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

;; 关闭缩进
;;(electric-indent-mode -1)

;; 开启全局 Company 补全
(global-company-mode 1)

;;禁止备份文件的生成
(setq make-backup-files nil)

;;选中的文字，编辑覆盖
(delete-selection-mode 1)

;;Highlight Matching Parenthesis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; add js to auto-mode-list
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;;nodejs-repl
(require 'nodejs-repl)

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;;;nodejs-repl

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp)

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

;; abbrev
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; Shifu
					    ("8zl" "zilongshanren")
					    ;; Tudi
					    ("8lxy" "lixinyang")
					    ;;nicols4d
					    ("n4d" "nicolas4d")
					   ))

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

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;fast to open init file
(global-set-key (kbd "<f3>") 'open-init-file)

;; recentf
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; indent
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;Hippie
(global-set-key (kbd "s-/") 'hippie-expand)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;; too large
(set-face-attribute 'default nil :height 110)

;;最大化
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;高亮当前行
(global-hl-line-mode 1)

;;monokai theme
(load-theme 'monokai 1)

(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/.emacs.d/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
