(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 '(custom-safe-themes
   '("821c37a78c8ddf7d0e70f0a7ca44d96255da54e613aa82ff861fe5942d3f1efc" "3074fda75f35f990d112fb75681729a74b6c7f15d3e5dfcf80313abb4cd39ed8" "18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" "0c860c4fe9df8cff6484c54d2ae263f19d935e4ff57019999edbda9c7eda50b8" default))
 '(package-selected-packages
   '(multiple-cursors ido-completing-read+ amx magit treemacs company use-package xclip atom-one-dark-theme zenburn-theme timu-spacegrey-theme tron-legacy-theme)))
(custom-set-faces
 '(default ((t (:height 125)))))

;; Make it look nice
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(prefer-coding-system 'utf-8)

(global-hl-line-mode t)
(show-paren-mode t)
;;(global-display-line-numbers-mode t)
;;(setq display-line-numbers-type 'relative)
(setq cursor-type 'box)

(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))

;; Add some convenient functionality
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'meta))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq completion-auto-help nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

(delete-selection-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun dupline ()
  (interactive)
  (save-excursion
    (kill-ring-save
     (line-beginning-position)
     (+ (line-end-position) 1))
    (beginning-of-line)
    (yank)))

(defun moveline (n)
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    (forward-line -1)
    (forward-char col)))

(defun upline ()
  (interactive)
  (moveline -1))

(defun downline ()
  (interactive)
  (moveline 1))

(global-set-key (kbd "C-M-d") 'dupline)
(global-set-key (kbd "C-M-<up>") 'upline)
(global-set-key (kbd "C-M-<down>") 'downline)
(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-y") 'clipboard-yank)

(setq tab-always-indent 'complete)

;; Setup plugins and themes
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package multiple-cursors
  :bind (("C-." . mc/mark-next-like-this)
         ("C-," . mc/mark-previous-like-this)
         ("C-c ," . mc/mark-all-like-this)))

(use-package multiple-cursors-core
  :ensure nil
  :bind
  (:map mc/keymap
        ("<return>" . nil)))

(use-package ido-completing-read+
  :config
  (ido-mode t)
  (ido-everywhere t)
  (setq ido-decorations
      '("\n-> " ""
        "\n   "
        "\n   ..."
        "[" "]"
        " [No match]"
        " [Matched]"
        " [Not readable]"
        " [Too big]"
        " [Confirm]"))
  (setq ido-enable-flex-matching t)
  (ido-ubiquitous-mode t)
  (add-hook 'ido-setup-hook
            (lambda ()
              (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
              (define-key ido-completion-map (kbd "<up>") 'ido-prev-match)
              (define-key ido-completion-map (kbd "<tab>") 'ido-complete))))

(use-package amx
  :config
  (amx-mode t))

(use-package magit
  :config
  (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package treemacs
  :config
  (treemacs-resize-icons 20)
  :bind (("C-x t t" . treemacs)
         ("C-x t d" . treemacs-select-directory)))

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (add-to-list 'company-backends 'company-dabbrev)
  (company-tng-configure-default)
  (setq company-idle-delay 0)
  :bind (:map company-mode-map
              ("<tab>" . company-indent-or-complete-common)))

(use-package xclip
  :config
  (xclip-mode 1))

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark t))
