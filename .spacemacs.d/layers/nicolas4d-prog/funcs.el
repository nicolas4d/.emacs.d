;;;; Tellme

(setq
 ;; Define keyword
 ;; For emacs lisp
 tellme-elisp-keyword-require "require"
 tellme-elisp-keyword-list '(tellme-elisp-keyword-require)

 ;; For java
 tellme-java-keyword-import "import"
 tellme-java-keyword-package "package"
 tellme-java-keyword-none "none"
 tellme-java-keyword-list '(tellme-java-keyword-import
                            tellme-java-keyword-package
                            tellme-java-keyword-none)

 ;; For c++
 tellme-cpp-keyword-include "#include"
 tellme-cpp-keyword-none "none"
 tellme-cpp-keyword-list '(tellme-cpp-keyword-include
                           tellme-cpp-keyword-none)

 ;; Python
 tellme-python-keyword-import "import"
 tellme-python-keyword-from "from"
 tellme-python-keyword-path "#!"
 tellme-python-keyword-none "none"
 tellme-python-keyword-list '(tellme-python-keyword-import
                              tellme-python-keyword-from
                              tellme-python-keyword-path
                              tellme-python-keyword-none)

 ;; Define mode's information
 tellme-mode-info-list '((emacs-lisp-mode
                          tellme-elisp-keyword-list
                          tellme-elisp-go-place
                          tellme-elisp-to-be-found-code
                          tellme-elisp-code-rules)

                         (java-mode
                          tellme-java-keyword-list
                          tellme-java-go-place
                          tellme-java-to-be-found-code
                          tellme-java-code-rules)

                         (c++-mode
                          tellme-cpp-keyword-list
                          tellme-cpp-go-place
                          tellme-cpp-to-be-found-code
                          tellme-cpp-code-rules)

                         (python-mode
                          tellme-python-keyword-list
                          tellme-python-go-place
                          tellme-python-to-be-found-code
                          tellme-python-code-rules)

                         )

 ;; Define callbacks
 tellme-keyword-list nil
 tellme-go-place-func nil
 tellme-to-be-found-code-func nil
 tellme-code-rules-function nil )

(defun tellme(encode)
  "Adds needs codes for program file. using with yasnippet.

code :: going to be code.
example :
emacs-lisp require package.
java program language's import class-name."
  (let* ((code (tellme-decode encode)))
    ;; Support major mode?
    (when (tellme-support-major-mode-p)
      ;; Is already coded if support?
      (unless (tellme-code-p code)
        ;; code if not coded.
        (tellme-code code))))
  nil)

