;;; package -- Summary
;;; Commentary:
;;; Code:

; Don't have the ugly custom-set-variables in this file
(setq custom-file "~/.emacs.d/custom-vars.el")
(load custom-file)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ; Need this for undo-tree, without it evil won't install
			 ("gnu" . "http://elpa.gnu.org/packages/")))
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

; General settings
(setq inhibit-startup-screen t
      initial-scratch-message nil
      x-select-enable-clipboard t
      x-select-enable-primary nil
      mouse-yank-at-point t
      vc-follow-symlinks t
      delete-old-versions t
      vc-make-backup-files t
      kept-new-versions 1
      kept-old-versions 0
      version-control t
      delete-old-versions t
      column-number-mode t
      line-spacing '0.25
      tab-width 4
      indent-tabs-mode nil
      gc-cons-threshold 20000000
      echo-keystrokes 0.3
      confirm-kill-emacs 'yes-or-no-p)
(setq backup-directory-alist
      '(("." . "~/.emacs.d/bak")))
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)

; GUI settings
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (column-number-mode t)
  (scroll-bar-mode -1))
;(windmove-default-keybindings)

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("\\..*rc\\'" . conf-unix-mode))
(add-to-list 'backup-directory-alist '("~/.emacs.d/.bak"))

; let's get that big beautiful theme rolling
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(use-package diminish
  :ensure t)

(use-package bind-key
  :ensure t)

; auto-compile lisp code
(use-package auto-compile
  :ensure t
  :config
  (progn
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode)))

(use-package evil
  :ensure t
  :init
  (progn
    (setq evil-default-cursor t)
    (setq evil-want-C-i-jump nil)
    (define-key global-map (kbd "C-f") 'universal-argument)
    (define-key universal-argument-map (kbd "C-u") nil)
    (define-key universal-argument-map (kbd "C-f") 'universal-argument-more)
    (define-key global-map (kbd "C-u") 'kill-whole-line)
    (eval-after-load 'evil-maps
      '(progn
	 (define-key evil-motion-state-map (kbd "C-f") nil)
	 (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up))))
  (evil-mode t)
  (progn
    (define-key evil-normal-state-map (kbd "` h") 'windmove-left)
    (define-key evil-normal-state-map (kbd "` j") 'windmove-down)
    (define-key evil-normal-state-map (kbd "` k") 'windmove-up)
    (define-key evil-normal-state-map (kbd "` l") 'windmove-right))
  (use-package evil-magit
    :ensure t)
  :config 
  (evil-set-initial-state 'deft-mode 'insert))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :bind (("C-c C-r" . ivy-resume)
         ("C-x b" . ivy-switch-buffer))
  :config
  (progn
    (setq ivy-use-virtual-buffers t
      ivy-height 15
      ivy-count-format "(%d/%d) ")
    (ivy-mode t)))

(use-package hydra
  :ensure t
  :init
  (progn
    (use-package ivy-hydra
        :ensure t)))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-c u" . swiper-all)))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ;("C-h i" . counsel-info-lookup-symbol)
         ("C-h u" . counsel-unicode-char)
         ("C-x l" . counsel-locate)
         ("C-c i r" . counsel-recentf)
         ("C-c h i" . counsel-imenu))
  :init
  (ivy-set-actions
   'counsel-find-file
   '(("j" find-file-other-window "other"))))

(use-package company
  :ensure t
  :init
  (add-hook 'python-mode-hook 'company-mode))

(use-package key-chord
  :ensure t
  :init
  (progn
     (setq key-chord-two-keys-delay 0.5)
     (key-chord-define evil-insert-state-map "fd" 'evil-normal-state))
  :config
  (key-chord-mode t))

(use-package recentf
  :ensure t
  :init
  (recentf-mode t)
  :config
  (progn
    (setq recentf-max-menu-items 50)
    (add-to-list 'recentf-exclude "/elpa/")))

;(use-package elpy
;  :ensure t
;  :init
;  (elpy-enable))
(use-package anaconda-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (use-package company-anaconda
    :ensure t
    :config
    (add-to-list 'company-backends 'company-anaconda)))

(use-package flycheck
  :ensure t)
;  :init
;  (progn
;    (remove-hook 'elpy-modules 'elpy-module-flymake)
;    (add-hook 'elpy-module-hook 'flycheck-mode)))

(defun my-autofill-mode ()
  "My options for setting auto-fill-mode and fill-column for specific modes."
  (interactive)
  (setq fill-column 80)
  (auto-fill-mode t))

(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
	 ("C-c c" . org-capture)
	 ("C-c a" . org-agenda)
	 ("C-c b" . org-iswitchb))
  :init
  (progn
    (add-hook 'org-mode-hook 'my-autofill-mode)
    (add-hook 'org-capture-mode-hook 'evil-insert-state)
    ;; Make windmove work in org-mode
    (add-hook 'org-shiftup-final-hook 'windmove-up)
    (add-hook 'org-shiftleft-final-hook 'windmove-left)
    (add-hook 'org-shiftdown-final-hook 'windmove-down)
    (add-hook 'org-shiftright-final-hook 'windmove-right))
  :config
  (progn
    (setq org-insert-mode-line-in-empty-file t
          org-startup-indented t
          org-log-done t
          org-return-follows-link t
          org-hierarchical-todo-statistics nil
          org-checkbox-hierarchical-statistics nil
          org-M-RET-may-split-line nil)
    (setq org-todo-keywords
	  '((sequence "TODO(t)" "IN_PROGRESS(i)" "WAITING(w)" "DONE(d)")))
    (setq org-todo-keyword-faces
	  '(("IN_PROGRESS" . "medium blue")
	    ("WAITING" . "tomato")))
    (setq org-default-notes-file (concat org-directory "/capture.org"))
    (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
    (setq org-capture-templates
          '(("t" "Todo" entry (file+headline org-default-notes-file "Refile")
             "* TODO %?")
            ("n" "Notes" entry (file+headline org-default-notes-file "Refile")
             "* %?")))
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-use-outline-path 'file)))

(use-package org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
	    (lambda ()
	      (evil-org-set-key-theme))))

(use-package magit
  :ensure t
  :bind(("C-x g" . magit-status))
  :config (setq magit-completing-read-function 'ivy-completing-read))

(use-package ranger
  :ensure t
  :bind (("C-x d" . ranger))
  :init (ranger-override-dired-mode t)
  :config (setq ranger-show-dotfiles t))

(use-package yaml-mode
  :ensure t)

(use-package ansible
  :ensure t
  :init
  (use-package company-ansible
    :ensure t
    :init
    (add-to-list 'company-backends 'company-ansible))
  (add-hook 'ansible-hook 'ansible::auto-decrypt-encrypt))

(use-package eyebrowse
  :ensure t
  :init
  (eyebrowse-mode t)
  (eyebrowse-setup-opinionated-keys))

(use-package moe-theme
  :ensure t
  :init
  (load-theme 'moe-dark))

(use-package smart-mode-line
  :ensure t
  :init
  (progn
    (setq sml/theme 'respectful)
    (sml/setup)))

(provide 'init)
;;; init.el ends here

;;; Local Variables:
;;; no-byte-compile: t
;;; byte-compile-warnings: (not free-vars)
;;; End:
