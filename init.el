;; Justin Mazors -- init.el
;; Heavily based on prelude emacs
;; Goals are to make it more minimal, customized, and learn.

;; -----------------------
;; Initialization
;; -----------------------


;; TODO Is this needed
;; TODO Automatic byte compile
;; Always load newest byte-code
(setq load-prefer-newer t)

;; warn when openenig files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; Setup package repo
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; TODO set custom things

;; -----------------------
;; UI Configuration
;; -----------------------

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

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Defualt Gruvboxtheme
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard t))

;; TODO (treemacs-icons-dired-mode)

;; Set Default Font
;; TODO write a script to automatically isntall this font, if not found
(set-face-attribute 'default nil :font "Ubuntu Mono-14")

(use-package doom-modeline
  :ensure t
  :config
  (setq doom-modeline-height 25
        doom-modeline-gnus t
        doom-modeline-gnus-timer 5)
  (doom-modeline-mode 1)
  (set-face-attribute 'mode-line nil :family "Ubuntu Mono" :height 115)
  (set-face-attribute 'mode-line-inactive nil :family "Ubuntu Mono" :height 115))


;; -----------------------
;; Editor Configuration
;; -----------------------

;; Newline at end of file
(setq require-final-newline t)

;; Change tabs to spaces
(setq-default indent-tabs-mode nil)

;; smart tab behavior
(setq tab-always-indent 'complete)

;; Selected text is deleted when typing
(delete-selection-mode t)

;; TODO bookmarks seem cool

;; Directory for History Files
(defvar savefile-dir (expand-file-name "savefile" user-emacs-directory)
  "This is for all automatic save/history-files.")

(unless (file-exists-p savefile-dir)
  (make-directory savefile-dir))

;; store all backups and autosaves in savedir
(setq backup-directory-alist
      `(("." . ,savefile-dir)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      kept-old-versions 2               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 4               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;; Prepending the temp file directory seems to work
;; I have no idea what this function really does though
;; FIXME what the fuck does this do
(setq auto-save-file-name-transforms
  (cons `(,(car (car auto-save-file-name-transforms)) 
          ,(concat temporary-file-directory "\\2") t) auto-save-file-name-transforms))


;; undo tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  :config
  ;; FIXME Undo tree saves a bunch of empty files and semantic goes through them
  ;; autosave undo-tree history
  (setq undo-tree-history-directory-alist
        `(("." . ,savefile-dir)))
  (setq undo-tree-auto-save-history t))


;; automatically revert buffers if files are changed
(global-auto-revert-mode t)

;;TODO hippie expand maybe one day

;; show parenthesis
(show-paren-mode 1)
(setq blink-matching-paren nil)

;; electric pair
(electric-pair-mode 1)

;; saveplace in file
(setq save-place-file (expand-file-name "saveplace" savefile-dir))
(save-place-mode 1)

;; highlight line
(global-hl-line-mode +1)

(setq dired-recursive-deletes 'top)
(setq dired-recursive-copies 'always)

; -----------------------
;; Package Configurations
;; -----------------------

;; Super-save mode automatically saves your buffer when it loses focus
(use-package super-save
  :ensure t
  :config
  (super-save-mode +1))

;; Cool compile stuff
(use-package compile
  :ensure t
  :config
  (setq compilation-ask-about-save nil
        compilation-always-kill t
        compilation-scroll-output 'first-error))

;; enable flyspell
(use-package flyspell
  :ensure t
  :config
  (add-hook 'find-file-hook 'turn-on-flyspell))


;; TODO try helm ido etc
(use-package ivy
  :ensure t
  :demand
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq projectile-completion-system 'ivy))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper-isearch))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x l" . counsel-locate)))

(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.5
        company-show-numbers t
        company-tooltip-limit 10
        company-minimum-prefix-length 2
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t)
  :config
  (global-company-mode 1)
  (add-to-list 'company-backends 'company-c-headers)
  (setq company-c-headers-path-system '("/usr/include/c++/13/")))


(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode 1))

;; TODO FIXME prelude-prog mode

;; TODO Flycheck stuff

;; TODO Gnus?



(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config
  (treemacs-icons-dired-mode))

(defvar my/current-line '(0 . 0)
  "(start . end) of current line in current buffer")
(make-variable-buffer-local 'my/current-line)

(defun my/unhide-current-line (limit)
  "Font-lock function"
  (let ((start (max (point) (car my/current-line)))
        (end (min limit (cdr my/current-line))))
    (when (< start end)
      (remove-text-properties start end '(invisible t display "" composition ""))
      (goto-char limit)
      t)))

(defun my/refontify-on-linemove ()
  "Post-command-hook"
  (let* ((start (line-beginning-position))
         (end (line-beginning-position 2))
         (needs-update (not (equal start (car my/current-line)))))
    (setq my/current-line (cons start end))
    (when needs-update
      (font-lock-fontify-block 2))))

(defun my/markdown-unhighlight ()
  "Install"
  (font-lock-add-keywords nil '((my/unhide-current-line)) t)
  (add-hook 'post-command-hook #'my/refontify-on-linemove nil t))

(add-hook 'org-mode-hook #'my/markdown-unhighlight)


;; Configuration for olivetti-mode
(use-package olivetti
  :ensure t
  :hook (text-mode . olivetti-mode))

;; Configuration for org-mode
;; Combined Configuration for org-mode
(use-package org
  :config
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.5))
  (setq org-toggle-pretty-entities t)
  (setq org-indent-indentation-per-level 1
        org-adapt-indentation nil
        org-hide-leading-stars t
        org-cycle-separator-lines 1)
  (customize-set-variable 'org-blank-before-new-entry 
                          '((heading . nil)
                            (plain-list-item . nil))))





;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(olivetti treemacs-icons-dired undo-tree super-save hl-todo gruvbox-theme doom-modeline counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
