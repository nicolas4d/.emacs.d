;; mark
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-m") 'set-mark-command)

(global-set-key (kbd "C-SPC f S") 'save-some-buffers)
(global-set-key (kbd "C-SPC C-b") 'buffer-menu)
(global-set-key (kbd "M-w") 'copy-region-or-kill-char)
(define-key global-map (kbd "C-SPC f s") 'save-buffer)
(global-set-key (kbd "C-SPC TAB") 'spacemacs/alternate-buffer)
(global-set-key (kbd "C-SPC 1") 'spacemacs/toggle-maximize-buffer)
(global-set-key (kbd "C-SPC w m") 'spacemacs/toggle-maximize-buffer)
(global-set-key (kbd "C-SPC f E") 'spacemacs/sudo-edit)
(global-set-key (kbd "C-SPC f o") 'spacemacs/open-file-or-directory-in-external-app)

;;; ivy
(global-set-key (kbd "C-SPC b") 'ivy-switch-buffer)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(define-key global-map (kbd "C-SPC f f") 'counsel-find-file)
(define-key global-map (kbd "C-SPC f r") 'counsel-recentf)
(define-key global-map (kbd "C-h v") 'counsel-describe-variable)
(define-key global-map (kbd "C-h f") 'counsel-describe-function)
(define-key global-map (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "M-s i") 'counsel-imenu)
(define-key prog-mode-map (kbd "M-g e") 'counsel-etags-find-tag-at-point)

;; projectile
(global-set-key (kbd "C-SPC p s") 'counsel-projectile-ag)
(global-set-key (kbd "C-SPC p f") 'counsel-projectile-find-file)
(global-set-key (kbd "C-SPC p p") 'counsel-projectile-switch-project)
(global-set-key (kbd "C-SPC p d") 'counsel-projectile-find-dir)

(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-SPC l") 'counsel-locate)
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
(global-set-key (kbd "C-SPC f e i") 'find-init-file)
(global-set-key (kbd "C-SPC f e k") 'find-init-keybindings)
(global-set-key (kbd "C-SPC f e f") 'find-init-funcs)
(global-set-key (kbd "C-SPC f e b") 'find-init-better-defaults)
(global-set-key (kbd "C-SPC f e o") 'find-init-org)
(global-set-key (kbd "C-SPC f e d") 'find-spacemacs-init-file)

;; indent
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;Hippie
(global-set-key (kbd "M-/") 'hippie-expand)

;;; emacs-lisp
(define-key global-map (kbd "C-SPC e e") 'eval-last-sexp)
(define-key global-map (kbd "C-SPC e b") 'eval-buffer)
;;; emacs-lisp ends here

;;youdao-dictionary
(global-set-key (kbd "C-SPC y") 'youdao-dictionary-search-at-point)

;; mwim
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)

(when emacs-or-space
  (global-set-key "\C-w" 'spacemacs/backward-kill-word-or-region)
  )
