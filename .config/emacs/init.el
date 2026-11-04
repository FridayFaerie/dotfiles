;; -*- lexical-binding: nil -*-
(add-to-list 'warning-suppress-types '(files missing-lexbind-cookie))

;visual
(setq-default mode-line-format nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-hl-line-mode)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(set-face-attribute 'default nil :font "InconsolataGo Nerd Font" :height 160)
;; (set-face-attribute 'fixed-pitch nil :family "InconsolataGo Nerd Font" :height 1.0)

(setq make-backup-files nil)
(setq auto-save-default nil)

(electric-pair-mode)
(delete-selection-mode)
(global-auto-revert-mode)

(ido-mode)
(ido-everywhere)
(recentf-mode)
(save-place-mode)
(which-key-mode)
(setq
 use-short-answers t
 indent-tabs-mode nil
)

(keymap-global-set "C-d" #'kill-region)
(keymap-global-set "C-w" #'backward-kill-word)
(keymap-global-set "C-x k" #'kill-current-buffer)


(with-eval-after-load 'dired
(define-key dired-mode-map (kbd "-") 'dired-up-directory))
(global-set-key (kbd "M--") (lambda () (interactive) (dired ".")))
(setq
 dired-kill-when-opening-new-dired-buffer t
 dired-maybe-use-globstar t
)


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; (setq evil-want-keybinding nil)
;; (evil-mode)
;; (evil-collection-init)

(use-package kkp
  :ensure t
  :hook (tty-setup . global-kkp-mode))


(add-to-list 'load-path "~/.config/emacs/lisp/flash-emacs")
(require 'flash-emacs)
(global-set-key (kbd "C-j") #'flash-emacs-jump)

(setq flymake-show-diagnostics-at-end-of-line t)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1)

(require 'eldoc-box)
(eldoc-box-hover-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(kanagawa-wave))
 '(custom-safe-themes
   '("d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6"
     "c20728f5c0cb50972b50c929b004a7496d3f2e2ded387bf870f89da25793bb44"
     "daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077"
     "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde"
     "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(package-selected-packages
   '(company eldoc-box evil evil-collection kanagawa-themes kkp rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch-serif ((t (:family "Liberation Serif")))))
