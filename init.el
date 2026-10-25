;;; init.el --- and then there was light -*- lexical-binding: t -*-

(require 'package)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;;; Core

(setq backup-directory-alist '(("." . "~/.saves"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      create-lockfiles nil
      ring-bell-function 'ignore
      use-short-answers t
      tab-always-indent 'complete)
(setq-default indent-tabs-mode nil)

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(delete-selection-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)
(global-auto-revert-mode 1)
(auto-compression-mode 1)
(savehist-mode 1)
(recentf-mode 1)
(save-place-mode 1)
(repeat-mode 1)
(which-key-mode 1)
(pixel-scroll-precision-mode 1)
(windmove-default-keybindings)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x pgtk))
  :config (exec-path-from-shell-initialize))

(use-package dired
  :ensure nil
  :config
  (require 'dired-x)
  (setq dired-omit-files "^\\...+$")
  (add-hook 'dired-mode-hook #'dired-omit-mode))

;;; Functions

(defun find-user-init-file ()
  "Edit the init file."
  (interactive)
  (find-file user-init-file))

(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun insert-current-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun prev-window ()
  (interactive)
  (other-window -1))

(defun move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;;; Keybindings

(global-set-key (kbd "C-h") #'delete-backward-char)
(global-set-key (kbd "C-S-h") #'delete-char)
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)
(global-set-key (kbd "C-c M-/") #'indent-buffer)
(global-set-key (kbd "C-c w") #'whitespace-mode)
(global-set-key (kbd "C-z") #'undo)
(global-set-key (kbd "C-S-z") #'undo-redo)
(global-set-key (kbd "C-S-<up>") #'move-line-up)
(global-set-key (kbd "C-S-<down>") #'move-line-down)

;;; Editing

(use-package vundo
  :bind ("C-M-z" . vundo))

(use-package avy
  :bind ("C-c SPC" . avy-goto-word-1))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package symbol-overlay
  :bind ("C-c h" . symbol-overlay-put))

(use-package yasnippet
  :custom
  (yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-indent-line nil)
  :config (yas-global-mode 1))

(use-package visual-fill-column
  :bind ("C-c t v" . visual-fill-column-mode)
  :custom
  (visual-fill-column-center-text t)
  (visual-fill-column-fringes-outside-margins nil)
  (visual-fill-column-width 100))

(use-package writeroom-mode)
(use-package wc-mode)

;;; Completion: vertico (minibuffer) + corfu (in buffer)

(use-package vertico
  :init (vertico-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :init (marginalia-mode 1))

(use-package consult
  :bind (("M-s l"   . consult-line)
         ("C-x b"   . consult-buffer)
         ("C-x C-r" . consult-recent-file)
         ("M-y"     . consult-yank-pop)
         ("M-g g"   . consult-goto-line)
         ("M-g i"   . consult-imenu)
         ("M-s r"   . consult-ripgrep)))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  :init (global-corfu-mode 1))

(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;;; Version control

(use-package magit
  :bind ("C-x g" . magit-status)
  :custom (git-commit-summary-max-length 50))

;;; Org

(use-package org
  :ensure nil
  :hook (org-mode . auto-fill-mode)
  :custom (org-src-fontify-natively t)
  :config (require 'ox-man))

(use-package htmlize)

(use-package org-clock-today
  :after org
  :config (org-clock-today-mode 1))

;;; Programming: tree-sitter, eglot, formatting

(setq treesit-enabled-modes t            ; use the *-ts-mode variants everywhere
      treesit-auto-install-grammar 'always)

(use-package eglot
  :ensure nil
  :hook ((tsx-ts-mode typescript-ts-mode js-ts-mode
          css-ts-mode json-ts-mode
          go-ts-mode rust-ts-mode haskell-mode) . eglot-ensure)
  :custom
  (eglot-autoshutdown t)
  (eglot-confirm-server-initiated-edits nil)
  :bind (:map eglot-mode-map
         ("C-c r" . eglot-rename)
         ("C-c a" . eglot-code-actions)
         ("C-c f" . eglot-format))
  :config
  ;; TypeScript 7 ships a native language server in `tsc'.
  (add-to-list 'eglot-server-programs
               '((js-ts-mode tsx-ts-mode typescript-ts-mode) . ("tsc" "--lsp" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))
  (setq-default eglot-workspace-configuration
                '(:haskell (:formattingProvider "fourmolu"
                            :plugin (:stan (:globalOn :json-false))))))

;; Format on save with the project's prettier/biome/gofmt/etc.
(use-package apheleia
  :init (apheleia-global-mode 1))

(setq css-indent-offset 2
      js-indent-level 2
      typescript-ts-mode-indent-offset 2)

(use-package markdown-mode)
(use-package go-mode)
(use-package nasm-mode)
(use-package haskell-mode)

(use-package paredit
  :hook ((emacs-lisp-mode eval-expression-minibuffer-setup ielm-mode
          lisp-mode lisp-interaction-mode scheme-mode) . enable-paredit-mode)
  :bind (:map lisp-mode-shared-map ("C-c v" . eval-buffer)))

(use-package geiser
  :hook (scheme-mode . geiser-mode))

;;; AI and MCP

(use-package gptel
  :custom (gptel-default-mode 'org-mode)
  :config
  ;; Needs an auth-source entry: machine api.anthropic.com login apikey password <key>
  (setq gptel-backend (gptel-make-anthropic "Claude"
                        :stream t
                        :key (lambda ()
                               (auth-source-pick-first-password
                                :host "api.anthropic.com")))
        gptel-model 'claude-sonnet-5-5))

(use-package mcp
  :after gptel
  :custom
  (mcp-hub-servers
   '(("fetch"    . (:command "uvx" :args ("mcp-server-fetch")))
     ("context7" . (:command "npx" :args ("-y" "@upstash/context7-mcp")))))
  :config
  (require 'gptel-integrations)
  (require 'mcp-hub))

;; Run Claude Code in a side window; exposes buffers, LSP diagnostics and
;; xref to it over MCP.
(use-package eat)
(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :bind ("C-c C-'" . claude-code-ide-menu)
  :custom (claude-code-ide-terminal-backend 'eat)
  :config (claude-code-ide-emacs-tools-setup))

;;; Look

(use-package dashboard
  :config (dashboard-setup-startup-hook))

;;; Per-host settings: hosts/<system-name>.el

(let ((host-file (expand-file-name (concat "hosts/" (system-name) ".el")
                                   user-emacs-directory)))
  (when (file-exists-p host-file)
    (load host-file nil 'nomessage)))
