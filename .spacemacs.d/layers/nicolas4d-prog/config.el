(setq auto-mode-alist
      (append
       '(("\\.js\\'" . web-mode))
       '(("\\.html\\'" . web-mode))
       '(("\\.vue\\'" . web-mode))
       auto-mode-alist))
