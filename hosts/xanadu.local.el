;;; xanadu.local.el --- host-specific settings -*- lexical-binding: t -*-

(set-face-attribute 'default nil :family "Hack" :height 145 :weight 'normal)

(setq frame-title-format
      '((buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(use-package spacemacs-theme
  :config (load-theme 'spacemacs-light t))

(set-frame-height (selected-frame) 60)
(set-frame-width (selected-frame) 180)

(defun open-notes-folder ()
  "Dired the folder that I keep notes in."
  (interactive)
  (dired "~/Documents/text/notes/"))
