;; -*- lexical-binding: t; -*-

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode 1)
(setq visible-bell t)
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font-18")
(setq display-line-numbers 'relative)
(global-display-line-numbers-mode)
;; Increase GC threshold
(setq gc-cons-percentage 0.5
      gc-cons-threshold (* 50 1000 1000))

(load-theme 'wombat)


;; Setup package.el
(add-to-list 'package-archives
	     '(("melpa" . "https://melpa.org/paclages/")
	       ("org" .  "https://orgmode.org/elpa/")
	       ("elpa" . "https://elpa/gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contentsb))

;; Setup use-package 
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Packages

;; Completion -----------------------------------------------------------
(use-package vertico
  ;; https://github.com/minad/vertico
  :init (vertico-mode))

(use-package orderless
  ;; https://github.com/oantolin/orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  (corfu-scroll-margin 5)        ;; Use scroll margin
  :init
  (global-corfu-mode))

(use-package which-key
  ;; https://github.com/justbur/emacs-which-key
  :init (which-key-mode))

;; Git -------------------------------------------------------------------
(use-package magit)

;; Projectile ------------------------------------------------------------

;; Editor
(use-package multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/edit-lines)

;; Orgmode
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))




;; Emacs
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

(add-hook 'c++-mode 'eglot-ensure)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(reformatter zig-mode org-modern rust-mode multiple-cursors which-key vertico orderless corfu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
