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
 '(custom-safe-themes
   (quote
    ("a2afb83e8da1d92f83543967fb75a490674a755440d0ce405cf9d9ae008d0018" "980f0adf3421c25edf7b789a046d542e3b45d001735c87057bccb7a411712d09" default)))
 '(epg-gpg-program "/usr/local/bin/gpg")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files
   (quote
    ("/Users/barton/Scriptorium/barton/Health/Diet.org" "/Users/barton/Scriptorium/barton/Health/Health.org" "/Users/barton/Scriptorium/barton/System/data/daily.org" "/Users/barton/Scriptorium/barton/System/System.org" "/Users/barton/Scriptorium/barton/barton.org")))
 '(org-columns-default-format "%25ITEM %TODO %SCHEDULED")
 '(package-selected-packages
   (quote
    (use-package evil-org org-evil evil lab-themes skeletor projectile mediawiki conda pyvenv smex company-anaconda anaconda-mode swiper counsel markdown-mode ivy magit pallet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term-color-black ((t (:foreground "#3F3F3F" :background "#2B2B2B"))))
 '(term-color-blue ((t (:foreground "#7CB8BB" :background "#4C7073"))))
 '(term-color-cyan ((t (:foreground "#93E0E3" :background "#8CD0D3"))))
 '(term-color-green ((t (:foreground "#7F9F7F" :background "#9FC59F"))))
 '(term-color-magenta ((t (:foreground "#DC8CC3" :background "#CC9393"))))
 '(term-color-red ((t (:foreground "#AC7373" :background "#8C5353"))))
 '(term-color-white ((t (:foreground "#DCDCCC" :background "#656555"))))
 '(term-color-yellow ((t (:foreground "#DFAF8F" :background "#9FC59F"))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(term-default-fg-color ((t (:inherit term-color-white)))))
