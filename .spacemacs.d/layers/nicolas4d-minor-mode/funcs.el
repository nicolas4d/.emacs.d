(define-minor-mode nicolas4d-minor-mode
  "Toggle nicolas4d-minor-mode."
  :global t
  )

(defun nicolas4d/copy-picture-to-dir ()
  "copyt ~/Pictures/* to dir that I worked Now."
  (interactive)
  (shell-command "mv ~/Pictures/* /home/d/DesignPatterns/DesignPatterns-GOF/")
  )

(defun nicolas4d/exec-xmodmap ()
  "execute xmodmap.

change modifier keys."
  (interactive)
  (shell-command "xm")
  )

