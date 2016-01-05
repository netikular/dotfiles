(require 'package)

(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Activate installed packages
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; Color scheme aquired from: https://github.com/sellout/emacs-color-theme-solarized
(add-to-list 'custom-theme-load-path (expand-file-name "emacs-color-theme-solarized" user-emacs-directory))

(defvar my-packages '(
ag
cargo
elixir-mode
elm-mode
evil
evil-leader
fish-mode
helm
helm-ag
helm-projectile
js2-mode
json-mode
magit
projectile
linum-relative
puppet-mode
rust-mode
web-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))

;; Essential Settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(global-hl-line-mode t)
(require 'linum-relative)
(linum-relative-on )
(column-number-mode 1)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
;;(setq create-lockfiles nil) ;; Maybe I don't want these files.
(require 'saveplace)
(setq osx-clipboard-mode t)
(require 'osx-clipboard)
(server-start)




;; (setq-default indent-tabs-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")
(setq solarized-termcolor 256)
;;
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)


;; Stolen from Aaron Bieber
(require 'init-fonts)
(require 'init-mac)

;; Markdown
(require 'markdown-mode)

;; Get my auto complete back
;; (require 'smart-tab)
;; (global-smart-tab-mode 1)


;; Configure EVIL
(require 'evil)
(evil-mode 1)

;; EVIL leader configuration
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states 1)
(evil-leader/set-key
  "T"  'projectile-invalidate-cache
  "b"  'helm-buffers-list
  "e"  'find-file
  "ff" 'toggle-frame-fullscreen
  "fm" 'toggle-frame-maximized
  "g"  'magit-status
  "s"  'helm-projectile-ag
  "t"  'helm-projectile-find-file
  "w"  'helm-swoop
  )

;; Projects
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(defun update-helm-selection-color ()
  " easier to look at colors."
  (interactive)
  (set-face-attribute 'helm-selection nil
                      :background "yellow"
                      :foreground "black"))

(add-hook 'after-init-hook 'update-helm-selection-color)

(defun set-relative-line-numbers ()
  (linum-relative-mode 1)
  )

;;;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'emacs-lisp-mode-hook 'set-relative-line-numbers)
(add-hook 'rust-mode-line-numbers)
(add-hook 'ruby-mode-hook 'set-relative-line-numbers)
(add-hook 'web-mode-hook 'set-relative-line-numbers)
(add-hook 'elixir-mode-hook 'set-relative-line-numbers)
(add-hook 'elm-mode-hook 'set-relative-line-numbers)
;; (add-hook 'jsx-mode-hook 'set-relative-line-numbers)

(define-key helm-map (kbd "C-a") 'helm-keyboard-quit)
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)


;; Save squiggle files somewhere out of the way
;; as well as autosaves
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)


;; Org mode!?!!
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Get Javascript to syntax highlight well.
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

(setq web-mode-content-types-alist
      '(("jsx"  . "\\.es6\\'")))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
           (if (equal web-mode-content-type "jsx")
             (let ((web-mode-enable-part-face nil))
               ad-do-it)
             ad-do-it))

;; (scroll-bar-mode 0) ;; useful for only  cocoa enabled version
(setq bell-volume 0)
(setq visible-bell t)

;; set all the tabs!
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq coffee-tab-width 2) ; coffeescript
(setq javascript-indent-level 2) ; javascript-mode
(setq js-indent-level 2) ; js-mode
(setq jsx-indent-level 2) ; jsx-mode
(setq js2-basic-offset 2) ; js2-mode
(setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
(setq web-mode-css-indent-offset 2) ; web-mode, css in html file
(setq web-mode-code-indent-offset 2) ; web-mode, js code in html file
(setq css-indent-offset 2) ; css-mode

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
