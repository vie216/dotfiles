(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 '(custom-enabled-themes '(timu-spacegrey))
 '(custom-safe-themes
   '("821c37a78c8ddf7d0e70f0a7ca44d96255da54e613aa82ff861fe5942d3f1efc" "3074fda75f35f990d112fb75681729a74b6c7f15d3e5dfcf80313abb4cd39ed8" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "0c860c4fe9df8cff6484c54d2ae263f19d935e4ff57019999edbda9c7eda50b8" default))
 '(package-selected-packages
   '(multiple-cursors ido-completing-read+ amx magit treemacs company use-package atom-one-dark-theme zenburn-theme timu-spacegrey-theme tron-legacy-theme)))
(custom-set-faces
 '(default ((t (:height 145)))))

;; Make it look nice
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(prefer-coding-system 'utf-8)

(global-hl-line-mode t)
(show-paren-mode t)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(setq cursor-type 'box)

(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))

;; Add some convenient functionality
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'meta))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq completion-auto-help nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun dupline ()
  (interactive)
  (save-excursion
    (kill-ring-save
     (line-beginning-position)
     (+ (line-end-position) 1))
    (beginning-of-line)
    (yank)))

(global-set-key (kbd "C-M-d") 'dupline)

;; Setup plugins and themes
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package timu-spacegrey-theme
  :config
  (load-theme 'timu-spacegrey t))

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
  :config
  (add-to-list 'company-backends 'company-dabbrev)
  (global-company-mode)
  :bind (("<tab>" . company-indent-or-complete-common)))
