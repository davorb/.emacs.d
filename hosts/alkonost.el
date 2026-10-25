;;; alkonost.el --- host-specific settings -*- lexical-binding: t -*-

(set-face-attribute 'default nil :height 110)

(add-to-list 'exec-path "~/bin/bin")
(setenv "PATH" (concat "/home/davor/bin/bin:" (getenv "PATH")))

(use-package doric-themes
  :config (load-theme 'doric-dark t))
