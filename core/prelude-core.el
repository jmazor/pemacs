;;; prelude-core.el
;; pretty much just byte compiles before hand
;; this is where I would put search engine functions if i wanted

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory e-dir 0))

(provide 'prelude-core)
;;; prelude-core.el ends here
