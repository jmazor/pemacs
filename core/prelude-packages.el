;;; prelude-packages.el --- Emacs Prelude: default package selection.
;;
;; Copyright © 2011-2020 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Takes care of the automatic installation of all the packages required by
;; Emacs Prelude.  This module also adds a couple of package.el extensions
;; and provides functionality for auto-installing major modes on demand.

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

;;;; Package setup and additional utility functions

;; accessing a package repo over https on Windows is a no go, so we
;; fallback to http there
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; set package-user-dir to be relative to Prelude install path
(setq package-user-dir (expand-file-name "elpa" e-dir))
(package-initialize)

(defvar prelude-packages
  '(;;avy
    ;;anzu
    all-the-icons
    browse-kill-ring
    company
    company-c-headers
    crux
    dashboard
    discover-my-major
    diff-hl
    doom-modeline
    eglot
    flycheck
    gist
    git-timemachine
    gitconfig-mode
    gitignore-mode
    guru-mode
    google-c-style
    gruvbox-theme
    hl-todo
    ivy
    counsel
    swiper
    sublimity
    ;;imenu-anywhere
    projectile
    pdf-tools
    magit
    operate-on-number
    rainbow-delimiters
    super-save
    treemacs
    treemacs-icons-dired
    undo-tree
    which-key
    yasnippet
    yasnippet-snippets)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  "Check if all packages in `prelude-packages' are installed."
  (cl-every #'package-installed-p prelude-packages))

(defun prelude-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package prelude-packages)
    (add-to-list 'prelude-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun prelude-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'prelude-require-package packages))

(defun prelude-install-packages ()
  "Install all packages listed in `prelude-packages'."
  (unless (prelude-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Prelude is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (prelude-require-packages prelude-packages)))

;; run package installation
(prelude-install-packages)


(provide 'prelude-packages)
;; Local Variables:
;; byte-compile-warnings: (not cl-functions)
;; End:

;;; prelude-packages.el ends here
