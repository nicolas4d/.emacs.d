;; test emacs-lisp
(setq mode-info-list
      '(emacs-lisp-mode
        tellme-elisp-keyword-list
        tellme-elisp-full-code
        tellme-elisp-go-place
        tellme-elisp-new-snippet
        tellme-elisp-find-code
        tellme-elisp-regexp-list
        (((eval (concat "(" tellme-elisp-keyword-require " '.*)"))
          . (substring code 10 -1)))
        ))

(tellme-keyword-list (nth 0 tellme-mode-info-list))
(tellme-support-major-mode-p)
(tellme-code "code" mode-info-list)
(tellme "code")

(tellme-elisp-code-rules)

(setq code-rules (funcall (eval 'tellme-code-rules-function)))
(setq tell-test (eval (eval (car (car code-rules)))))
(search-forward-regexp tell-test nil t)
(eval (eval (car (cdr (car code-rules)))))
(tellme-snippet-search)
(tellme-new-snippet)

(progn
  (shell-command "rm -r ~/.emacs.d/snippets/emacs-lisp-mode/tellme")
  (yas-reload-all)
  )



(require 'tellme-test)
tellme-test
(require 'tellme"me")
tellme"me"

(if '()
    (insert "i")
)


(setq code-list '(tellme"me"))
(tellme-list-to-string code-list)



(progn
  (setq cur-regexp (concat "(" tellme-elisp-keyword-require " '.*)"))
  (search-forward-regexp cur-regexp nil t)
  (setq endPoint (point))
  (search-backward-regexp cur-regexp nil t)
  (setq startPoint (point))
  (search-forward-regexp cur-regexp nil t)
  (setq code (buffer-substring-no-properties startPoint endPoint))
  )


(setq tellme-test "(require 'sdf)")
(substring tellme-test  10 -1)




(tellme-escape-for-write "abcd\"")
(string "sds\"df" "")
(mapconcat 'identity (split-string "sds\"df" "") "")

(regexp-quote (regexp-quote "\""))

(setq tellme-test (list "d"))
(append "dd" tellme-test)

(append (string 66) ())



(string-to-list "abc\"def")


;; java test
(with-current-buffer (current-buffer)
  (ignore-errors
    (java-mode)
    (newline)
    (newline)
    (insert "import tellme.Test;")
    (tellme-new-snippet)
    )
  (emacs-lisp-mode))
