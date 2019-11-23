(defun copy-picture-to-dir ()
  "copyt ~/Pictures/* to copy-picture-to-dir."
  (interactive)
  (shell-command "mv ~/Pictures/* ~/python/DataStructuresAndAlgorithmsUsingPython/table/")
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



