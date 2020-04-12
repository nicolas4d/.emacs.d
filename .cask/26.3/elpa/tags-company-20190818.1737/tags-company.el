;;; tags-company.el --- use tags more flexible for company

;; Copyright (C) 2019 nicolas4d

;; Author: nicolas4d <nicolas4d@foxmail.com>
;; Create: 18 8 2019
;; Version: 1.0
;; Package-Version: 20190818.1737
;; Package-Requires: ((company))
;; Keywords: tags company
;; URL: https://github.com/nicolas4d/tags-company.git

;;; Commentary:
;; use tags more flexible for company.
;;
;; prerequisite：
;; 1. emacs 27 (I just tested this version)
;;
;; 2. by default, to use this package you need to update the ctag to
;; universal-ctags. otherwise, you need to fix the commad in
;; tags-company/create-tags-command-and-option variable.
;;
;; usage:
;; create tags-company/conf file to directory as root directory.
;; and create tags use tags-company/update. the TAGS file will be
;; created at root directory. when use tags file to company. it will
;; use of just ceated TAGS file.
;;
;; you can add more then one TAGS file to add path to the tags-company/conf
;; files.
;;
;; you can toggle the way when save buffer automatically re-create tags.
;; use of the tags-company/toggle-update-tags-when-save-buffer function.
;;
;; tags-company/update-all-tags controll the create tags way.
;; if nil (for default) just re-create root directory's tags.
;; if t, re-create all tags that the tags-table-list paths.
;;
;; tags-company/conf variable the conf file.
;;
;; all function available function and variable is started prefix tags-company.
;;
;; finally! thanks for zilongshanren and his's 21学会emacs
;; let me deep into emacs.
;;; code

(defvar tags-company/conf
  ".TAGS_CONF"
  "tags-company configuration default file name")

(defvar tags-company/update-all-tags
  nil
  "whether create all tags-company tags.
default nil. just create tags for current tags-company.
if t, create tags for all tags-company in the tags-table-list."
  )

(defvar tags-company/tags-file-name
  "TAGS"
  "default tags file name.")

(defvar tags-company/start-create-tags-msg
  "Creating TAGS in %s ..."
  "message when start create tags or update tags")

(defvar tags-company/create-tags-command-and-option
  "ctags -f %s -e -R %s"
  "create tags command and option string")

(defvar tags-company/set-environment-already-msg
  "already been set tags-company environment.")
(defvar tags-company/set-environment-msg
  "set tags-company environment succeed")
(defvar tags-company/unset-environment-succeed-msg
  "unset tags-company environment succeed")
(defvar tags-company/unset-environment-not-found-msg
  "not found tags-company environment")

(defun tags-company/find-environment()
  "locate tags company root directory.
find directory that contain tags-company-conf."
  (interactive)
  (let ((directory default-directory)
        conf-directory)
    (setq conf-directory
          (locate-dominating-file directory tags-company/conf))
    (message conf-directory)))

(defun tags-company/read-conf(file)
  "read configuration file's contents.
return the file contents as list."
  (save-excursion
    (let ((string-list ())
          (current-buffer (current-buffer)))
      ;;init buffer
      (set-buffer (find-file-noselect file))
      (beginning-of-buffer)
      ;; cons list by newline
      (while (not (eobp))
        (set-mark (point))
        (deactivate-mark)
        (search-forward-regexp "\\'\\|\n" (point-max))
        (copy-region-as-kill (mark) (point))
        (setq string-list (cons (car kill-ring) string-list))
        )
      ;;restore buffer
      (unless (eq current-buffer (current-buffer))
        (kill-buffer (current-buffer)))
      string-list)))

(defun tags-company/read-conf(file)
  "read configuration file's contents.
return the file contents as list."
  (save-excursion
    (let ((buffer-string))
      (set-buffer (find-file-noselect file))
      (setq buffer-string (buffer-string))
      (kill-buffer (current-buffer))
      (list buffer-string))))

(defun tags-company/set-up-company ()
  "make use of custom tags file for company-mode"
  (let ((conf-directory (tags-company/find-environment))
        conf-list)
    (if conf-directory
        (progn
          (setq conf-list (tags-company/read-conf (concat conf-directory tags-company/conf)))
          (if (equal conf-list '(""))
              (setq tags-table-list (list conf-directory))
            (setq tags-table-list (cons conf-directory conf-list))))
      (setq tags-table-list nil))))

(defun tags-company/create-tags (SRC-DIR &optional FORCE)
  "Cteate tags.
command use create-tags-command-and-option."
  (let ((dir (file-name-as-directory (file-truename SRC-DIR)))
        file)
    (setq file (concat dir tags-company/tags-file-name))
    (when (string= system-type "windows-nt")
      (setq dir (substring dir 0 -1)))
    (when (or
           FORCE
           (not (file-exists-p file)))
      (message tags-company/start-create-tags-msg dir)
      (shell-command
       (format tags-company/create-tags-command-and-option file dir)))
    file))

(defun tags-company/update-tags ()
  "check the tags in tags-table-list and re-create it."
  (interactive)
  (tags-company/set-up-company)
  (when tags-table-list
    (if tags-company/update-all-tags
        (dolist (tags-file tags-table-list)
          (make-thread
           (tags-company/create-tags (file-name-directory tags-file) t)))
      (progn
        (setq tags-file (car tags-table-list))
        (make-thread
         (tags-company/create-tags (file-name-directory tags-file) t))))))

(defun tags-company/set-environment()
  "create tags-company/conf configuration file."
  (interactive)
  (if (file-exists-p tags-company/conf)
      (message tags-company/set-environment-already-msg)
    (dired-create-empty-file tags-company/conf)
    (message tags-company/set-environment-msg)))

(defun tags-company/unset-environment()
  "remove tags-company/conf configuration file"
  (interactive)
  (if (file-exists-p tags-company/conf)
      (progn
        (dired-delete-file tags-company/conf)
        (message tags-company/unset-environment-succeed-msg))
    (message tags-company/unset-environment-not-found-msg)))

(defun tags-company/toggle-update-tags-when-save-buffer()
  "toggle update tags when save buffer."
  (interactive)
  (if (advice-member-p 'tags-company/update-tags #'save-buffer)
      (advice-remove 'save-buffer #'tags-company/update-tags)
    (advice-add 'save-buffer :after #'tags-company/update-tags)))

(provide 'tags-company)
;;; tags-company.el ends

;;; tags-company.el ends here
