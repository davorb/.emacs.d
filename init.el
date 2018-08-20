;;; init.el -- and then there was light
;;
;; this is the first thing to get loaded
(require 'package)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-hook 'after-init-hook
	  '(lambda ()
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
   (quote
    (projectile visual-fill-column nasm-mode go-mode sass-mode web-mode typescript-mode geiser auto-complete org-clock-today evil swiper ivy rustfmt cargo rust-mode yasnippet yaml-mode writeroom-mode wc-mode use-package undo-tree tide tern-auto-complete stylus-mode powerline paredit nodejs-repl nix-mode multiple-cursors material-theme markdown-mode magit js2-mode intero hydandata-light-theme highlight-symbol highlight-sexp helm gnu-apl-mode flymake-jshint expand-region enh-ruby-mode dracula-theme darkroom column-marker ack ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
