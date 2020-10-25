;; cpplint.el
;; Adds google lint checker to flycheck

(require 'flycheck-google-cpplint)
;; Add Google C++ Style checker.
;; In default, syntax checked by Clang and Cppcheck.
(flycheck-add-next-checker 'c/c++-cppcheck
                           '(warning . c/c++-googlelint))
(custom-set-variables
  ;; set this value to where your cpplint.py is. /bin/cpplint through pip
 '(flycheck-c/c++-googlelint-executable "/home/justin/Templates/cpplint/cpplint.py")
 '(flycheck-googlelint-filter "+whitespace, -whitespace/line_length"))

(provide 'cpplint)
