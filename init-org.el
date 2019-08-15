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

;; 关闭缩进
;;(electric-indent-mode -1)

;; 开启全局 Company 补全
(global-company-mode 1)

;;禁止备份文件的生成
(setq make-backup-files nil)

;;选中的文字，编辑覆盖
(delete-selection-mode 1)

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; '' isue ' 
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
;; `` isuse `
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "`" nil :actions nil)

;;js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;;window-numbering
(window-numbering-mode 1)

;;before evil   
;; evil-leader
(global-evil-leader-mode)
(setq evil-leader/leader "SPC")

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )

;; evil
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;evil-surround
(require 'evil-surround)
(global-evil-surround-mode)

;;evil nerd commenter
(evilnc-default-hotkeys)

(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;;which-key
(which-key-mode 1)

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

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;;indent
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

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

;;Highlight Matching Parenthesis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

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

(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/.emacs.d/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;;capture templates
(setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	   "* TODO [#B] %?\n  %i\n"
	   :empty-lines 1)))

;;capture
(global-set-key (kbd "C-c r") 'org-capture)

;;org-pomodoro
(set-language-environment "UTF-8")

(with-eval-after-load 'org
  ;; Org 模式相关设定
  (require 'org-pomodoro)
  )

;;backward kill
(global-set-key (kbd "C-w") 'backward-kill-word)

;;auto-yasnippet
(global-set-key (kbd "C-c d w") #'aya-create)
(global-set-key (kbd "C-c d y") #'aya-expand)

;;helm-ag
(global-unset-key (kbd "C-c p"))
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;;comanymode
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

;;expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;;imenu
(global-set-key (kbd "M-s i") 'counsel-imenu)

;;occur
(global-set-key (kbd "M-s o") 'occur-dwim)

;;js2-refator
(js2r-add-keybindings-with-prefix "C-c C-m")

;;web-mode indent
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;;fast to open init file
(global-set-key (kbd "<f5>") 'open-init-file)

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
