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

;; nicer scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; We deal with doom-modeline here instead of modules
;; This looks really nice so I will be keeping it and modifiying it as long as it doesnt slow me down
;; Its seems fast however
(require 'all-the-icons)

(treemacs-icons-dired-mode)

(require 'doom-modeline)
;; When in windowed mode
(when (display-graphic-p)
  (doom-modeline-mode 1))
;; No Window mode (in terminal)
(unless (display-graphic-p)
  ;; adds a margin in the terminal
  (add-hook 'window-configuration-change-hook
            (lambda ()
              (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 1 0)))
  (menu-bar-mode -1)
  )

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Defualt Gruvboxtheme
(load-theme 'gruvbox-dark-hard t)



(provide 'prelude-ui)
;;; prelude-ui.el ends here
