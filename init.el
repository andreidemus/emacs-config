;;;;;;;;;;;;;;
;; Packages ;;
;;;;;;;;;;;;;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/packages.el")


;;;;;;;;;;;;;
;; Helpers ;;
;;;;;;;;;;;;;
(defun new-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer "new-buffer")))


(require 'cider)

;;;;;;;;;;;;;;;
;; Shortcuts ;;
;;;;;;;;;;;;;;;
(global-set-key (kbd "s-<return>") 'cider-eval-last-sexp)

(global-set-key (kbd "M-<up>") 'scroll-up-line)
(global-set-key (kbd "M-<down>") 'scroll-down-line)
(global-set-key (kbd "C-;") 'comment-dwim)
(global-set-key (kbd "C-/") 'comment-dwim)
(global-set-key (kbd "s-/") 'comment-dwim)
(global-set-key (kbd "RET") 'reindent-then-newline-and-indent)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)

;; (global-set-key (kbd "s-1") 'neotree-toggle) 
(global-set-key (kbd "s-e") 'buffer-menu)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "s-w") 'kill-this-buffer)
(global-set-key (kbd "s-o") 'find-file)
(global-set-key (kbd "s-n") 'new-buffer)
(global-set-key (kbd "s-<up>") (lambda () (interactive) (scroll-down 20)))
(global-set-key (kbd "s-<down>") (lambda () (interactive) (scroll-up 20)))


;;;;;;;;;;;;;;;
;; UI tweaks ;;
;;;;;;;;;;;;;;;
(setq mouse-wheel-scroll-amount '(0.03))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq-default cursor-type '(bar . 2)) ;; cursor as thin bar
;; Disable scroll bar
(scroll-bar-mode -1)
;; Do not show line numbers
(global-linum-mode 0)
;; Disable toolbar
(tool-bar-mode -1)
;; Vertical border style
(set-face-attribute 'vertical-border nil :foreground "grey")
;; Mode line style
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line nil :height 120)


;;;;;;;;;;;;;;;;;
;; Color Theme ;;
;;;;;;;;;;;;;;;;;
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Faces-for-Font-Lock.html
(set-face-background 'default "#F0F0F0")
(set-face-foreground 'default "#101010")
(set-face-foreground 'font-lock-string-face "#008000")
(set-face-foreground 'font-lock-comment-face "#888888")
(set-face-foreground 'font-lock-function-name-face "#101010")
(set-face-foreground 'font-lock-keyword-face "#000080")


;;;;;;;;;;;;;;;
;; Mode line ;;
;;;;;;;;;;;;;;;
;; Show column number in bottom line
(setq column-number-mode t)


;;;;;;;;;;;;;;;;
;; Git Gutter ;;
;;;;;;;;;;;;;;;;
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


;;;;;;;;;;;;;;;;;;;
;; Uncategorized ;;
;;;;;;;;;;;;;;;;;;;
;; Keep session
(desktop-save-mode 1)
;; When typing, selection replaced with entered text
(delete-selection-mode 1)

(electric-pair-mode 1)
(show-paren-mode 1)

;; No annoying beeps
(setq ring-bell-function 'ignore)

;; fix the PATH variable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;https://www.gnu.org/software/emacs/manual/html_node/emacs/Terminal-Coding.html
;;(set-keyboard-coding-system nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (exec-path-from-shell git-gutter cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
