;;; early-init.el --- runs before the first frame -*- lexical-binding: t -*-

;; Packages are initialised by init.el, not before it.
(setq package-enable-at-startup nil)

;; Defer GC during startup, then restore a sane threshold.
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 64 1024 1024))))

;; No chrome.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
