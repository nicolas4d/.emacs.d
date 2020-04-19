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
  (shell-command "mv ~/.emacs.d/snippets/emacs-lisp-mode/tell-test ~/trash")
  (yas-reload-all)
  )

tell-test

;; java test
(with-current-buffer (current-buffer)
  (ignore-errors
    (java-mode)
    (newline)
    (newline)
    (insert "import tellme.Test;")
    (tellme-new-snippet)
    )
  (emacs-lisp-mode)
  )

