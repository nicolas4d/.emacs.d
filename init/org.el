(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/emacs/.org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;;capture templates
(setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/emacs/gtd.org" "工作安排")
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
  
;;(setq org-startup-with-inline-images t)

(global-set-key "\C-c L" 'org-insert-link-global)
(global-set-key "\C-c o" 'org-open-at-point-global)

(setq
 org-file-apps (append '(("\\.jpg\\'" . "google-chrome-stable %s"))
                       '(("\\.png\\'" . "google-chrome-stable %s"))
                       org-file-apps
                       )
 org-agenda-files '("~/emacs/.org")
 org-return-follows-link t
 )

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode
(add-hook 'org-mode-hook 'turn-on-cdlatex)
