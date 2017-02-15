;;; package -- Summary
;;; Commentary:
;;; Code:

; Don't have the ugly custom-set-variables in this file
(setq custom-file "~/.emacs.d/custom-vars.el")
(load custom-file)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

; Activate installed packages
(package-initialize)

; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(require 'use-package)
(require 'diminish)
(require 'bind-key)

; General settings
(setq inhibit-startup-screen t
      initial-scratch-message nil
      x-select-enable-clipboard t
      x-select-enable-primary nil
      mouse-yank-at-point t
      vc-follow-symlinks t
      delete-old-versions t
      vc-make-backup-files t
      kept-new-versions 2
      kept-old-versions 1
      version-control t
      delete-old-versions t
      column-number-mode t
      tab-width 4
      indent-tabs-mode nil
      gc-cons-threshold 20000000
      echo-keystrokes 0.3
      confirm-kill-emacs 'yes-or-no-p
      visible-bell 1)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)

; GUI settings
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode t)
  (scroll-bar-mode -1))
(windmove-default-keybindings) 

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("\\..*rc\\'" . conf-unix-mode))
(add-to-list 'backup-directory-alist '("~/.emacs.d/.bak"))

; let's get that big beautiful theme rolling
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

; auto-compile lisp code
(use-package auto-compile
  :ensure t
  :config
  (progn
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode)))
(setq load-prefer-newer t)

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
  (evil-mode t)
  :config 
  (evil-set-initial-state 'deft-mode 'insert))

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
         ;("C-x b" . helm-mini)
         ("M-y" . helm-show-kill-ring)
         ;("M-x" . helm-M-x)
         ;("C-x C-f" . helm-find-files)
         ;("C-x c l" . helm-locate)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c SPC" . helm-all-mark-rings)))

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

(use-package ivy-hydra
  :ensure t
  :init
  (ivy-set-actions
    'counsel-find-file
    '(("j" find-file-other-window "other"))))

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
         ("C-h i" . counsel-info-lookup-symbol)
         ("C-h u" . counsel-unicode-char)
         ("C-x l" . counsel-locate)
         ("C-c i r" . counsel-recentf)
         ("C-c h i" . counsel-imenu))

(use-package key-chord
  :ensure t
  :init
  (progn
     (setq key-chord-two-keys-delay 0.5)
     (key-chord-define evil-insert-state-map "jj" 'evil-normal-state))
  :config
  (key-chord-mode t))

(use-package recentf
  :ensure t
  :config
  (progn
    (setq recentf-max-menu-items 20
      recentf-exclude (list "/elpa/.*\\'")))
  (recentf-mode t))

(use-package elpy
  :ensure t
  :mode ("\\.py\\'" . elpy-mode)
  :config
  (elpy-enable))

(use-package flycheck
  :ensure t
  :init
  (progn
    (remove-hook 'elpy-modules 'elpy-module-flymake)
    (add-hook 'elpy-module-hook 'flycheck-mode)))

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
    (setq org-todo-keyword-faces
	  '(("IN_PROGRESS" . "medium blue")
	    ("WAITING" . "tomato")))
    (setq org-default-notes-file (concat org-directory "/capture.org"))
    (setq org-refile-targets '((nil :maxlevel . 9)
			       (org-agenda-files :maxlevel . 9)))
    (setq org-capture-templates
          '(("t" "Todo" entry (file+headline org-default-notes-file "Refile")
             "* TODO %?")
            ("n" "Notes" entry (file+headline org-default-notes-file "Refile")
             "* %?")))
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-use-outline-path t)))

(use-package deft
  :ensure t
  :init
  (progn
    (setq deft-default-extensions "org"
          deft-extensions '("org")
          deft-directory "~/Seafile/My Library"
          deft-recursive t
          deft-use-filename-as-title t)
    (global-set-key [f4] 'deft)
    (global-set-key [f5] 'deft-find-file)))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package ranger
  :ensure t
  :bind (("C-x d" . ranger)))

(use-package flatui-theme
  :ensure t
  :config
  (load-theme 'flatui))

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
