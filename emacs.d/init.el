;;; Package --- Kevin's init.el
;;; Commentary: This is the evolving config!
;;; Code:

;; Since I use brew to install things it makes more sense to
;; use those binaries.
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setenv "PATH" (concat "/usr/local/var/rbenv/shims:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/var/rbenv/shims/")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; For M-x package-install

; To update the packages: M-x package-refresh-contents
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("tromey" . "http://tromey.com/elpa/") t)
;; After updating the above package archives, run M-x package-refresh-contents
(package-initialize)

(defvar kfp-packages
  '(
    ag
    alchemist
    cargo
    elm-mode
    fish-mode
    flycheck
    scss-mode
    helm
    helm-ag
    helm-projectile
    evil
    evil-colemak-basics
    js2-mode
    json-mode
    magit
    projectile
    puppet-mode
    robe
    rust-mode
    rubocop
    linum-relative
    expand-region
    multiple-cursors
    web-mode))

(dolist (kfp-package kfp-packages)
  (when (not (package-installed-p kfp-package))
    (package-install kfp-package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#bcbcbc" "#d70008" "#5faf00" "#875f00" "#268bd2" "#800080" "#008080" "#5f5f87"])
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8b30636c9a903a9fa38c7dcf779da0724a37959967b6e4c714fdc3b3fe0b8653" "6f36383e007a7739933ed5d9204423adec322d1894772ff7dd5574e74a9a2d67" "f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(global-hl-line-mode t)
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(magit-push-arguments (quote ("--force-with-lease")))
 '(magit-rebase-arguments (quote ("--interactive")))
 '(menu-bar-mode nil)
 '(pivotal-api-token "08c38cace810d09737da0ea7196c0b4a")
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(window-combination-resize t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(show-paren-match ((t (:background "#073642" :foreground "#2aa198" :weight bold)))))

;; A dir where I can load custom code
;; (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; Color scheme aquired from: https://github.com/sellout/emacs-color-theme-solarized
(add-to-list 'custom-theme-load-path (expand-file-name "themes/emacs-color-theme-solarized" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

;; My config:
(setq bell-volume 0)

(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)


;; To have solarized working properly in the terminal I am using a
;; special theme.
(defun kfp-default-theme ()
  "#SolrizedForLife."
  (interactive)
  (setq solarized-termcolor 256)
  (set-frame-parameter nil 'background-mode 'dark)
  (set-terminal-parameter nil 'background-mode 'dark)
  (load-theme 'solarized t))

(kfp-default-theme)

;; Keep track of where I was in a file last
(require 'saveplace)
(setq-default save-place t)

;; Super handy way to select regions of text
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

;; Multiple cusrors to make sublime look bad.
(require 'multiple-cursors)
(global-set-key (kbd "C-c m m") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m v") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)

;; Alchemist
(require 'alchemist)

;; Magit
(global-set-key (kbd "C-c g") 'magit-status)

;; Flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; So that we look local
;; requires: npm install -g eslint-project-relative
(setq flycheck-javascript-eslint-executable "eslint-project-relative")

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; Org mode!?!!
(make-directory "~/OrgMode" t)
(setq org-directory "~/OrgMode")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; Get Javascript to syntax highlight well.
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

(setq web-mode-content-types-alist
      '(("jsx"  . "\\.es6\\'")))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  "I don't remember why this is here."
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))
;; End javascript

;; My helper functions.
(defun kfp-black-theme ()
  "Activate the xoria256 theme."
  (interactive)
  (load-theme 'xoria256))

(defun kfp-prez-theme ()
  "Activate a theme that might work better on projectors."
  (interactive)
  (setq solarized-termcolor 256)
  (set-frame-parameter nil 'background-mode 'light)
  (set-terminal-parameter nil 'background-mode 'light)
  (load-theme 'solarized t))

(defun kfp-ruby-compile-command()
  (interactive "")
  (unless (string-match " rspec " compile-command)
    (setq compile-command (concat "cd " (projectile-project-root) " & bin/rspec  ~/.rspec_color.rb --format documentation "))))

;; Make compilation mode color text based on the ANSI color control
;; characters.
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  "A meththod that helps the compile buffer look good."
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
;;; End compilation colors

;;; Relative line numbers for only some modes
(defun set-relative-line-numbers ()
  "Function to activate relative line numbers."
  (linum-relative-mode 1))

(add-hook 'emacs-lisp-mode-hook 'set-relative-line-numbers)
(add-hook 'rust-mode-line-numbers 'set-relative-line-numbers)
(add-hook 'ruby-mode-hook 'set-relative-line-numbers)
(add-hook 'web-mode-hook 'set-relative-line-numbers)
(add-hook 'elm-mode-hook 'set-relative-line-numbers)
(add-hook 'jsx-mode-hook 'set-relative-line-numbers)
;;; End relative line numbers

(defun kfp-default-position ()
  (interactive)
  (set-frame-size (selected-frame) 170 40)
  (set-frame-position (selected-frame) 600 325))


(if (window-system) (kfp-default-position))

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
(put 'upcase-region 'disabled nil)

(require 'evil)
(evil-mode 1)

(require 'evil-colemak-basics)
(global-evil-colemak-basics-mode)

;; Do it last to see if it helps load times.
(server-start)

(provide 'init)
;;; init.el ends here
(put 'downcase-region 'disabled nil)
