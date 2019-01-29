
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(load (concat "~/.emacs.d/" system-name ".el"))

(menu-bar-mode -1)
(tool-bar-mode -1)

(load-theme 'lab-dark t)

(set-default-font "Hack-12")

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(custom-set-variables
    '(initial-frame-alist (quote ((fullscreen . maximized)))))

(custom-set-faces

 '(term-color-black ((t (:foreground "#3F3F3F" :background "#2B2B2B"))))
 '(term-color-red ((t (:foreground "#AC7373" :background "#8C5353"))))
 '(term-color-green ((t (:foreground "#7F9F7F" :background "#9FC59F"))))
 '(term-color-yellow ((t (:foreground "#DFAF8F" :background "#9FC59F"))))
 '(term-color-blue ((t (:foreground "#7CB8BB" :background "#4C7073"))))
 '(term-color-magenta ((t (:foreground "#DC8CC3" :background "#CC9393"))))
 '(term-color-cyan ((t (:foreground "#93E0E3" :background "#8CD0D3"))))
 '(term-color-white ((t (:foreground "#DCDCCC" :background "#656555"))))

 '(term-default-fg-color ((t (:inherit term-color-white))))
 '(term-default-bg-color ((t (:inherit term-color-black)))))

(setq
   backup-by-copying t
   backup-directory-alist
    '(("." . "~/.backups"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

(require 'dired-x)
(setq-default dired-omit-files-p t) ; Buffer-local variable
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

(require 'tramp)
(setq tramp-default-method "ssh")

(add-to-list 'tramp-methods
  '("gcssh"
    (tramp-login-program        "gcloud compute ssh")
    (tramp-login-args           (("%h")))
    (tramp-async-args           (("-q")))
    (tramp-remote-shell         "/bin/bash")
    (tramp-remote-shell-args    ("-c"))
    (tramp-gw-args              (("-o" "GlobalKnownHostsFile=/dev/null")
                                 ("-o" "UserKnownHostsFile=/dev/null")
                                 ("-o" "StrictHostKeyChecking=no")))
    (tramp-default-port         22)))

(require 'epa-file)
(custom-set-variables '(epg-gpg-program  "/usr/local/bin/gpg"))
(epa-file-enable)

(require 'org)

(global-set-key "\C-ca" 'org-agenda)

(setq org-log-into-drawer t)

(setq org-export-coding-system 'utf-8)

(projectile-mode)

(global-set-key "\C-cc" 'org-capture)

(setq org-capture-templates
      '(
        ("d" "daily" entry (file+datetree "~/Scriptorium/barton/System/data/daily_log.org")
         (file "~/.emacs.d/org-templates/daily.orgtmpl"))
        ("r" "refresh" entry (file+datetree "~/Scriptorium/barton/System/data/refresh_log.org")
         (file "~/.emacs.d/org-templates/daily.orgtmpl"))
        ("j" "journal" plain (file "~/Scriptorium/barton/journal.org.gpg")
         (file "~/.emacs.d/org-templates/journal.orgtmpl"))

        ("i" "inkvolt" entry (file+datetree "~/Scriptorium/barton/System/data/inkvolt_log.org")
         (file "~/.emacs.d/org-templates/inkvolt.orgtmpl"))
))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python t)))

(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(setq magit-completing-read-function 'ivy-completing-read)

;;(global-set-key "\C-s" 'swiper)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.4)
(setq company-tooltip-limit 15)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-flip-when-above t)

(defun gc-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun gc-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'gc-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'gc-minibuffer-exit-hook)

(dolist (hook '(text-mode-hook
                org-mode-hook
                markdown-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (mode '(emacs-lisp-mode-hook
                python-mode-hook))
  (add-hook mode
            '(lambda ()
               (flyspell-prog-mode))))

(add-hook 'python-mode-hook 'anaconda-mode)

(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(require 'conda)

(conda-env-initialize-interactive-shells)
(conda-env-initialize-eshell)
(conda-env-autoactivate-mode t)

(setq-default mode-line-format (reverse (cons '(:exec conda-env-current-name) (reverse mode-line-format))))

(eval-after-load "org"
  '(progn (require 'ox-odt nil t)
          (setq org-odt-preferred-output-format "docx")))

(global-set-key (kbd "C-c s") (lambda () (interactive) (dired "~/Scriptorium/")))
(setq initial-buffer-choice (concat "~/Scriptorium/" system-name))


