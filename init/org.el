(require 'org)

(setq org-src-fontify-natively t)

;;capture templates
(setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/emacs/gtd.org" "工作安排")
	   "* TODO [#B] %?\n  %i\n"
	   :empty-lines 1)))

;;org-pomodoro
(set-language-environment "UTF-8")

(with-eval-after-load 'org
  ;; Org 模式相关设定
  (require 'org-pomodoro)
  )
  
(setq
 org-file-apps (append '(("\\.jpg\\'" . "google-chrome-stable %s"))
                       '(("\\.png\\'" . "google-chrome-stable %s"))
                       org-file-apps
                       )
 org-agenda-files '("~/emacs/.org")
 org-return-follows-link t
 )

;; cdlatex
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode
(add-hook 'org-mode-hook 'turn-on-cdlatex)

;;keybindings
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key "\C-c L" 'org-insert-link-global)
(global-set-key "\C-c o" 'org-open-at-point-global)
(define-key org-mode-map (kbd "C-c t") 'org-todo)
