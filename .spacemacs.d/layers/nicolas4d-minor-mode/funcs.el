(define-minor-mode nicolas4d-minor-mode
  "Toggle nicolas4d-minor-mode."
  :global t
  )

(defun nicolas4d/copy-picture-to-dir ()
  "copyt ~/Pictures/* to dir that I worked Now."
  (interactive)
  ;; (shell-command "mv ~/Pictures/* /home/d/DesignPatterns/DesignPatterns-GOF/img/")
  ;; (shell-command "mv ~/Pictures/* /home/d/python/Problem-Solving-with-Algorithms-and-Data-Structures-using-Python/")
  ;; (shell-command "mv ~/Pictures/* /home/d/android/Head-First-Android-Development/img/")
  ;; (shell-command "mv ~/Pictures/* /home/d/python/PyWebScraping/img/")
  ;; (shell-command "mv ~/Pictures/* /home/d/python/Scrapy/img/")
  ;; (shell-command "mv ~/Pictures/* /home/d/Chrome/Extentions/Chrome扩展及应用开发（首发版）/img/")
  ;; (shell-command "mv ~/Pictures/* /home/d/.emacs.d/note/yasnippet/img/")
  (shell-command "mv ~/Pictures/* /home/d/android/docs/guide/img/")
  )

(defun nicolas4d/exec-xmodmap ()
  "execute xmodmap.

change modifier keys."
  (interactive)
  (shell-command "xm")
  )

