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
	  (org-babel-load-file "~/.emacs.d/emacs.org")
	  (org-babel-load-file "~/.emacs.d/functions.org")
	  (org-babel-load-file "~/.emacs.d/misc.org")
	  (org-babel-load-file "~/.emacs.d/keybindings.org")
	  (org-babel-load-file "~/.emacs.d/programming.org")
	  (org-babel-load-file "~/.emacs.d/look.org")
	  (load-host-specific-conf)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" default))))
(custom-set-faces
 )
