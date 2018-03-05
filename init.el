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
 '(initial-frame-alist (quote ((fullscreen . fullscreen))))
 '(package-selected-packages
   (quote
    (mediawiki conda pyvenv smex company-anaconda anaconda-mode swiper counsel markdown-mode ivy magit pallet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
