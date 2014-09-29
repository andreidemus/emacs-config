(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(unless (package-installed-p 'cider)
  (package-install 'cider))

(setq ring-bell-function 'ignore)
(set-keyboard-coding-system nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(electric-pair-pairs (quote ((39 . 39) (40 . 41) (91 . 93) (34 . 34))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun new-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer "new-buffer")))

(global-set-key (kbd "M-<up>") 'scroll-up-line)
(global-set-key (kbd "M-<down>") 'scroll-down-line)
(global-set-key (kbd "C-;") 'comment-dwim)
(global-set-key (kbd "C-/") 'comment-dwim)
(global-set-key (kbd "s-/") 'comment-dwim)
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-1") 'buffer-menu)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "s-w") 'kill-this-buffer)
(global-set-key (kbd "s-o") 'find-file)
(global-set-key (kbd "s-n") 'new-buffer)

(setq cursor-type '(bar . 2))
;(require 'color-theme)
;(color-theme-initialize)

(electric-pair-mode 1)
(show-paren-mode 1)

;;fix path when run from X
;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))

;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

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
(global-git-gutter-mode +1)
