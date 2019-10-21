 Setup:
  "Ctags" (Universal Ctags is recommended) should exist.
  "GNU Find" is used if it's installed but it's optional.
  Or else, customize `counsel-etags-update-tags-backend' to generate tags file

Usage:

  `counsel-etags-find-tag-at-point' to navigate.  This command will also
  run `counsel-etags-scan-code' AUTOMATICALLY if tags file is not built yet.

  Run `counsel-etags-list-tag-in-current-file' to list tags in current file.

  `counsel-etags-scan-code' to create tags file
  `counsel-etags-grep' to grep
  `counsel-etags-grep-current-directory' to grep in current directory
  `counsel-etags-recent-tag' to open recent tag
  `counsel-etags-find-tag' to two steps tag matching use regular expression and filter
  `counsel-etags-list-tag' to list all tags
  `counsel-etags-update-tags-force' to update current tags file by force

Tips:
- Add below code into "~/.emacs" to AUTOMATICALLY update tags file:

  ;; Don't ask before reloading updated tags files
  (setq tags-revert-without-query t)
  ;; NO warning when loading large tag files
  (setq large-file-warning-threshold nil)
  (add-hook 'prog-mode-hook
    (lambda ()
      (add-hook 'after-save-hook
                'counsel-etags-virtual-update-tags 'append 'local)))

- You can use ivy's exclusion patterns to filter candidates.
  For example, input "keyword1 !keyword2 keyword3" means:
  "(keyword1 and (not (or keyword2 keyword3)))"

- `counsel-etags-extra-tags-files' contains extra tags files to parse.
  Set it like,
    (setq counsel-etags-extra-tags-files
          '("./TAGS" "/usr/include/TAGS" "$PROJ1/include/TAGS"))

  Files in `counsel-etags-extra-tags-files' have only symbol with absolute path.

- You can set up `counsel-etags-ignore-directories' and `counsel-etags-ignore-filenames',
  (eval-after-load 'counsel-etags
    '(progn
       ;; counsel-etags-ignore-directories does NOT support wildcast
       (add-to-list 'counsel-etags-ignore-directories "build_clang")
       (add-to-list 'counsel-etags-ignore-directories "build_clang")
       ;; counsel-etags-ignore-filenames supports wildcast
       (add-to-list 'counsel-etags-ignore-filenames "TAGS")
       (add-to-list 'counsel-etags-ignore-filenames "*.json")))

 - Rust programming language is supported.
   The easiest setup is to use ".dir-locals.el".
  in root directory.  The content of .dir-locals.el" is as below,
  ((nil . ((counsel-etags-update-tags-backend . (lambda (src-dir) (shell-command "rusty-tags Emacs")))
           (counsel-etags-tags-file-name . "rusty-tags.emacs"))))

 - User could use `counsel-etags-convert-grep-keyword' to customize grep keyword.
   Below setup enable `counsel-etags-grep' to search Chinese using pinyinlib,

   (unless (featurep 'pinyinlib) (require 'pinyinlib))
   (setq counsel-etags-convert-grep-keyword
     (lambda (keyword)
       (if (and keyword (> (length keyword) 0))
           (pinyinlib-build-regexp-string keyword t)
         keyword)))

 - `counsel-etags-find-tag-name-function' finds tag name at point.  If it returns nil,
   `find-tag-default' is used.  `counsel-etags-word-at-point' gets word at point.

 - User could append the extra content into tags file in `counsel-etags-after-update-tags-hook'.
   The parameter of hook is full path of the tags file.  `counsel-etags-tags-line' is a tool function
   to help user

See https://github.com/redguardtoo/counsel-etags/ for more tips.
