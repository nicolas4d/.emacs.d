(defun nicolas4d/user-config ()
  "for config my configurations.
for excute in dotspacemacs/user-config."
  ;; evil-escape custom
  (setq-default evil-escape-key-sequence "  ")
  (setq-default evil-escape-delay 0.2)

  ;; remove buffer's left ~
  (global-vi-tilde-fringe-mode -1)

  (require 'autodisass-java-bytecode)

  (hybrid-mode)
  )

;;; proxy
;; my-proxy is my machine's proxy
(setq my-proxy `http://127.0.0.1:8118)

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

(defun end-new-line-indent ()
  "end of current line and go new line and indent."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun nicolas4d/list-to-string (list seperator)
  "List to string.
list is elisp list"
  (let* ((ret ""))
    (dolist (cur list)
      ;; when string is symbol.
      (when (and (not (string= cur ""))
                 (symbolp cur))
        (progn
          (setq ret (concat ret (concat (symbol-name cur)) seperator))))
      ;; when just is string.
      (when (not (string= cur ""))
        (setq ret (concat ret cur seperator))))
    ;; remove last seperator.
    (unless (or (string= ret "")
                (string= seperator ""))
      (setq ret (substring ret 0 -1)))
    ret))

;; (nicolas4d/list-to-string (list "sdfa" "b") "")

(defun nicolas4d/do-nothing ()
  "Do nothing."
  (interactive)
  )

(defun nicolas4d/move-image-to-default-img-dir (image-full-path)
  "Copy picture to default-directory/img/."
  (interactive)

  (let ((img-directory (concat default-directory "img/")))
        (progn
          ;; Make sure directory exists.
          (unless (file-exists-p img-directory)
            (dired-create-directory img-directory))
          ;; Move picture.
          (dired-rename-file image-full-path img-directory t)
          ;; New img path;
          (concat img-directory (car (last (split-string image-full-path "/")))))))

;; (last (split-string  "/home/d/Pictures/test.png" "/"))
;; (replace-regexp-in-string "/home" "/home/home/" "/home/d/Pictures/test.png")
;; (nicolas4d/move-image-to-default-img-dir "/home/d/Pictures/test.png")
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
  (find-file (concat user-home-directory ".4D/.website.org")))

(defun find-sis-event()
  "find chrome extension sis event file"
  (interactive)
  (find-file (concat user-home-directory ".4D/workspaces/chromeExtention/sis/js/event.js")))

(defun find-layers ()
  "find my own layer cinfiguration directory."
  (interactive)
  (find-file (concat dotspacemacs-directory "layers/")))

(defun find-ssr-config ()
  "find shadowsocks config.json file."
  (interactive)
  (find-file (concat user-home-directory ".local/share/shadowsocksr/config.json")))

(defun find-miscellaneous ()
  "find shadowsocks config.json file."
  (interactive)
  (find-file (concat user-home-directory ".4D/data/backup/miscellaneous")))

;;; End here files
