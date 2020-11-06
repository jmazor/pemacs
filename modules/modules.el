;;; modules.el --- module config
;;; prelude-modules.el --- A listing of modules to load on startup
;;
;; Copyright © 2011-2020 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file is just a list of Prelude modules to load on startup.
;; For convenience the modules are grouped in several categories.
;; The prelude-modules.el in the samples folder should be copied
;; to your personal folder and edited there.

;; Note that some modules can't be used together - e.g. you shouldn't
;; enable both prelude-ido and prelude-ivy, as they serve the same
;; purpose.

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

;;; Uncomment the modules you'd like to use and restart Prelude afterwards
;; TODO org agenda
;; TODO C style
;; TODO Test Company Irony vs semantics and headers

;; You can comment out any module you do not want.
(require 'prelude-ivy)
(require 'prelude-company) ;; has semantic mode
(require 'modeline)
(require 'prelude-org)
(require 'prelude-prog)
(require 'prelude-lisp)
(require 'prelude-yasnippet)

;; vendors
(require 'cpplint)

;; post c style
(require 'prelude-c)

;; gnus reader
(require 'prelude-gnus)

(provide 'modules)
;;; modules.el ends here
