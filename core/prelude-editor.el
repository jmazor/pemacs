;;; prelude-editor.el
;; Text editing settings like tabs
;; also contorls backups

(setq-default indent-tabs-mode nil) ;; no tabs
(setq-default tab-width 8)          ;;but add spaces

(delete-selection-mode t)

;; store all backups and autosaves in savedir
(setq backup-directory-alist
      `(("." . ,savefile-dir)))

(setq auto-save-file-name-transforms
      `(("." ,temporary-file-directory t)))      

;; autosave undo-tree history
(setq undo-tree-history-directory-alist
      `(("." . ,savefile-dir)))
(setq undo-tree-auto-save-history t)

;; automatically revert buffers if files are changed
(global-auto-revert-mode t)

;;TODO hippie expand maybe one day

;; smart tab behavior
(setq tab-always-indent 'complete)

;; show parenthesis
(show-paren-mode 1)
(setq blink-matching-paren nil)

;; electric pair
(electric-pair-mode 1)


;; saveplace in file
(setq save-place-file (expand-file-name "saveplace" savefile-dir))
(save-place-mode 1)

(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" savefile-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 15
      ;; disable on start for errors
      recentf-auto-cleanup 'never)
(recentf-mode +1)

(require 'super-save)
(super-save-mode +1)

;; highlight line
(global-hl-line-mode +1)


(require 'tramp)
(set-default 'imenu-auto-rescan t)

;; enable flyspell
(require 'flyspell)
(add-hook 'find-file-hook 'turn-on-flyspell)


(require 'projectile)
(setq projectile-cache-file (expand-file-name "projectile.cache" savefile-dir))
(projectile-mode t)

;; always delete and copy recursive
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(require 'eshell)
(setq eshell-directory-name (expand-file-name "eshell" savefile-dir))
(setq semanticdb-default-save-directory
      (expand-file-name "semanticdb" savefile-dir))

;; cool compile stuff
(require 'compile)
(setq compilation-ask-about-save nil
      compilation-always-kill t
      compilation-scroll-output 'first-error
      )

;; undo tree
(global-undo-tree-mode)

(provide 'prelude-editor)
