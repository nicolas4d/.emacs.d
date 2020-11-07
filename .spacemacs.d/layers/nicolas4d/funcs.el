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
          (message cur)
          (setq ret (concat ret (concat (symbol-name cur)) seperator))))
      ;; when just is string.
      (when (not (string= cur ""))
        (setq ret (concat ret cur seperator))))
    ;; remove last seperator.
    (when (not (string= cur ""))
      (setq ret (substring ret 0 -1)))
    ret))
