(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; should be fixed in 26.3+
(require 'package)

(setq package-list '(cider
                     git-gutter
                     exec-path-from-shell
                     all-the-icons
                     sesman
                     neotree
                     undo-tree
                     magit
                     expand-region
                     projectile))

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(package-refresh-contents)

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
