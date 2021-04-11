;; (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
;; ("org" . "http://elpa.emacs-china.org/org/")))

(defvar emacs-or-space nil
  "emacs if value is t.
spacemacs if value is nil"
  )

;;; proxy
;; my-proxy is my machine's proxy
;; (setq my-proxy `http://127.0.0.1:8118)

;; (defun show-proxy ()
;;   "Show http/https proxy."
;;   (interactive)
;;   (if url-proxy-services
;;       (message "Current proxy is \"%s\"" my-proxy)
;;     (message "No proxy")))

;; (defun set-proxy ()
;;   "Set http/https proxy."
;;   (interactive)
;;   (setq url-proxy-services `(("http" . ,my-proxy)
;;                              ("https" . ,my-proxy)))
;;   (show-proxy))

;; (set-proxy)

;;; end of proxy.

;; load configurations
(if emacs-or-space
     ;; emacs
    (load-file (concat user-emacs-directory "init/emacs.el"))
  ;; spacemacs
  (load-file (concat user-emacs-directory "init/spacemacs.el")))
