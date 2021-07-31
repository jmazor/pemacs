;;; prelude-ui.el --- My custom Emacs UI config
;;
;; Copyright © 2011-2020 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude

;; This file is not part of GNU Emacs.

;;; Commentary:

;; We dispense with most of the point and click UI, reduce the startup noise,
;; configure smooth scolling and a nice theme that's easy on the eyes

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; remove Toolbar
(tool-bar-mode -1)

;; remove Menu bar
(menu-bar-mode -1)

;; remove scroll bar
(toggle-scroll-bar -1)

;; remove blinking cursor
(blink-cursor-mode -1)

;; disable bell
(setq ring-bell-function 'ignore)

;; disable splash screen
(setq inhibit-splash-screen t)

;; nicer scrolling
(setq scroll-margin 0)

(require 'sublimity)
(require 'sublimity-attractive)

;; We deal with doom-modeline here instead of modules
;; This looks really nice so I will be keeping it and modifiying it as long as it doesnt slow me down
;; Its seems fast however
(require 'all-the-icons)

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
  )

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Defualt Gruvboxtheme
(load-theme 'gruvbox-dark-hard t)

(treemacs-icons-dired-mode)

;; Set Default Font
(set-face-attribute 'default nil :font "Ubuntu Mono-14")

;; I will deal with doom modeline here untill it gets out of hand
(setq doom-modeline-gnus t)

;; FIXME This hangs my emacs depending on the number of RSS feeds
(setq doom-modeline-gnus-timer 5)

;; Wheter groups should be excludede when gnus automatically being updated.
;; (setq doom-modeline-gnus-excluded-groups '("dummy.group"))

;; Make Doom modeline look good
(setq doom-modeline-height 20)
(set-face-attribute 'mode-line nil :family "Ubuntu Mono" :height 115)
(set-face-attribute 'mode-line-inactive nil :family "Ubuntu Mono" :height 115)

(provide 'prelude-ui)
;;; prelude-ui.el ends here
