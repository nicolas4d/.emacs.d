;; malpa config
(require 'package)
(add-to-list 'package-archives
;;	     '("melpa" . "http://melpa.org/packages/") t)
	     '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives
;;	       '("gnu" . "http://elpa.gnu.org/packages/")))
	       '("gnu" . "http://elpa.emacs-china.org/gnu/")))

;; omnisharp config
(setq omnisharp-server-executable-path "C:\\Users\\D\\Program Files\\omnisharp-win-x64-netcoreapp1.1\\OmniSharp.exe")

;; company cofig
(global-company-mode t)

;; recentf config 
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; config smex
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.

;; config ivy swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; smartparens config
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; nodejs-repl config 
(require 'nodejs-repl)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; cofig popwin
(require 'popwin)  ;; when require, 
(popwin-mode t)

;; cofig for web-mode
;; set indent to 2 
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; switch indent
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; config js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
;;(js2r-add-keybindings-with-prefix "C-c C-m")

;; config imenu
(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
        ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
        (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                                   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                                   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
              (lambda ()
                (setq imenu-create-index-function 'js2-imenu-make-index)))

;; expand-regions
(global-set-key (kbd "C-=") 'er/expand-region)

;; sourcekit
(if (string= system-type "darwin")
    ((require 'company-sourcekit)
     (add-to-list 'company-backends 'company-sourcekit))
    )

;; auto-java-complete
;(add-to-list 'load-path "~/.emacs.d/ajc-java-complete/")
;(require 'ajc-java-complete-config)
;(add-hook 'java-mode-hook 'ajc-java-complete-mode)
;(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

;;(require 'eclim)
;;(global-eclim-mode)
;;(require 'eclimd)

;;eclim and eclipse path
;;(custom-set-variables
;;  '(eclim-eclipse-dirs '("/home/d/ProgramFiles/eclipse"))
;;  '(eclim-executable "/home/d/ProgramFiles/eclipse/eclim")
;;  )

;;(setq help-at-pt-display-when-idle t)
;;(setq help-at-pt-timer-delay 0.1)
;;(help-at-pt-set-timer)

;; eclim company
;;(require 'company)
;;(require 'company-emacs-eclim)
;;(company-emacs-eclim-setup)
;;(global-company-mode t)

;; eclim
;;(require If you want to control eclimd from emacs, also add:eclim)
;;(setq eclimd-autostart t)

;;(defun my-java-mode-hook ()
;;    (eclim-mode t))

;;(add-hook 'java-mode-hook 'my-java-mode-hook)


;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

;; plantuml in org-mode
(add-to-list
  'org-src-lang-modes '("plantuml" . plantuml))

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
(setq org-plantuml-jar-path
      (expand-file-name "/home/d/ProgramFiles/pantuml/plantuml.jar"))


;; provide features
(provide 'init-packages)
