;;; Tellme

(setq
 tellme-elisp-keyword-require "require"
 tellme-java-keyword-import "import"
 tellme-elisp-keyword-list '(tellme-elisp-keyword-require)
 tellme-mode-info-list '((emacs-lisp-mode
                          tellme-elisp-keyword-list
                          tellme-elisp-full-code
                          tellme-elisp-go-place
                          tellme-new-snippet-elisp)
                         (java-mode ("import")
                                    tellme-already-coded-java-p)
                         (python-mode ("import")
                                      tellme-already-coded-python-p)
                         (c++-mode ("include")
                                   tellme-already-coded-cpp-p))
 tellme-full-code-func nil
 tellme-go-place-func nil
 tellme-new-snippet-prog-func nil
 )

(defun tellme(code)
  "Adds needs codes for program file. using with yasnippet.

code :: going to be code.
example :: java program language's import class-name.
          emacs-lisp require package. "
  (let* (mode-info-list)
    ;; Support major mode?
    (when (setq mode-info-list (tellme-support-major-mode-p))
      ;; Is already coded if support?
      ;;(unless (funcall (eval 'tellme-already-coded-func-p) code mode-info-list)
      (unless (tellme-already-coded-p code mode-info-list)
        ;; code if note already.
        (tellme-code code mode-info-list)
        )
      ))
  nil)

(defun tellme-support-major-mode-p ()
  "Is support current major mode.

Using list tellme-mode-info-list.
return major mode information if support.
return nil if not support."
  (let ((ret-mode-info-list nil))
    (dolist (mode-info-list tellme-mode-info-list)
      (when (-contains-p mode-info-list major-mode)
        (setq tellme-full-code-func
              (nth 2 mode-info-list)
              tellme-go-place-func
              (nth 3 mode-info-list)
              )
        (setq ret-mode-info-list mode-info-list)))
    ret-mode-info-list))

(defun tellme-keyword-list (mode-info-list)
  "Get keyword-list."
  (eval (nth 1 mode-info-list))
  )

(defun tellme-already-coded-p (code mode-info-list)
  "Is already coded for emeacs-lisp file.

mode-info-list :: major mode information."
  (let* (full-code
         ret)
    ;; Iterate keywods from mode-info-list
    (dolist (keyword (tellme-keyword-list mode-info-list))
      ;; Concat keyword with code for keywods to full-code.
      (setq full-code (funcall (eval 'tellme-full-code-func) code))

      (when (search-backward full-code 0 t)
        (setq ret t)))
    ret))

(defun tellme-code (code mode-info-list)
  "Code for elisp.

code is going to be codes code.
mode-info-list is mode information list."
  (catch 'break
    (dolist (keyword (tellme-keyword-list mode-info-list))
      (when (equal keyword 'tellme-elisp-keyword-require)
        (funcall (eval 'tellme-go-place-func) keyword)
        (setq full-code (funcall (eval 'tellme-full-code-func) code))
        (insert full-code)
        (throw 'break nil))))
  nil)

(defun tellme-new-snippet ()
  "New snippet to use Tellme."
  (dolist (mode-info-list tellme-mode-info-list)
    (when (-contains-p mode-info-list major-mode)
      (setq tellme-new-snippet-prog-func
            (nth 4 mode-info-list))
      (funcall (eval 'tellme-new-snippet-prog-func))
      ))
  nil)

(defun tellme-snippet-file-name (code)
  "Create snippet file name.

code : using this to concatenate file name."
  (concat yas--default-user-snippets-dir
          "/"
          (symbol-name major-mode)
          "/"
          code)
  )
;;; For elisp

(defun tellme-elisp-full-code (code)
  "Get full-code for elisp."
  (concat "(" tellme-elisp-keyword-require " '" code ")")
  )

(defun tellme-elisp-go-place (keyword)
  "Go to the place where going to be code.

keyword is for general purpose and extension."
  (previous-line)
  (end-of-line)
  (newline-and-indent)
  )

(defun tellme-new-snippet-elisp ()
  "New snippet for emacs lisp for use Tellme."
  (save-excursion
    (let (code)
      (beginning-of-buffer)
      ;; Find code
      (while (search-forward-regexp
              (concat "(" tellme-elisp-keyword-require " '") nil t)
        (setq code (tellme-code-elisp))
        ;; File exist?
        (unless (file-exists-p (tellme-snippet-file-name code))
          ;; Craete file to insert contents if file is not exist.
          (tellme-new-snippet-file-elisp code)))))
  (yas-reload-all))

(defun tellme-code-elisp ()
  "Get code for emacs lisp mode."
  (let (startPoint
        endPoint)
    (setq startPoint (point))
    (search-forward-regexp ")" nil t)
    (backward-char)
    (setq endPoint (point))
    (buffer-substring-no-properties startPoint endPoint)))

(defun tellme-new-snippet-file-elisp (code)
  "Create snippet file and write contents.

code :: the key to file name and file contents."
  (with-temp-file (tellme-snippet-file-name code)
    (let* ((snippet-name code)
           (snippet-key code)
           (snippet-code code)
           snippet-content)
      ;; Construct contents
      (setq snippet-content
            (concat "# -*- mode: snippet -*-\n"
                    "# name: " snippet-name "\n"
                    "# key: " snippet-key ";\n"
                    "# --\n"
                    snippet-code"`\n"
                    "(tellme \"" snippet-code "\")\n"
                    "`"))
      ;; Insert contents.
      (insert snippet-content)
      (message (concat "snippet "
                       (tellme-snippet-file-name code)
                       " created successed.")))))

;;; Ends here for elisp

;;; For java

(defun tellme-java-full-code (code)
  "Get java full-code."
  (concat tellme-java-keyword-import " " code ";")
  )

;; (defun tellme-java-go-place-to-code ()
;;   "Go to the palce where going to be code."
;;   (previous-line)
;;   (end-of-line)
;;   (newline-and-indent)
;;   )
;;; Ends here for java

;; test
(when nil

  (tellme "sdf")

  (tellme-support-major-mode-p)

  "(require 'org)"
  (tellme-already-coded-elisp-p "org" '(emacs-lisp-mode tellme-elisp-keyword-list))

  (dolist (keyword (eval (nth 1 (nth 0 tellme-mode-info-list))))
    (print (eval keyword))
    )

  (tellme-keyword-list (nth 0 tellme-mode-info-list))
  (tellme-elisp-full-code "code")

  (tellme-snippet-file-name "snippet-name")

  (progn
    (tellme-new-snippet-file-elisp "tellme-test")
    (yas-reload-all)
    )

  (tellme-code-elisp)

  (require 'tellme-test)
  tellme-test


  (concat "^(" tellme-elisp-keyword-require " '")

  (tellme-new-snippet-elisp)
  (tellme-new-snippet)
  )


;;; test ends here

;;; ends here Tellme
