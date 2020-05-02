(define-minor-mode nicolas4d-minor-mode
  "Toggle nicolas4d-minor-mode."
  :global t)

(defun nicolas4d/copy-picture-to-dir ()
  "copyt ~/Pictures/* to default-directory/img/."
  (interactive)
  (let* ((img-directory (concat default-directory
                         "img/")))
    (unless (file-exists-p img-directory)
      (dired-create-directory img-directory))

    (shell-command (concat
                    "mv ~/Pictures/* "
                    img-directory
                    ))))

(defun nicolas4d/exec-xmodmap ()
  "execute xmodmap.

change modifier keys."
  (interactive)
  (shell-command "xm"))

;;; files
;; find website.org file
(defun find-website-file()
  (interactive)
  (find-file (concat user-home-directory "website.org")))

(defun find-miscellaneous()
  "find miscellaneous"
  (interactive)
  (find-file (concat user-home-directory ".data/ubuntu/miscellaneous/")))

(defun find-sis-event()
  "find chrome extension sis event file"
  (interactive)
  (find-file (concat user-home-directory "workspaces/sis/js/event.js")))

(defun find-layers ()
  "find my own layer cinfiguration directory."
  (interactive)
  (find-file (concat dotspacemacs-directory "layers/")))

(defun find-ssr-cinfig ()
  "find shadowsocks config.json file."
  (interactive)
  (find-file (concat user-home-directory ".local/share/shadowsocksr/config.json")))

;;; End here files
