;;; abbrev
(setq-default abbrev-mode t)

(define-abbrev-table 'global-abbrev-table '(
                                            ("n4d" "nicolas4d")
                                            ))
;;; abbrev ends here


;;; dired

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)


;; 单个缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 拷贝，两个窗口时自动选择另一个窗口
(setq dired-dwin-target 1)

;;; dired ends here

(setq spacemacs/key-binding-prefixes '(("a"   "applications")
                                       ("ai"  "irc")
                                       ("as"  "shells")
                                       ("b"   "buffers")
                                       ("c"   "compile/comments")
                                       ("C"   "capture/colors")
                                       ("e"   "errors/edit")
                                       ("f"   "files")
                                       ("fC"  "files/convert")
                                       ("fe"  "emacs(spacemacs)")
                                       ("fv"  "variables")
                                       ("g"   "git/versions-control")
                                       ("h"   "help")
                                       ("hd"  "help-describe")
                                       ("i"   "insertion")
                                       ("j"   "jump/join/split")
                                       ("k"   "lisp")
                                       ("kd"  "delete")
                                       ("kD"  "delete-backward")
                                       ("k`"  "hybrid")
                                       ("n"   "narrow/numbers")
                                       ("o"   "org")
                                       ("p"   "projects")
                                       ("p$"  "projects/shell")
                                       ("q"   "quit")
                                       ("r"   "registers/rings/resume")
                                       ("Re"  "elisp")
                                       ("Rp"  "pcre")
                                       ("s"   "search/symbol")
                                       ("sa"  "ag")
                                       ("sg"  "grep")
                                       ("sk"  "ack")
                                       ("st"  "pt")
                                       ("sw"  "web")
                                       ("t"   "toggles")
                                       ("tC"  "colors")
                                       ("tE"  "editing-styles")
                                       ("th"  "highlight")
                                       ("tm"  "modeline")
                                       ("T"   "UI toggles/themes")
                                       ("C-t" "other toggles")
                                       ("w"   "windows")
                                       ("wp"  "popup")
                                       ("x"   "text")
                                       ("xa"  "align")
                                       ("xd"  "delete")
                                       ("xg"  "google-translate")
                                       ("xl"  "lines")
                                       ("xm"  "move")
                                       ("xt"  "transpose")
                                       ("xw"  "words")
                                       ("z"   "zoom")))
(mapc (lambda (x) (apply #'spacemacs/declare-prefix x))
      spacemacs/key-binding-prefixes)
