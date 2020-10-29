;;; prelude-c.el --- Emacs Prelude: cc-mode configuration.
;;
;; Copyright © 2011-2020 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for cc-mode and the modes derived from it.

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

(require 'prelude-prog)
(require 'google-c-style)

;; Sets google c style
(add-hook 'c-mode-common-hook 'google-set-c-style)
;; Automatically connect to ccls lsp server
(add-hook 'c-mode-common-hook 'eglot-ensure)

;; While I enjoy how minimal eglot is my reason for not using lsp-mode is I could not get cpplint flycheck to coexist
;; Eglot uses flymake so flymake and flycheck are being run
;; Please note I use  cpplint flycheck as an educative resource. I turn it off when reading code I did not write (for obvious reasons)
;; I do not have any intention at them moment to auto format programs other than enabling c style

;; TODO test company c irony

(provide 'prelude-c)
;;; prelude-c.el ends here
