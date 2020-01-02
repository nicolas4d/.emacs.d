(defun nicolas4d/copy-picture-to-dir ()
  "copyt ~/Pictures/* to dir that I worked Now."
  (interactive)
  (shell-command "mv ~/Pictures/* ~/python/Problem-Solving-with-Algorithms-and-Data-Structures-using-Python/")
  )

(defun nicolas4d/exec-xmodmap ()
  "execute xmodmap.

change modifier keys."
  (interactive)
  (shell-command "xm")
  )

(defun nicolas4d/user-config ()
  "for config my configurations.
for excute in dotspacemacs/user-config."
  ;; remove buffer's left ~
  (global-vi-tilde-fringe-mode -1)

  (nicolas4d-base/user-config)
  )

;;; proxy
;; my-proxy is my machine's proxy
(setq my-proxy `http://127.0.0.1:1080)

(defun show-proxy ()
  "Show http/https proxy."
  (interactive)
  (if url-proxy-services
      (message "Current proxy is \"%s\"" my-proxy)
    (message "No proxy")))

(defun set-proxy ()
  "Set http/https proxy."
  (interactive)
  (setq url-proxy-services `(("http" . ,my-proxy)
                             ("https" . ,my-proxy)))
  (show-proxy))

(defun unset-proxy ()
  "Unset http/https proxy."
  (interactive)
  (setq url-proxy-services nil)
  (show-proxy))

(defun toggle-proxy ()
  "Toggle http/https proxy."
  (interactive)
  (if url-proxy-services
      (unset-proxy)
    (set-proxy)))
;;; proxy ends here

;; find website.org file
(defun find-website-file()
  (interactive)
  (find-file "~/website.org"))

(defun find-miscellaneous()
  "find miscellaneous"
  (interactive)
  (find-file "~/.data/ubuntu/miscellaneous/"))

(defun end-of-line-and-new-line-and-indent ()
  "end of current line and go new line and indent."
  (interactive)
  (end-of-line)
  (newline-and-indent)
  )

(define-minor-mode nicolas4d-minor-mode
  "Toggle nicolas4d-minor-mode."
  :global t
  )
