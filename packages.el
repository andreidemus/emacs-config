; (require 'package)
(package-initialize)
(setq package-archives '(
			 ("gnu" . "http://elpa.gnu.org/packages/") 
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ))

;; (unless (package-installed-p 'cider)
;;   (package-install 'cider))

(setq packages '(s
                 git-gutter
        		 neotree
		 
                 ))
; (dolist (package packages)
;   (unless (package-installed-p package)
;     (package-install package)))

