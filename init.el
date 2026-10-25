;;; init.el --- and then there was light -*- lexical-binding: t -*-
;;
;; this is the first thing to get loaded
(require 'package)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-hook 'after-init-hook
	  (lambda ()
	  (require 'org)
	  (require 'ob-tangle)
	  (org-babel-load-file "~/.emacs.d/packages.org")
	  (org-babel-load-file "~/.emacs.d/emacs.org")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-jump-mode ack auto-complete cargo circe column-marker darkroom
                   dashboard doric-dark doric-themes dracula-theme
                   easy-theme-preview enh-ruby-mode evil expand-region
                   flymake-jshint geiser gnu-apl-mode go-mode
                   haskell-mode helm highlight-sexp highlight-symbol
                   htmlize hydandata-light-theme intero ivy js2-mode
                   magit markdown-mode material-theme multiple-cursors
                   nasm-mode nix-mode nodejs-repl org-clock-today
                   paredit powerline projectile quelpa
                   quelpa-use-package rust-mode rustfmt sass-mode
                   spacemacs-theme stylus-mode swiper
                   tern-auto-complete tide tree-sitter
                   tree-sitter-langs typescript-mode undo-tree
                   use-package visual-fill-column wc-mode web-mode
                   writeroom-mode yaml-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
