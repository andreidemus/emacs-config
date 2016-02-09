(load-file "~/.emacs.d/packages.el")

(setq ring-bell-function 'ignore)
(set-keyboard-coding-system nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" default)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((((class color) (background light)) (:background "#B4CDE1"))))
 )

(defun new-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer "new-buffer")))

(scroll-bar-mode -1)
(set-face-attribute 'mode-line nil  :box nil)

(electric-pair-mode 1)
(show-paren-mode 1)

;; fix the PATH variable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; autocompletion
(global-company-mode)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)

(delete-selection-mode 1)
(scroll-bar-mode -1)
;; (set-face-attribute 'mode-line nil  :height 120)
(set-face-attribute 'mode-line nil  :box nil)

(setq mouse-wheel-scroll-amount '(0.03))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(desktop-save-mode t)

;; neotree
(require 'neotree)
(setq-default neo-smart-open t)
(setq-default neo-theme 'arrow)

(load-file "~/.emacs.d/ocaml.el")

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "M-<up>") 'scroll-up-line)
(global-set-key (kbd "M-<down>") 'scroll-down-line)
(global-set-key (kbd "C-;") 'comment-dwim)
(global-set-key (kbd "C-/") 'comment-dwim)
(global-set-key (kbd "s-/") 'comment-dwim)
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)

(global-set-key (kbd "s-1") 'neotree-toggle)
(global-set-key (kbd "s-e") 'buffer-menu)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "s-w") 'kill-this-buffer)
(global-set-key (kbd "s-o") 'find-file)
(global-set-key (kbd "s-n") 'new-buffer)
(global-set-key (kbd "s-<up>") (lambda () (interactive) (scroll-down 20)))
(global-set-key (kbd "s-<down>") (lambda () (interactive) (scroll-up 20)))

(global-set-key (kbd "s-<return>") 'utop-eval-region)
(global-set-key [f8] 'merlin-error-check)
(global-set-key [f11] 'git-gutter:popup-diff)
(global-set-key (kbd "C-<f11>") 'vc-diff)

;; -- common-lisp compatibility if not added earlier in your .emacs
(require 'cl)

;; Color Theme
(require 'color-theme)
(color-theme-initialize)
(set-face-background 'default "#f7f7f7")
(set-face-foreground 'default "#1a1a1a")
;; (set-face-attribute 'mode-line nil :height 120) 
(set-face-attribute 'vertical-border nil :foreground "grey")

(require 'git-gutter)
(global-git-gutter-mode +1)
(setq git-gutter:always-show-gutter t)
(setq git-gutter:update-threshold 2)
(setq git-gutter:update-hooks '(after-save-hook after-revert-hook))
(setq git-gutter:modified-sign " ")
(setq git-gutter:added-sign " ")
(setq git-gutter:deleted-sign " ")
(set-face-background 'git-gutter:modified "#B4CDE1")
(set-face-foreground 'git-gutter:modified "#B4CDE1")
(set-face-background 'git-gutter:added "#9AD39A")
(set-face-foreground 'git-gutter:added "#9AD39A")
(set-face-background 'git-gutter:deleted "#F7A59C")
(set-face-foreground 'git-gutter:deleted "#F7A59C")
(setq git-gutter:unchanged-sign nil)
(set-face-background 'git-gutter:unchanged nil)

;; Do not show line numbers
(global-linum-mode 0)

;; Cursor as single bar
(setq-default cursor-type '(bar . 1))

;; Show column number in bottom line
(setq column-number-mode t)