(defun tellme-list-to-string (code-list)
  "List to string.

example : (tell \"me\") to \"tellme\""
  (let* ((ret ""))
    (dolist (cur code-list)
      (if (symbolp cur)
          (setq ret (concat ret (concat (symbol-name cur))))
        (setq ret (concat ret "\"" cur "\""))))
    ret))

(defun tellme-support-major-mode-p ()
  "Is support current major mode.

Using list tellme-mode-info-list.
Return t if support. Return nil if not support."
  (let ((ret nil))
    (dolist (mode-info-list tellme-mode-info-list)
      (when (-contains-p mode-info-list major-mode)
        ;; Configure current mode callbacks.
        (setq tellme-keyword-list
              (nth 1 mode-info-list)
              tellme-go-place-func
              (nth 2 mode-info-list)
              tellme-to-be-found-code-func
              (nth 3 mode-info-list)
              tellme-code-rules-function
              (nth 4 mode-info-list)
              ret t)))
    ret))

(defun tellme-code-p (code)
  "Predict code.

code is going to be find."
  (let* (ret found-code-list found-code)
    (setq found-code-list (funcall (eval 'tellme-to-be-found-code-func) code))
    (dolist (found-code found-code-list)
      (when (search-backward-regexp (concat found-code "\\( \\|$\\)+")
                                    0 t)
        (setq ret t)))
    ret))

(defun tellme-code (code)
  "Code.

code is going to be codes code."
  (catch 'break
    (let* ((keyword nil)
           (keyword-list (eval tellme-keyword-list)))
      (dolist (keyword keyword-list)
        ;; Coding depend on keyword case.
        (when (funcall (eval 'tellme-go-place-func) keyword)
          (insert code)
          (throw 'break nil)))))
  nil)

(defun tellme-new-snippet ()
  "New snippet to use."
  (interactive)

  (save-excursion
    (let* (snippet-variable-list snippet-list create-p need-reload-yas)
      ;; support major mode?
      (when (tellme-support-major-mode-p)
        ;; search buffer for code list
        (setq snippet-list (tellme-snippet-search))
        ;; new snippets
        (dolist (snippet-variable-list snippet-list)
          (setq create-p (tellme-new-snippet-file snippet-variable-list))
          (when (and create-p (not need-reload-yas))
            (setq need-reload-yas t)))
        (if need-reload-yas
            ;; reload yas
            (yas-reload-all)
          (message "Not found cod to new snippet."))))))

(defun tellme-snippet-file-name (code)
  "Create snippet full file name.

code is using this to concatenate file name."
  (let* (dir file)
    (setq dir (concat yas--default-user-snippets-dir "/"
                      (symbol-name major-mode) "/tellme")
          file (concat dir "/" code))
    (unless (file-exists-p dir)
      (dired-create-directory dir)
      )
    file))

(defun tellme-snippet-search ()
  "Search code that using at create snippets in current buffer.

Returns snippet list using with create snippets,
each atom on each snippet."
  (let (code startPoint endPoints code-rules
             cur-regexp snippet-variable-list code
             (ret-snippet-list ()))

    (setq code-rules (funcall (eval 'tellme-code-rules-function)))
    ;; Find code
    (dolist (cur-rule code-rules)
      (setq cur-regexp (eval (eval (car cur-rule))))

      (save-excursion
        (beginning-of-buffer)

        ;; make snippet list
        (while (search-forward-regexp cur-regexp nil t)
          (setq endPoint (point))
          (search-backward-regexp cur-regexp nil t)
          (setq startPoint (point))
          (search-forward-regexp cur-regexp nil t)
          (setq code (buffer-substring-no-properties startPoint endPoint))
          (setq snippet-variable-list (eval (eval (car (cdr cur-rule)))))
          (push snippet-variable-list ret-snippet-list)
          )))
    ret-snippet-list))

(defun tellme-new-snippet-file (snippet-variable-list)
  "Create snippet file and write contents.

snippet-variable-list :
1. name is the snippet's name.
2. key is the snippet's key.
3. text is the snippet's text that will be write in the current point.
4. code that will be coded."
  (message "message start")
  (message (nth 0 snippet-variable-list))
  ;;(message "sdf" (nth 3 snippet-variable-list) "sdf")
  (message "message end")

  (let* ((name (nth 0 snippet-variable-list))
         (key (nth 1 snippet-variable-list))
         (text (nth 2 snippet-variable-list))
         (code (nth 3 snippet-variable-list))
         snippet-content file-name ret)

    (setq file-name (tellme-snippet-file-name name))
    (unless (file-exists-p file-name)
      (setq ret t)

      (with-temp-file file-name
        ;; Construct contents
        (setq snippet-content (concat "# -*- mode: snippet -*-\n"
                                      "# name: " name "\n"
                                      "# key: " key ";\n"
                                      "# group: tellme\n"
                                      "# --\n"
                                      text"`(tellme \"" code "\")"
                                      "`"))
        ;; Insert contents.
        (insert snippet-content)
        )
      (message (concat "snippet "
                       (tellme-snippet-file-name name)
                       " created successed.")))
    ret))

(defun tellme-encode (code)
  "Encode code.

Encode \" to -.
Encode space to +."
  (let* (cur-code)
    ;; 37 is % and 34 is "
    (setq cur-code (subst-char-in-string 34 37 code))
    ;; 32 is space and 43 is +
    (subst-char-in-string 32 43 cur-code)))

(defun tellme-decode (code)
  "Decode code.

Encode - to \".
Decode + to space."
  (let* (cur-code)
    ;; 45 is - and 37 is %
    (setq cur-code (subst-char-in-string 37 34 code))
    ;; 32 is space and 43 is +
    (subst-char-in-string 43 32 cur-code)))

(defun tellme-previous-end-new-indent-line ()
  (previous-line)
  (end-of-line)
  (newline-and-indent)
  )

(defun tellme-end-new-indent-line ()
  (end-of-line)
  (newline-and-indent)
  )

(defun tellme-end-new-new-indent ()
  (end-of-line)
  (newline-and-indent)
  (newline-and-indent)
  )

;;; For elisp

(defun tellme-elisp-to-be-found-code (code)
  "Create code list to be found. Using with code."
  (list code))

(defun tellme-elisp-full-code (code)
  "Get full-code for emacs lisp using with code."
  code)

(defun tellme-elisp-go-place (keyword)
  "Go to the place where going to be code.

keyword is for general purpose and extension."
  (tellme-previous-end-new-indent-line)
  t)

(defun tellme-elisp-code-rules ()
  "Emacs lisp regular expression for search and extract code rulse."
  '(
    (
     '(concat "(" tellme-elisp-keyword-require " '.*)")
     '(progn
        (let* ((ret ()) cur-code)
          (setq cur-code (substring code 10 -1))
          (push (tellme-encode code) ret)
          (push cur-code ret)
          (push cur-code ret)
          (push cur-code ret)))
     )
    )
  )

;;; Ends here for elisp

;;; For java

(defun tellme-java-to-be-found-code (code)
  "Create code list to be found. "
  (list code))

(defun tellme-java-go-place (keyword)
  "Go to the palce where going to be code.

Find place by keyword. "
  (let* ((curKeywordValue (eval keyword) )
         ret)
    (if (eq curKeywordValue tellme-java-keyword-import)
        (progn
          (when (search-backward tellme-java-keyword-import nil t)
            (tellme-end-new-indent-line)
            (setq ret t))))
    (if (eq curKeywordValue tellme-java-keyword-package)
        (progn
          (when (search-backward tellme-java-keyword-package nil t)
            (tellme-end-new-new-indent)
            (setq ret t))))
    (if (eq curKeywordValue tellme-java-keyword-none)
        (progn
          (beginning-of-buffer)
          (setq ret t)))
    ret))

(defun tellme-java-code-rules ()
  "Java regular expression for search and extract code rulse.

Returns ((expression)(rules))."
  '(
    (
     '(concat "^" tellme-java-keyword-import ".*;")
     '(progn
        (let* ((ret ()) class-code class-text class-key class-name)

          (setq class-code (substring code 7 -1))
          (setq class-text (car (last (split-string class-code "\\."))))
          (setq class-key (downcase class-text))
          (setq class-name class-code)

          (push (tellme-encode code) ret) ; code
          (push class-text ret) ; text
          (push class-key ret) ; key
          (push class-name ret) ; name
          ret)))))
;;; Ends here for java

;;; For c++
(defun tellme-cpp-to-be-found-code (code)
  "Create code list to be found. "
  (list code))

(defun tellme-cpp-go-place (keyword)
  "Go to the palce where going to be code.

Find place by keyword. "
  (let* ((curKeywordValue (eval keyword) )
         ret)
    (if (eq curKeywordValue tellme-cpp-keyword-include)
        (progn
          (when (search-backward tellme-cpp-keyword-include nil t)
            (tellme-end-new-indent-line)
            (setq ret t))))
    (if (eq curKeywordValue tellme-cpp-keyword-none)
        (progn
          (beginning-of-buffer)
          (setq ret t)))
    ret))

(defun tellme-cpp-code-rules ()
  "Java regular expression for search and extract code rulse.

Returns ((expression)(rules))."
  '(
    (
     '(concat "^" tellme-cpp-keyword-include " .*[\">]")
     '(progn
        (let* ((ret ()) class-code class-text class-key class-name)

          (setq class-code (substring code 10 -1))
          (setq class-text (first (split-string class-code "\\.")))
          (setq class-key (downcase class-text))
          (setq class-name class-code)

          (push (tellme-encode code) ret) ; code
          (push class-text ret) ; text
          (push class-key ret) ; key
          (push class-name ret) ; name
          ret)))))
;;; Ends here for c++

;;; For python
(defun tellme-python-to-be-found-code (code)
  "Create code list to be found. "
  (list code))

(defun tellme-python-go-place (keyword)
  "Go to the palce where going to be code.

Find place by keyword. "
  (let* ((curKeywordValue (eval keyword) )
         ret)
    (if (or (eq curKeywordValue tellme-python-keyword-import)
            (eq curKeywordValue tellme-python-keyword-from))
        (progn
          (when (search-backward-regexp (concat "\\("
                                                tellme-python-keyword-import
                                                "\\|"
                                                tellme-python-keyword-from
                                                "\\)")
                                        nil t )
            (tellme-end-new-indent-line)
            (setq ret t))))
    (if (eq curKeywordValue tellme-python-keyword-path)
        (progn
          (when (search-backward tellme-python-keyword-path nil t)
            (tellme-end-new-new-indent)
            (setq ret t))))
    (if (eq curKeywordValue tellme-python-keyword-none)
        (progn
          (beginning-of-buffer)
          (setq ret t)))
    ret))

(defun tellme-python-code-rules ()
  "Java regular expression for search and extract code rulse.

Returns (((expression)(rules))...)."
  '(
    (
     '(concat "^" tellme-python-keyword-from " .*$")
     '(progn
        (let* ((ret ()) class-code class-text class-key class-name
               split-string-list)

          (setq split-string-list (split-string code " "))

          (setq class-code (substring code 6 -1))
          (setq class-text (nth 3 split-string-list))
          (setq class-key (downcase class-text))
          (setq class-name (concat (nth 1 split-string-list)
                                   "."
                                   class-text))

          (push (tellme-encode code) ret) ; code
          (push class-text ret) ; text
          (push class-key ret) ; key
          (push class-name ret) ; name
          ret))
     )
    (
     '(concat "^" tellme-python-keyword-import " .*$")
     '(progn
        (let* ((ret ()) class-code class-text class-key class-name
               split-string-list)

          (setq split-string-list (split-string code " "))

          (setq class-code (nth 1 split-string-list))
          (setq class-text class-code)
          (setq class-key (downcase class-text))
          (setq class-name class-code)

          (push (tellme-encode code) ret) ; code
          (push class-text ret) ; text
          (push class-key ret) ; key
          (push class-name ret) ; name
          ret))
     )
    )

  )
;;; ends here for python

;;;; ends here Tellme
