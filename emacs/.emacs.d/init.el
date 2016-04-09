;;; init.el -*- no-byte-compile: t -*-
(require 'package)
(add-to-list 'package-archives'("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives'("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives'("marmalade" . "https://marmalade-repo.org/packages/"))
(setq package-enable-at-startup nil
      load-prefer-newer t)

;; Activate installed packages
(package-initialize)

;; Bootstrap use-package
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

; GUI settings
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode 1)
  (scroll-bar-mode -1))

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
  (setq evil-want-C-u-scroll t
        evil-default-cursor t)
  (evil-mode))

(use-package color-theme-wombat
  :ensure t
  :config
  (load-theme 'wombat t))

(use-package powerline
  :ensure t
  :init
  (progn
    (setq powerline-default-separator "wave")
  (powerline-default-theme)))

;Don't show default window
(setq inhibit-startup-screen t
      x-select-enable-clipboard t
      x-select-enable-primary t
      mouse-yank-at-point t)
(fset 'yes-or-no-p 'y-or-n-p)

; backup settings
(setq backup-directory-alist '(("." . "~/.emacs.d/bak")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)

(setq initial-scratch-message "")
