;;; fatboy.el --- host-specific settings -*- lexical-binding: t -*-

(set-face-attribute 'default nil :height 110)

(add-to-list 'exec-path "~/bin/bin")
(setenv "PATH" (concat "/home/davor/bin/bin:" (getenv "PATH")))

(defun open-notes-folder ()
  "Dired the folder that I keep notes in."
  (interactive)
  (dired "~/Documents/text/notes/"))

(use-package gnu-apl-mode
  :config
  (dolist (hook '(gnu-apl-interactive-mode-hook gnu-apl-mode-hook))
    (add-hook hook
              (lambda ()
                (setq buffer-face-mode-face '(:family "APL385 Unicode"
                                              :height 140
                                              :width semi-condensed))
                (buffer-face-mode))))
  (add-hook 'gnu-apl-keymap-mode-hook
            (lambda ()
              (setq buffer-face-mode-face '(:family "APL385 Unicode"
                                            :height 120
                                            :width semi-condensed))
              (buffer-face-mode))))

(use-package hydandata-light-theme
  :config (load-theme 'hydandata-light t))

(use-package atomic-chrome
  :custom
  (atomic-chrome-default-major-mode 'markdown-mode)
  (atomic-chrome-buffer-open-style 'full)
  :config (atomic-chrome-start-server))
