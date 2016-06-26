;; package -- Summary
;;; Commentary:
;;; Code:

; General settings
; Don't show default window
(setq inhibit-startup-screen t
      ; Suppress initial scratch message
      initial-scratch-message nil
      x-select-enable-clipboard t
      x-select-enable-primary nil
      mouse-yank-at-point t
      ; Version control
      vc-follow-symlinks t
      vc-make-backup-files t
      version-control t
      delete-old-versions t
      kept-new-versions 1
      kept-old-versions 0
      ; Don't ask me - i do want to load it!
      custom-safe-themes t)
(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/bak")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sml/filename ((t (:inherit sml/global :foreground "azure2" :weight bold)))))

(require 'package)
(add-to-list 'package-archives'("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives'("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives'("melpa-stable" . "https://stable.melpa.org/packages/"))

;; Bootstrap use-package
(setq package-enable-at-startup nil
      load-prefer-newer t)

; Activate installed packages
(package-initialize)

; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(require 'use-package)

; auto-compile lisp code
(use-package auto-compile
             :ensure t
	     :config
	     (auto-compile-on-load-mode t)
	     (auto-compile-on-save-mode t))
;
; GUI settings
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode 1)
  (scroll-bar-mode -1))

(windmove-default-keybindings)

(add-to-list 'auto-mode-alist '("/tmp/mutt*" . mail-mode))

(load-theme 'jangotango t nil)

(use-package evil
  :ensure t
  :init
  (progn
    (setq evil-default-cursor t)
    (define-key global-map (kbd "C-f") 'universal-argument)
    (define-key universal-argument-map (kbd "C-u") nil)
    (define-key universal-argument-map (kbd "C-f") 'universal-argument-more)
    (define-key global-map (kbd "C-u") 'kill-whole-line)
    (eval-after-load 'evil-maps
    '(progn
	(define-key evil-motion-state-map (kbd "C-f") nil)
	(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up))))
  (evil-mode t))

(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100
	helm-idle-delay 0.0
	helm-input-idle-delay 0.01
	helm-quick-update t
	helm-M-x-requires-pattern nil
        helm-mode-fuzzy-match t
	helm-ff-file-name-history-use-recentf t
	helm-ff-skip-boring-files t))
  :config
  (progn
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z") 'helm-select-action)
  (helm-mode t))
  :bind (("C-c h" . helm-mini)
	 ("C-h a" . helm-apropos)
	 ("C-x C-b" . helm-buffers-list)
	 ("C-x b" . helm-mini)
	 ("M-y" . helm-show-kill-ring)
	 ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x c l" . helm-locate)
	 ("C-x c o" . helm-occur)
	 ("C-x c s" . helm-swoop)
	 ("C-x c y" . helm-yas-complete)
	 ("C-x c Y" . helm-yas-create-snippet-on-region)
	 ("C-x c SPC" . helm-all-mark-rings)))

(use-package recentf
  :ensure t
  :init (recentf-mode t)
  :config (setq recentf-max-menu-items 15))


(use-package elpy
  :ensure t
  :config
  (progn
    (elpy-enable)
    (setq elpy-rpc-backend "jedi")))

(use-package flycheck
  :ensure t
  :pin melpa
  :init (global-flycheck-mode))

(when (require 'flycheck nil t)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-module-hook 'flycheck-mode))

(use-package smart-mode-line
  :ensure t
  :pin melpa-stable
  :init
  (progn
    (setq sml/theme 'respectful)
    (sml/setup)))

(use-package org
  :ensure t
  :bind (("C-c l" . org-store-link)
	 ("C-c c" . org-capture)
	 ("C-c a" . org-agenda)
	 ("C-c b" . org-iswitchb))
  :config
  (progn
    (setq org-insert-mode-line-in-empty-file t
	  org-startup-indented t
	  org-agenda-files (quote ("~/Seafile/My Library/Org/notes.org")))
    ;; Make windmove work in org-mode:
    (add-hook 'org-shiftup-final-hook 'windmove-up)
    (add-hook 'org-shiftleft-final-hook 'windmove-left)
    (add-hook 'org-shiftdown-final-hook 'windmove-down)
    (add-hook 'org-shiftright-final-hook 'windmove-right)))
 
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(provide 'init)
;;; init.el ends here

;;; Local Variables:
;;; no-byte-compile: t
;;; byte-compile-warnings: (not free-vars)
;;; End:
