(defun nicolas4d/org-source-indent ()
  "Indent source resion."
  (interactive)
  (org-edit-special)
  (indent-region-or-buffer)
  (end-of-buffer)
  (newline-and-indent)
  (org-edit-src-exit))

;;; Notifications

(defvar nicolas4d/notify-picture-dir-add-file-descriptor nil)

(defvar nicolas4d/notify-bind-buffer nil
  "Used to find buffer.")

(defun nicolas4d/toggle-notify-picture-dir-add-file()
  "Notify ~/Pictures dir add event."
  (interactive)
  (if (eq nicolas4d/notify-bind-buffer (current-buffer))
      (progn
        (file-notify-rm-watch nicolas4d/notify-picture-dir-add-file-descriptor)
        (setq nicolas4d/notify-picture-dir-add-file-descriptor nil)
        (setq nicolas4d/notify-bind-buffer nil)
        (message "remove notify!"))
    (progn
      (setq nicolas4d/notify-picture-dir-add-file-descriptor
            (file-notify-add-watch
             "~/Pictures"
             '(change attribute-change)
             'nicolas4d/notify-picture-dir-add-file-callback))
      (progn
        (setq nicolas4d/notify-bind-buffer (current-buffer))
        (message "Bind buffer %s"  (buffer-name))))
    (message "notify!")))

;; (nicolas4d/toggle-notify-picture-dir-add-file)

(defun nicolas4d/advice-notify-picture-dir-add-file-close (&optional ARG)
  "Advice when emacs close."
  (when nicolas4d/notify-picture-dir-add-file-descriptor
    (progn
      (file-notify-rm-watch nicolas4d/notify-picture-dir-add-file-descriptor)
      (setq nicolas4d/notify-picture-dir-add-file-descriptor nil)
      (progn
        (setq nicolas4d/notify-bind-buffer nil)
        (message "Unbind notify buffer "))
      (message "remove notify!"))))

(advice-add 'save-buffers-kill-terminal
            :before
            'nicolas4d/advice-notify-picture-dir-add-file-close)

(defun nicolas4d/notify-picture-dir-add-file-callback (event)
  "Copy picture to notify-bind-buffer or current-buffer."
  ;; picture is copy to here, then trigger event "create".
  (when (string= (symbol-name (nth 1 event)) "created")
    (if nicolas4d/notify-bind-buffer
        (purpose-select-buffer nicolas4d/notify-bind-buffer)
      (current-buffer))
    (yas-expand-snippet (yas-lookup-snippet "Img source"))))

;; (nicolas4d/toggle-notify-bind-buffer)

;;; End here notifications

