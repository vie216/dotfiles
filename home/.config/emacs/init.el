(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 '(custom-enabled-themes '(atom-one-dark))
 '(custom-safe-themes
   '("f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "0c860c4fe9df8cff6484c54d2ae263f19d935e4ff57019999edbda9c7eda50b8" default))
 '(package-selected-packages
   '(multiple-cursors smex magit treemacs company yasnippet eglot rust-mode cargo atom-one-dark-theme zenburn-theme)))
(custom-set-faces
 '(default ((t (:height 145)))))

;; Enable some keybindings
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Enable line numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Set spaces intead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Switching between windows via Alt + ArrowKeys
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'meta))

;; Use UTF-8 by default
(prefer-coding-system 'utf-8)

;; Highlight current line
(global-hl-line-mode t)

;; Highlight parens pair under cursor
(show-paren-mode t)

;; Disable menubar, toolbar and scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Enable transparent background
(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))

;; Disable creating backup files
(setq make-backup-files nil)

;; Automatically delete trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Setup multiple cursors
(require 'multiple-cursors)

(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c ,") 'mc/mark-all-like-this)
(define-key mc/keymap (kbd "<return>") nil)

;; Setup advanced minibar completion
(require 'smex)

(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c M-x") 'execute-extended-command)

;; Setup file browser
(require 'treemacs)

(global-set-key (kbd "C-x t t") 'treemacs)
(global-set-key (kbd "C-x t d") 'treemacs-select-directory)

(treemacs-resize-icons 20)

;; Setup lsp
(require 'company)
(require 'yasnippet)
(require 'eglot)
(require 'rust-mode)

(global-set-key "\t" 'company-indent-or-complete-common)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'rust-mode-hook 'eglot-ensure)

(add-to-list 'company-backends 'company-dabbrev)

(setq rust-format-on-save t)

(add-to-list 'exec-path "~/.cargo/bin")
