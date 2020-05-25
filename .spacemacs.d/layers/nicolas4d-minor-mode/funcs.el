(define-minor-mode nicolas4d-minor-mode
  "Toggle nicolas4d-minor-mode."
  :global t)

(defun nicolas4d/copy-picture-to-dir ()
  "copy picture to default-directory/img/.

picture name is first of yank list."
  (interactive)

  (let* (start-point
         enp-point
         pic-name
         (img-directory (concat default-directory"img/")))

    ;; Get picture name.
    (progn
      (setq start-point (point))
      (yank)
      (setq end-point (point))
      (setq pic-name (buffer-substring-no-properties start-point end-point))
      )

    ;; Make sure directory.
    (unless (file-exists-p img-directory)
      (dired-create-directory img-directory))

    ;; Move picture.
    (shell-command (concat "cd ~/; "
                           "mv \""
                           (concat pic-name)
                           "\""
                           " "
                           img-directory)))
  nil)

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

(defun trash-file ()
  "Trash file."
  (interactive)
  (let* ((trash-command (concat
                         "cd ~/trash; "
                         "rm -rf *; "
                         "rm -f .*; "
                         "cd ~/.data/trash; "
                         "rm -rf *; "
                         "rm -f .*; "
                         )))
    (async-shell-command trash-command nil nil)))

;;; End here files
