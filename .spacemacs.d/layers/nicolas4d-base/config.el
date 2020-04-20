;;; abbrev
(setq-default abbrev-mode t)

(define-abbrev-table 'global-abbrev-table '(
                                            ("n4d" "nicolas4d")
                                            ))
;;; abbrev ends here

(advice-add 'dotspacemacs/user-config :after #'nicolas4d-base/user-config)


