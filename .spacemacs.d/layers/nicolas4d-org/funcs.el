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

(defun nicolas4d/toggle-notify-picture-dir-add-file()
  "Notify ~/Pictures dir add event."
  (interactive)
  (if nicolas4d/notify-picture-dir-add-file-descriptor
      (progn
        (file-notify-rm-watch nicolas4d/notify-picture-dir-add-file-descriptor)
        (setq nicolas4d/notify-picture-dir-add-file-descriptor nil)
        (message "remove notify!"))
    (progn
      (setq nicolas4d/notify-picture-dir-add-file-descriptor
            (file-notify-add-watch
             "~/Pictures"
             '(change attribute-change)
             'nicolas4d/notify-picture-dir-add-file-callback)))
    (message "notify!")))

;; (nicolas4d/toggle-notify-picture-dir-add-file)

(defvar nicolas4d/notify-bind-buffer nil
  "Used to find buffer.")

(defun nicolas4d/notify-picture-dir-add-file-sleep (event)
  (when (or (string= (symbol-name (nth 1 event)) "created")
            (string= (symbol-name (nth 1 event)) "changed"))
    (sleep-for 0 100)
    (nicolas4d/notify-picture-dir-add-file-sleep event)))

(defun nicolas4d/notify-picture-dir-add-file-callback (event)
  "callback"
  (when (string= (symbol-name (nth 1 event)) "created")
    (with-timeout (1
                   (progn
                     (if nicolas4d/notify-bind-buffer
                         (purpose-select-buffer nicolas4d/notify-bind-buffer)
                       (current-buffer))
                     (end-of-buffer)
                     (yas-expand-snippet (yas-lookup-snippet "Img source"))))
      (print event)
      (nicolas4d/notify-picture-dir-add-file-sleep event))))

(defun nicolas4d/toggle-notify-bind-buffer ()
  (interactive)
  (let((ret))
    (if nicolas4d/notify-bind-buffer
        (progn
          (setq nicolas4d/notify-bind-buffer nil)
          (message "unbind buffer %s" (buffer-name)))
      (progn
        (setq ret (setq nicolas4d/notify-bind-buffer (current-buffer)))
        (message "Bind buffer %s"  (buffer-name))))))

;; (nicolas4d/toggle-notify-bind-buffer)

;;; End here notifications

