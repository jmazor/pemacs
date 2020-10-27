;; prelude-ui.el My custom Emacs UI config
;; TODO redo modline bar. Will display line number there

;; remove Toolbar
(tool-bar-mode -1)

;; remove scroll bar
(toggle-scroll-bar -1)

;; remove blinking cursor
(blink-cursor-mode -1)

;; disable bell
(setq ring-bell-function 'ignore)

;; disable splash screen
(setq inhibit-splash-screen t)


(unless (display-graphic-p)
  ;; adds a margin in the terminal
  (add-hook 'window-configuration-change-hook
            (lambda ()
              (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 1 0)))
  (menu-bar-mode -1))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Defualt Gruvboxtheme
(load-theme 'gruvbox-dark-hard t)

;; We deal with doom-modeline here instead of modules
;; This looks really nice so I will be keeping it and modifiying it as long as it doesnt slow me down
;; Its seems fast however
(require 'all-the-icons)
(require 'doom-modeline)
(doom-modeline-mode 1)

(provide 'prelude-ui)
;;; prelude-ui.el ends here
