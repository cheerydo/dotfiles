;; package -- Summary
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/bak"))))
 '(custom-safe-themes t)
 '(delete-old-versions t)
 '(initial-buffer-choice "/home/jared/seafile/My Library/Org/notes.org")
 '(kept-new-versions 1)
 '(kept-old-versions 0)
 '(org-agenda-files (quote ("~/doc/Seafile/My Library/Org/notes.org")))
 '(org-insert-mode-line-in-empty-file t)
 '(org-startup-indented t)
 '(vc-make-backup-files t)
 '(version-control t)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sml/filename ((t (:inherit sml/global :foreground "azure2" :weight bold))))
 )

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
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

(load-theme 'jangotango t)

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
	helm-M-x-fuzzy-match t
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
	 ("C-x b" . helm-buffers-list)
	 ("M-y" . helm-show-kill-ring)
	 ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x c l" . helm-locate)
	 ("C-x c o" . helm-occur)
	 ("C-x c s" . helm-swoop)
	 ("C-x c y" . helm-yas-complete)
	 ("C-x c Y" . helm-yas-create-snippet-on-region)
	 ("C-x c SPC" . helm-all-mark-rings)))

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

(use-package smart-mode-line
  :ensure t
  :pin melpa-stable
  :init
  (progn
    (setq sml/theme 'respectful)
    (sml/setup)))

(use-package org
  :ensure t
  :init
  (progn
    (global-set-key "\C-cl" 'org-store-link)
    (global-set-key "\C-cc" 'org-capture)
    (global-set-key "\C-ca" 'org-agenda)
    (global-set-key "\C-cb" 'org-iswitchb)))
 
;Don't show default window
(setq inhibit-startup-screen t
      x-select-enable-clipboard t
      x-select-enable-primary nil
      mouse-yank-at-point t
      vc-follow-symlinks t
      initial-scratch-message nil)
(fset 'yes-or-no-p 'y-or-n-p)

;(provide 'init)
;;; init.el ends here
