;; Hippie
(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol)
      )

;; yasnippet
;; suppress when change currunt buffer
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))

(global-company-mode)
