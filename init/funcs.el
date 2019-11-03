;; project find file
(defun find-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (git-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (counsel-projectile-find-file)
      (counsel-file-jump))))

(defun git-project-root ()
  "Return the project root for current buffer."
  (let ((directory default-directory))
    (locate-dominating-file directory ".git")))

;; project find file ends here

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

(defun copy-region-or-delete-backward()
  (interactive)
  (if mark-active
      (kill-ring-save 0 0 t)
    (hungry-delete-backward 1)
    )
  )

;;; init.el
(defun find-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun find-init-keybindings()
  (interactive)
  (find-file "~/.emacs.d/init/keybindings.el"))

(defun find-init-funcs()
  (interactive)
  (find-file "~/.emacs.d/init/funcs.el"))

(defun find-init-better-defaults()
  (interactive)
  (find-file "~/.emacs.d/init/better-defaults.el"))

(defun find-init-org()
  (interactive)
  (find-file "~/.emacs.d/init/org.el"))

(defun find-spacemacs-init-file()
  "spacemacs init file"
  (interactive)
  (find-file "~/.spacemacs.d/init.el")
  )
;;; init.el ends here

(defun my-toggle-web-indent ()
  "indent"
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
