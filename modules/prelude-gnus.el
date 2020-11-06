;;; prelude-gnus.el
;; Not part of prelude

;; Open links via eww in gnus
(add-hook 'gnus-started-hook
          (lambda()
            (setq browse-url-browser-function 'eww-browse-url)
            ))
(provide 'prelude-gnus)
;;; prelude-gnus.el ends here

