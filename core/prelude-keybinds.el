;;; prlude-keybinds.el --- My personal keybindings

;; TODO A workflow friendly keybind that uses completion from company semantics and eglot?

;; TODO Move between windows

;; TODO Less aggressive C-x Backspace?

;; Open eshell
(global-set-key (kbd "C-x m") 'eshell)

;; Opens gnus keep this as long as it doesnt interfere with cancel
(global-set-key (kbd "C-x g") 'gnus)

;; Enables sublimity mode keep as long as no C-x p + ...
(global-set-key (kbd "C-x p") 'sublimity-mode)

;; TODO Jump to def/ref keybind (with or without eglot?)

(provide 'prelude-keybinds)
;;; prelude-keybinds ends here
