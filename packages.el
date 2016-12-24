(require 'package)

;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(package-refresh-contents)

(setq packages '(cider
                 git-gutter
                 exec-path-from-shell
                 neotree
                 all-the-icons))

(dolist (package packages)
  (unless (package-installed-p package)
    (package-install package)))
