(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       ;; '(("\\.vue\\'" . web-mode))
       auto-mode-alist))
