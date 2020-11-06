;; Justin Mazors -- init.el
;; Heavily based on prelude emacs
;; Goals are to make it more minimal, customized, and learn.
;; 
;; Copyright (c) 2011-2020 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.1.0-snapshot
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file simply sets up the default load path and requires
;; the various modules defined within Emacs Prelude.

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


;; TODO create a .gitattributes
;; TODO move .gnus.el into directory

;; TODO semantic mode vs irony mode

;; How does semantic and c headers compare to Irony

;; Always load newest byte-code
(setq load-prefer-newer t)

;; Define Emacs Directory Structure
(defvar e-dir (file-name-directory load-file-name)
  "Root dir of emacs config.")
(defvar core-dir (expand-file-name "core" e-dir)
  "Built in emacs configs.")
(defvar modules-dir (expand-file-name "modules" e-dir)
  "All package configs.")
(defvar vendor-dir (expand-file-name "vendor" e-dir)
  "Packages not in MELPA.")
(defvar savefile-dir (expand-file-name "savefile" user-emacs-directory)
  "This is for all automatic save/history-files.")
(defvar modules-file (expand-file-name "modules.el" modules-dir))


(unless (file-exists-p savefile-dir)
  (make-directory savefile-dir))

(add-to-list 'load-path core-dir)
(add-to-list 'load-path modules-dir)
(add-to-list 'load-path vendor-dir)

;; TODO do we want to change frequency of garbage collection

;; warn when openenig files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; modules
(require 'prelude-packages)
;; load the core
(require 'prelude-ui)
(require 'prelude-core)
(require 'prelude-editor)
(require 'prelude-keybinds)

;; module configs
(require 'modules)

(setq custom-file (expand-file-name "custom.el" core-dir))
;; I know this file will always exist but not in every config
(when (file-exists-p custom-file)
(load custom-file))
;;; init.el ends here
