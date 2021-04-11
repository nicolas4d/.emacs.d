(defconst nicolas4d-tags-packages
  '(
    ;;(etags-select :location (recipe :fetcher github :repo "emacsmirror/etags-select"))
    counsel-etags
    ;;helm-etags-plus
    ;;ac-etags
    (tags-company :location (recipe :fetcher github :repo "nicolas4d/tags-company"))
    )
  )

(defun nicolas4d-tags/init-etags-select ()
  (use-package etags-select
    :init
    (progn
      (define-key evil-normal-state-map (kbd "gf")
        (lambda () (interactive) (find-tag (find-tag-default-as-regexp))))

      (define-key evil-normal-state-map (kbd "gb") 'pop-tag-mark)

      (define-key evil-normal-state-map (kbd "gn")
        (lambda () (interactive) (find-tag last-tag t)))

      (evilified-state-evilify etags-select-mode etags-select-mode-map)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode
        "gd" 'etags-select-find-tag-at-point))))

(defun nicolas4d-tags/init-counsel-etags ()
  (use-package counsel-etags
    :init
    :config
    (setq counsel-etags-tags-program "ctags -e -R")
    ))

(defun nicolas4d-tags/init-helm-etags-plus()
  (use-package helm-etags-plus
    :init))

(defun nicolas4d-tags/init-ac-etags()
  (use-package ac-etags
    :init))

;; (defun nicolas4d-tags/init-tags-company()
;;   (use-package tags-company
;;     :init
;;     ))

;;; packages.el ends here
