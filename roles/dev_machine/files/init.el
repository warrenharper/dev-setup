 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#ff9da4") (40 . "#ffc58f") (60 . "#ffeead") (80 . "#d1f1a9") (100 . "#99ffff") (120 . "#bbdaff") (140 . "#ebbbff") (160 . "#ff9da4") (180 . "#ffc58f") (200 . "#ffeead") (220 . "#d1f1a9") (240 . "#99ffff") (260 . "#bbdaff") (280 . "#ebbbff") (300 . "#ff9da4") (320 . "#ffc58f") (340 . "#ffeead") (360 . "#d1f1a9"))))
 '(vc-annotate-very-old-color nil)
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(auto-dim-other-buffers-face ((t (:background "#FFF")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-dim-other-buffers-mode t)
 '(custom-safe-themes
   (quote
    ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "e292ec749f785d348969926448e25790356a7ce1a8fda6e695f5e8b70bed786b" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" "1967b40b6f744f3dadc00981f92ed2871d8c583194abb5a5ad08e9e0645e5516" "4b58a8e06fa66e9b8c3ab3855ad1dcd08d236f6afe87129e19a7f01a2d4aef03" "0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "c2cfe2f1440d9ef4bfd3ef4cf15bfe35ff40e6d431264b1e24af64f145cffb11" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(fci-rule-color "#383838")
 '(org-agenda-files (quote ("~/stuff.org")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

; Add ~/.emacs.d to load-path
;;(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elpa/")
;;(let ((default-directory "~/.emacs.d/github.com-packages/"))
;;  (normal-top-level-add-subdirs-to-load-path))


;;Add themes folder to custom themes list
(if (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
  (defvar custom-theme-load-path (cons "~/.emacs.d/themes/" '()))
  )

(setq inhibit-startup-screen t)


(show-paren-mode 1)
(column-number-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)
;;Get rid of tool and menu bars
(and (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(and (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;Package Setup
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;;Color-themes
;;(require 'color-theme)
(load-theme 'wombat-ext t)

;;Line numbering
(global-linum-mode 1)

;;Remove Scroll bar
(set-scroll-bar-mode nil)

;;Set font size
(set-face-attribute 'default nil :height 140)

;;Indention to spaces instead of tabs
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

;; Smart Modeline
 (setq sml/theme 'respectful)
 (require 'smart-mode-line)
 (sml/setup)

;;Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Terminals
(setq multi-term-program "/usr/local/bin/bash")
(setq multi-term-dedicated-select-after-open-p t)
(global-set-key (kbd "C-x t c") 'multi-term)
(global-set-key (kbd "C-x t n") 'multi-term-next)
(global-set-key (kbd "C-x t p") 'multi-term-prev)
(global-set-key (kbd "C-x t t") 'multi-term-dedicated-toggle)



(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x r") 'rename-buffer)


;; Cursor
;;(set-default 'cursor-type 'hbar)

;; Power Line
(require 'powerline)
(powerline-default-theme)

;;GO MODE
(setq gofmt-command "goimports")
(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(setenv "PATH" "/Users/warren/.cabal/bin:/Applications/ghc-7.8.3.app/Contents/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/Users/warren/.rvm/bin:/Users/warren/workbench/go/bin:/Users/warren/bin")
(setenv "GOPATH" "/Users/warren/workbench/go")

(load-file "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")
(go-oracle-mode)



;;Mac command modifier
(setq mac-command-modifier 'control)
;;Mac Paths
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(put 'narrow-to-region 'disabled nil)
;; Full screen
(toggle-frame-fullscreen)

;; ;; Auto Dim non-current buffers
;; (auto-dim-other-buffers-mode t)
;; ;; Disable Easy Keys
;; (require 'no-easy-keys)
;; (no-easy-keys 1)


;; Org Mode

(setq org-enforce-todo-dependencies t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(p)" "|" "DONE(d)")))
(setq org-log-done 'time)

;; Set project specific specs
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-engines-alist
      '(("go" . "\\.html\\'"))
      )
(setq auto-save-default nil)

;; SCSS
(setq scss-sass-command "sass --style=compressed")

;; Bell
(setq ring-bell-function 'ignore)

;; Nice Line Wrapping
(visual-line-mode)




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
