;; unset-key
(global-unset-key (kbd "C-x C-f"))
(global-unset-key (kbd "C-x f"))
(global-unset-key (kbd "C-c p"))
(global-unset-key (kbd "C-x C-e"))
(global-unset-key (kbd "C-x e"))
(global-unset-key (kbd "C-x s"))

(global-set-key (kbd "C-x f S") 'save-some-buffers)
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key (kbd "M-w") 'copy-region-or-kill-char)
(define-key global-map (kbd "C-x f s") 'save-buffer)
(global-set-key (kbd "C-x TAB") 'spacemacs/alternate-buffer)
(global-set-key (kbd "C-x 1") 'spacemacs/toggle-maximize-buffer)
(global-set-key (kbd "C-x w m") 'spacemacs/toggle-maximize-buffer)
(global-set-key (kbd "C-x f E") 'spacemacs/sudo-edit)

;;; ivy
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(define-key global-map (kbd "C-x f f") 'counsel-find-file)
(define-key global-map (kbd "C-x f r") 'counsel-recentf)
(define-key global-map (kbd "C-h v") 'counsel-describe-variable)
(define-key global-map (kbd "C-h f") 'counsel-describe-function)
(define-key global-map (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(define-key prog-mode-map (kbd "M-g e") 'counsel-etags-find-tag-at-point)

;; projectile
(global-set-key (kbd "M-p s") 'counsel-projectile-ag)
(global-set-key (kbd "M-p f") 'counsel-projectile-find-file)
(global-set-key (kbd "M-p p") 'counsel-projectile-switch-project)
(global-set-key (kbd "M-p d") 'counsel-projectile-find-dir)

(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
;;; ivy ends 

;;auto-yasnippet
(global-set-key (kbd "C-c d w") #'aya-create)
(global-set-key (kbd "C-c d y") #'aya-expand)

;;iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

;;expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;;occur
(global-set-key (kbd "M-s o") 'occur-dwim)

;;js2-refator
(js2r-add-keybindings-with-prefix "C-c C-m")

;;web-mode indent
(with-eval-after-load 'web-mode
  (define-key web-mode-map (kbd "C-c t i") 'my-toggle-web-indent)
  )

;;fast to open init file
(global-set-key (kbd "C-x f e i") 'find-init-file)
(global-set-key (kbd "C-x f e k") 'find-init-keybindings)
(global-set-key (kbd "C-x f e f") 'find-init-funcs)
(global-set-key (kbd "C-x f e b") 'find-init-better-defaults)
(global-set-key (kbd "C-x f e d") 'find-spacemacs-init-file)

;; indent
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;Hippie
(global-set-key (kbd "M-/") 'hippie-expand)

;;; emacs-lisp
(define-key global-map (kbd "C-x e e") 'eval-last-sexp)
(define-key global-map (kbd "C-x e b") 'eval-buffer)
;;; emacs-lisp ends here

;;youdao-dictionary
(global-set-key (kbd "C-x y") 'youdao-dictionary-search-at-point)

;; mwim
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)

;;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(when emacs-or-space
  (global-set-key "\C-w" 'spacemacs/backward-kill-word-or-region)
  )
