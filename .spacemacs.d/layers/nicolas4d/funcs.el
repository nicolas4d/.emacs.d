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
  (find-file (concat user-home-directory "Chrome/Extentions/sis001/js/event.js")))

(defun find-layers ()
  "find my own layer cinfiguration directory."
  (interactive)
  (find-file (concat dotspacemacs-directory "layers/")))

(defun find-ssr-cinfig ()
  "find shadowsocks config.json file."
  (interactive)
  (find-file (concat user-home-directory ".local/share/shadowsocksr/config.json")))

;;; End here files

(defun end-new-line-indent ()
  "end of current line and go new line and indent."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun nicolas4d/list-to-string (list)
  "List to string.
list is elisp list"
  (let* ((ret ""))
    (dolist (cur list)
      (if (symbolp cur)
          (setq ret (concat ret (concat (symbol-name cur))))
        (setq ret (concat ret "\"" cur "\""))))
    ret))
