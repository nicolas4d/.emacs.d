(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       ;; '(("\\.vue\\'" . web-mode))
       auto-mode-alist))

(load-library (concat user-emacs-directory "note/dc-yasnippet/dc-yasnippet.el"))
(advice-add 'save-buffer :before 'dc-yasnippet-new-snippet)
