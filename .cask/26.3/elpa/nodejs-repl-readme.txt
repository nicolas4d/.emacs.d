This program is derived from comint-mode and provides the following features.

 * TAB completion same as Node.js REPL
 * file name completion in string
 * incremental history search


Put this file in your Emacs lisp path (e.g. ~/.emacs.d/site-lisp)
and add the following line to your .emacs:

   (require 'nodejs-repl)

Type M-x nodejs-repl to run Node.js REPL.
See also `comint-mode' to check key bindings.

You can define key bindings to send JavaScript codes to REPL like below:

    (add-hook 'js-mode-hook
              (lambda ()
                (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
                (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
                (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
                (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))

When a version manager such as nvm is used to run different versions
of Node.js, it is often desirable to start the REPL of the version
specified in the .nvmrc file per project.  In such case, customize the
`nodejs-repl-command` variable with a function symbol.  That function
should query nvm for the Node.js command to run.  For example:

    (require 'nodejs-repl)
    (defun nvm-which ()
      (let* ((shell (concat (getenv "SHELL") " -l -c 'nvm which'"))
             (output (shell-command-to-string shell)))
        (cadr (split-string output "[\n]+" t))))
    (setq nodejs-repl-command #'nvm-which)

The `nvm-which` function can be simpler, and perhaps can run faster,
too, if using Bash:

    (defun nvm-which ()
      (let ((output (shell-command-to-string "source ~/.nvm/nvm.sh; nvm which")))
        (cadr (split-string output "[\n]+" t))))
