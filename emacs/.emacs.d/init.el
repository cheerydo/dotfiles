;;; package -- Summary
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (jedi flatui-theme doremi material-theme xterm-color use-package swiper smart-mode-line sicp powerline-evil org magit key-chord helm flycheck elpy deft base16-theme auto-compile ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

; Activate installed packages
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

; Activate installed packages
(package-initialize)

; GUI settings
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

(windmove-default-keybindings) 
; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
(require 'use-package)

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

; auto-compile lisp code
(use-package auto-compile
  :ensure t
  :config
  (progn
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode)))
(setq load-prefer-newer t)

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
      delete-old-versions t
      version-control t
      vc-make-backup-files t
      kept-new-versions 1
      kept-old-versions 0
; Don't ask me - i do want to load it!
      column-number-mode t
;custom-safe-themes t
      tab-width 4
;always spaces
	  indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("\\..*rc\\'" . conf-unix-mode))
(add-to-list 'backup-directory-alist '("~/.emacs.d/bak"))

; let's get that big beautiful theme rolling
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

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
          ;helm-mode-fuzzy-match t
          helm-M-x-fuzzy-match t
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
  :diminish ivy-mode
  :ensure t
  :config
  (progn
    (setq ivy-use-virtual-buffers t
      ivy-height 15
      ivy-count-format "(%d/%d) ")
    (ivy-mode t)))

(use-package counsel
  :ensure t
  :bind (("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-x c l" . counsel-locate)
         ("C-s" . swiper)
         ("C-x b" . ivy-switch-buffer)))

(use-package key-chord
  :ensure t
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
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
  :pin org
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-c b" . org-iswitchb))
  :config
  (progn
    (setq org-insert-mode-line-in-empty-file t
          org-startup-indented t
          org-log-done t
          org-return-follows-link t
          org-hierarchical-todo-statistics nil
          org-checkbox-hierarchical-statistics nil
          org-completion-use-helm t
          org-M-RET-may-split-line nil
          org-agenda-files (quote ("~/Seafile/My Library/Org/notes.org")))
    ; Make windmove work in org-mode
    (add-hook 'org-shiftup-final-hook 'windmove-up)
    (add-hook 'org-shiftleft-final-hook 'windmove-left)
    (add-hook 'org-shiftdown-final-hook 'windmove-down)
    (add-hook 'org-shiftright-final-hook 'windmove-right)
    (add-hook 'org-mode-hook 'my-autofill-mode)
    (setq org-todo-keyword-faces
          '(("IN_PROGRESS" . "light green")
            ("WAITING" . "indian red")))
    (setq org-default-notes-file
          (concat org-directory "/capture.org"))
    (setq org-refile-targets '((nil :maxlevel . 9)
                               (org-agenda-files :maxlevel . 9)))
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-use-outline-path t)))

(use-package deft
  :ensure t
  :init
  (progn
    (setq deft-default-extensions "org"
          deft-extensions '("org")
          deft-directory "~/Seafile/My Library/Org"
          deft-recursive t
          deft-use-filename-as-title t)
    (global-set-key [f4] 'deft)
    (global-set-key [f5] 'deft-find-file)))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package flatui-theme
  :ensure t
  :init
  (progn
    (load-theme 'flatui)))

(use-package smart-mode-line
  :ensure t
  :init
  (progn
    (setq sml/theme 'light)
    (sml/setup t)))

(provide 'init)
;;; init.el ends here

;;; Local Variables:
;;; no-byte-compile: t
;;; byte-compile-warnings: (not free-vars)
;;; End:
