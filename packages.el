(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(package-refresh-contents)

(setq packages '(cider
                git-gutter))

(dolist (package packages)
  (unless (package-installed-p package)
    (package-install package)))
