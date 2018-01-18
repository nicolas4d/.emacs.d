;; org-mode config
(with-eval-after-load 'org
  ;;  (setq org-src-fontify-natively t)

  ;;agenda
  ;;  (setq org-agenda-files '("~/.emacs.d/"))  
  ;; code is not working , 
  ;; use custom is working 

  ;;capture
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
           "* TODO [#B] %?\n  %i\n"
	   :empty-lines 1)))
  )

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

(global-set-key (kbd "C-c a") 'org-agenda)

;; remember
(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-org)

