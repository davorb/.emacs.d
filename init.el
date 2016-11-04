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
 '(custom-safe-themes
   (quote
    ("427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" default)))
 '(package-selected-packages
   (quote
    (rustfmt cargo rust-mode yasnippet yaml-mode wc-mode use-package undo-tree tern-auto-complete powerline paredit nodejs-repl nix-mode multiple-cursors material-theme markdown-mode magit intero hydandata-light-theme highlight-symbol highlight-sexp helm gnu-apl-mode github-theme expand-region enh-ruby-mode dracula-theme darkroom column-marker circe atomic-chrome ack ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
