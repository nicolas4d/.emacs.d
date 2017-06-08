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
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; nodejs-repl config 
(require 'nodejs-repl)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; cofig popwin
(require 'popwin)  ;; when require, 
(popwin-mode t)


;; provide features
(provide 'init-packages)
