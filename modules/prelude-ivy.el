;; prelude-ivy.el

(require 'ivy)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


(setq projectile-completion-system 'ivy)
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x l") 'counsel-locate)

(provide 'prelude-ivy)
;;; prelude-ivy.el ends here
