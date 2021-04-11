;;; github-search-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "github-search" "github-search.el" (0 0 0 0))
;;; Generated autoloads from github-search.el

(autoload 'github-search-user-clone-repo "github-search" "\
Query github using SEARCH-STRING and clone the selected repository.

\(fn SEARCH-STRING)" t nil)

(autoload 'github-search-clone-repo "github-search" "\
Query github using SEARCH-STRING and clone the selected repository.

\(fn SEARCH-STRING)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "github-search" '("github-search-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; github-search-autoloads.el ends here
