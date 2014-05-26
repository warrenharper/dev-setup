
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#ff9da4") (40 . "#ffc58f") (60 . "#ffeead") (80 . "#d1f1a9") (100 . "#99ffff") (120 . "#bbdaff") (140 . "#ebbbff") (160 . "#ff9da4") (180 . "#ffc58f") (200 . "#ffeead") (220 . "#d1f1a9") (240 . "#99ffff") (260 . "#bbdaff") (280 . "#ebbbff") (300 . "#ff9da4") (320 . "#ffc58f") (340 . "#ffeead") (360 . "#d1f1a9"))))
 '(vc-annotate-very-old-color nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes (quote ("1967b40b6f744f3dadc00981f92ed2871d8c583194abb5a5ad08e9e0645e5516" "4b58a8e06fa66e9b8c3ab3855ad1dcd08d236f6afe87129e19a7f01a2d4aef03" "0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "c2cfe2f1440d9ef4bfd3ef4cf15bfe35ff40e6d431264b1e24af64f145cffb11" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))))

; Add ~/.emacs.d to load-path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elpa/")

;;Add themes folder to custom themes list
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


(show-paren-mode 1)
(column-number-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
;;Get rid of tool and menu bars
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
(load-theme 'wombat-ext t)

;;Status bar/mode line 
;;(setq-default mode-line-format nil)

;;Line numbering
(global-linum-mode 1)

;;Remove Scroll bar
(set-scroll-bar-mode nil)

;;Set font size
(set-face-attribute 'default nil :height 130)

;;Indention to spaces instead of spaces
(setq-default indent-tabs-mode nil)

;; Backup Policy
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq auto-save-list-file-prefix "~/.emacs.d/tmp/autosaves/")

;;Auto Revert Mode
(global-auto-revert-mode t)

(ido-mode 1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(setq sml/theme 'respectful)
(require 'smart-mode-line)
(sml/setup)

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

;; (require 'go-autocomplete)
;; (require 'auto-complete-config)
;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(put 'narrow-to-region 'disabled nil)
