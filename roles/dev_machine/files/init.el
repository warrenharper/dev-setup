(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))))

; Add ~/.emacs.d to load-path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elpa/")

;; Parens
(show-paren-mode 1)

;;Cursor Tracking
(column-number-mode 1)

;;Tool and menu bars
(tool-bar-mode -1)
(menu-bar-mode -1)

;;Package Setup
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;;Color-themes
(require 'color-theme)
(color-theme-sanityinc-solarized-light)
(color-theme-monokai)

;;Line numbering
(global-linum-mode 1)

;;Remove Scroll bar
(set-scroll-bar-mode nil)

;;Set font size
(set-face-attribute 'default nil :height 110)

;;Indention to spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Indention of new lines
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Backup Policy
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq auto-save-list-file-prefix "~/.emacs.d/tmp/autosaves/")

;;Ubiquitous mode
(ido-mode 1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; Smart Mode line
(setq sml/theme 'dark)
(require 'smart-mode-line)
(sml/setup)


;;Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-x t") 'ansi-term)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

;;Mac command modifier
(setq mac-command-modifier 'control)

;;Mac Paths
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
