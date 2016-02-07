(package-initialize)
(setq package-archives '(
			 ("gnu" . "http://elpa.gnu.org/packages/") 
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ))

;; (unless (package-installed-p 'cider)
;;   (package-install 'cider))

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
 )

(defun new-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer "new-buffer")))

(setq cursor-type '(bar . 2))
;(require 'color-theme)
;(color-theme-initialize)
;;(load-theme 'mccarthy t)
;;(load-theme 'solarized-dark t)
;; (custom-theme-set-faces
;;  `zenburn
;;  `(git-gutter:added ((t (:foreground "#90ee90" :weight bold :inverse-video t))))
;;  `(git-gutter:modified ((t (:foreground "#a6a6a6" :weight bold :inverse-video t))))
;;  `(git-gutter:deleted ((t (:foreground "#fa8072" :weight bold :inverse-video t))))
;;  `(show-paren-match ((t (:background "#5F5F5F"))))
;;  `(whitespace-space ((t (:foreground "#5F5F5F"))))
;;  `(whitespace-hspace ((t (:foreground "#5F5F5F"))))
;;  `(region ((t (:foreground "#FFF" :background "#4C7073")))))
(scroll-bar-mode -1)
;; (set-face-attribute 'mode-line nil  :height 120)
(set-face-attribute 'mode-line nil  :box nil)


(electric-pair-mode 1)
(show-paren-mode 1)

;;fix path when run from X
;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))

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
(scroll-bar-mode -1)
;; (set-face-attribute 'mode-line nil  :height 120)
(set-face-attribute 'mode-line nil  :box nil)

;; scroll one line at a time (less "jumpy" than defaults)
;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-scroll-amount '(0.07))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; window size on start
;; (set-frame-size (selected-frame) 202 56)

;; (require 'tramp)
;; (setq tramp-default-method "ssh")
;;(setq scroll-preserve-screen-position t)

(desktop-save-mode t)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; neotree
(require 'neotree)
(setq neo-smart-open t)`
(setq neo-theme 'arrow)

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

(global-set-key [f8] 'merlin-error-check)

;; (global-set-key (kbd "s-<up>") 'scroll-up-command)
;; (global-set-key (kbd "s-<down>") 'scroll-down-command)

;; -- common-lisp compatibility if not added earlier in your .emacs
(require 'cl)

;; -- Tweaks for OS X -------------------------------------
;; Tweak for problem on OS X where Emacs.app doesn't run the right
;; init scripts when invoking a sub-shell
;; (cond
;;  ((eq window-system 'ns) ; macosx
;;   ;; Invoke login shells, so that .profile or .bash_profile is read
;;   (setq shell-command-switch "-lc")))

(dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (cadr var)))

;; Update the emacs path
(setq exec-path (append (parse-colon-path (getenv "PATH"))
                        (list exec-directory)))

;;merlin
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)

;; Update the emacs load path
(add-to-list 'load-path (expand-file-name "../../share/emacs/site-lisp"
                                          (getenv "OCAML_TOPLEVEL_PATH")))

(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist)) 
(add-hook 'tuareg-mode-hook 'utop-minor-mode)
(add-hook 'tuareg-mode-hook 'merlin-mode)

(autoload 'merlin-mode "merlin" "Merlin mode" t)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)
(add-hook 'caml-mode-hook 'merlin-mode)

(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
