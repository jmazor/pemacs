;;; modules.el --- module config
;; TODO org agenda flyspell (not in prog modes)
;; TODO add a prelude-prog
;;FIXME remove flycheck from prelude-c


(require 'prelude-ivy)
(require 'prelude-company)
;; TODO do I need company c headers
(require 'prelude-org)
;; (require 'prelude-prog)
(require 'prelude-lisp)
(require 'prelude-c)
(require 'prelude-eglot)
(require 'prelude-yasnippet)

;; vendors
(require 'cpplint)

(provide 'modules)
;;; modules.el ends here
