;; initialize package.el packages
(package-initialize)

;; load literal config
(require 'org)
(org-babel-load-file
 (expand-file-name "Emacs.org"
                   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(org-agenda-files
   (quote
    ("/Users/barton/Scriptorium/barton/Health/Diet.org" "/Users/barton/Scriptorium/barton/Health/Health.org" "/Users/barton/Scriptorium/barton/System/data/daily.org" "/Users/barton/Scriptorium/barton/System/System.org" "/Users/barton/Scriptorium/barton/barton.org")))
 '(org-columns-default-format "%25ITEM %TODO %SCHEDULED")
 '(package-selected-packages
   (quote
    (lab-themes skeletor projectile mediawiki conda pyvenv smex company-anaconda anaconda-mode swiper counsel markdown-mode ivy magit pallet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
