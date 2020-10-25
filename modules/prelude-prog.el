(require 'which-func)
(which-function-mode 1)

(require 'hl-todo)
(global-hl-todo-mode 1)

(defun prelude-prog-mode-defaults ()
  "Default coding hook, useful with any programming language."
  (flyspell-prog-mode)
  ;; Do something else
 )

(setq prelude-prog-mode-hook 'prelude-prog-mode-defaults)

(add-hook 'prog-mode-hook (lambda ()
                            (run-hooks 'prelude-prog-mode-hook)))

;; enable on-the-fly syntax checking
(if (fboundp 'global-flycheck-mode)
    (global-flycheck-mode +1)
  (add-hook 'prog-mode-hook 'flycheck-mode))

(provide 'prelude-prog)
