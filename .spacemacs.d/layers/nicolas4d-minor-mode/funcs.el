(define-minor-mode nicolas4d-minor-mode
  "Toggle nicolas4d-minor-mode."
  :global t)

(defun nicolas4d/move-image-to-default-dir-img ()
  "Copy picture to default-directory/img/.

Image is the latest image in ~/Pictures/."
  (interactive)

  (let* ((ret nil)
         (latest-imgae nil)
         (pic-dir (concat user-home-directory "Pictures/"))
         (img-directory (concat default-directory "img/")))

    (if (> (length (directory-files-recursion pic-dir)) 0)
        (progn
          ;; Get latest image name.
          (setq latest-imgae (car (directory-files-recursion pic-dir)))
          ;; Make sure directory exists.
          (unless (file-exists-p img-directory)
            (dired-create-directory img-directory))

          ;; Move picture.
          (dired-rename-file latest-imgae img-directory t)

          (setq ret (url-file-nondirectory latest-imgae)))
      (message "No image!"))
    ret))

;; (nicolas4d/move-image-to-default-dir-img)
;; (setq latest-imgae (car (directory-files-recursion "~/Pictures/")))
;; (dired-rename-file (concat default-directory "file") "newname" t)

(defun nicolas4d/exec-xmodmap ()
  "execute xmodmap.

change modifier keys."
  (interactive)
  (shell-command "xm"))

;;; files
;; find website.org file
(defun find-website-file()
  (interactive)
  (find-file (concat user-home-directory ".website.org")))

(defun find-sis-event()
  "find chrome extension sis event file"
  (interactive)
  (find-file (concat user-home-directory ".workspaces/chromeExtention/sis/js/event.js")))

(defun find-layers ()
  "find my own layer cinfiguration directory."
  (interactive)
  (find-file (concat dotspacemacs-directory "layers/")))

(defun find-ssr-cinfig ()
  "find shadowsocks config.json file."
  (interactive)
  (find-file (concat user-home-directory ".local/share/shadowsocksr/config.json")))

(defun find-miscellaneous ()
  "find shadowsocks config.json file."
  (interactive)
  (find-file (concat user-home-directory ".data/ubuntu/miscellaneous")))

(defun find-dc-yasnippet ()
  (interactive)
  (find-file (concat user-home-directory ".emacs.d/note/dc-yasnippet/dc-yasnippet.el")))

;;; End here files
