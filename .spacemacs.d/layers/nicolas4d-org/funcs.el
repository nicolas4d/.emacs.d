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
  ;; picture copy to here, then trigger event "create".
  (let ((new-img-name))
    ;; (print event)
    (when (string= (symbol-name (nth 1 event)) "created")
      ;; Select buffer.
      (if nicolas4d/notify-bind-buffer
          (purpose-select-buffer nicolas4d/notify-bind-buffer)
        (current-buffer))
      ;; Sleep for ... because too fast to move picture.
      (sleep-for 0.2)
      ;; Inser relative filename as note.
      (setq new-img-name (nicolas4d/move-image-to-default-img-dir (nth 2 event)))
      (insert "file:img/"  (concat (car (last (split-string new-img-name "/"))) "\n")))))

;; (nicolas4d/toggle-notify-bind-buffer)

;;; End here notifications

