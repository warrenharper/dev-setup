;; Ensure that package use-package is initialized
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package exec-path-from-shell
  ;; Used to get environment variables for mac
  :ensure t
  :if (memq window-system '(mac ns))
  :init (progn
          (setq-default default-directory "/Users/warren")
          (exec-path-from-shell-initialize)
          (exec-path-from-shell-copy-env "GOPATH")
          (setenv "PATH" "/Users/warren/.cabal/bin:/Applications/ghc-7.8.3.app/Contents/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/Users/warren/.rvm/bin:/Users/warren/workbench/go/bin:/Users/warren/bin")
          ))


(use-package zenburn-theme
  ;; Dark theme
  :ensure t
  :config (load-theme 'zenburn t))

(use-package ido
  ;; Nice mini-buffer
  :ensure t
  :init (ido-mode 1))

(use-package ido-ubiquitous
  ;; ido ubiquitously
  :ensure t
  :config (ido-ubiquitous-mode 1))

(use-package ido-vertical-mode
  ;; Vertical
  :ensure
  :config (ido-vertical-mode 1))

(use-package smex
  ;; M-x with ido-style
  :ensure t
  :config (smex-initialize)
  :bind (("M-x" . smex)))

(use-package multiple-cursors
  ;; Multiple Cursors for Emacs.
  :ensure t
  :bind (("C-<" . mc/mark-previous-like-this)
         ("C-c <" . mc/skip-to-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-c >" . mc/skip-to-next-like-this)
         ("C-c C-a" . mc/mark-all-like-this)))

(use-package ace-jump-mode
  :ensure t
  :bind (("C-c SPC" . ace-jump-char-mode)))



(use-package term
  ;; Terminal
  :config (progn
            ;; Open terminal only if one doesn't exist
            (defun wh-ansi-term ()
              (interactive)
              (let ((buffer (get-buffer "*ansi-term*")))
                (if buffer
                    (switch-to-buffer buffer)
                  (ansi-term (getenv "SHELL")))))
            (define-key global-map (kbd "C-x t") 'wh-ansi-term)
            ;; Kill terminal buffer on terminal exit
            (defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
              (if (memq (process-status proc) '(signal exit))
                  (let ((buffer (process-buffer proc)))
                    ad-do-it
                    (kill-buffer buffer))
                ad-do-it))
            (ad-activate 'term-sentinel)))

(use-package tramp-term
  ;; Tramp Terminal
  :init (require 'tramp-term)
  :config (defalias 'ssh 'tramp-term))




(use-package magit
  :ensure t)

(use-package powerline
  :ensure t
  :init (progn
          (powerline-default-theme)
          (require 'powerline)))

(use-package go-mode
  ;; GO Mode for editing go programs
  :ensure t
  :init (let (( gopath (getenv "GOPATH")))
          (setq gofmt-command "goimports")
          (require 'go-mode)
          (add-hook 'before-save-hook 'gofmt-before-save)
          (load-file (concat gopath "/src/golang.org/x/tools/cmd/oracle/oracle.el"))
          (setq go-oracle-command (concat gopath "/bin/oracle"))))



(use-package auto-complete
  :ensure t
  :config (progn
            (require 'auto-complete-config)
            (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)))

(use-package go-eldoc
  :init (progn
            (require 'go-eldoc)
            (add-hook 'go-mode-hook 'go-eldoc-setup)))

(use-package org
  :config (progn
            (setq org-enforce-todo-dependencies t)
            (setq org-todo-keywords
                  '((sequence "TODO(t)" "IN PROGRESS(p)" "|" "DONE(d)")
                    (sequence "GOAL(g)" "WAITING...(w)" "|" "COMPLETED(c)")))
            (setq org-log-done 'time)
            (org-babel-do-load-languages
             'org-babel-load-languages
             '((emacs-lisp . t)
               (sh . t)))
            ;; Syntax highlighting in code blocks
            (setq org-src-fontify-natively t)
            ;; Opens appointment reminders in current window
            (setq appt-display-format 'window)))

(use-package web-mode
  :ensure t
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
          (setq web-mode-engines-alist
                '(("go" . "\\.html\\'")))))


(use-package scss-mode
  :ensure t
  :init (setq scss-sass-command "sass --style=compressed"))


(use-package haskell-mode
  :ensure t
  :config (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))

(use-package ediff
  :init (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(use-package wgrep
  :init (require 'wgrep))

(provide 'dot)


































