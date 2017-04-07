;; Package --- Kevin's init.el
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
    evil-leader
    js2-mode
    json-mode
    magit
    projectile
    puppet-mode
    robe
    rust-mode
    flycheck-rust
    rubocop
    linum-relative
    expand-region
    multiple-cursors
    zenburn-theme
    web-mode))

(dolist (kfp-package kfp-packages)
  (when (not (package-installed-p kfp-package))
    (package-install kfp-package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#bcbcbc" "#d70008" "#5faf00" "#875f00" "#268bd2" "#800080" "#008080" "#5f5f87"])
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (xoria256)))
 '(custom-safe-themes
   (quote
    ("9463f597c5a52fb267571c0de829d31d04144bf3a455fcd06d09e19522e38dbf" "c03d60937e814932cd707a487676875457e0b564a615c1edfd453f23b06fe879" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "14f0fbf6f7851bfa60bf1f30347003e2348bf7a1005570fd758133c87dafe08f" "7ceb8967b229c1ba102378d3e2c5fef20ec96a41f615b454e0dc0bfa1d326ea6" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "23c6fbb691955b9159887c14815a7996ca222022a6df2f7d65c038fa95961301" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8b30636c9a903a9fa38c7dcf779da0724a37959967b6e4c714fdc3b3fe0b8653" "6f36383e007a7739933ed5d9204423adec322d1894772ff7dd5574e74a9a2d67" "f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#383838")
 '(global-hl-line-mode t)
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(magit-push-arguments (quote ("--force-with-lease")))
 '(magit-rebase-arguments (quote ("--interactive")))
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (minitest yaml-mode markdown-mode alchemist coffee-mode 0blayout ir-black-theme jsx-mode zenburn-theme web-mode multiple-cursors expand-region linum-relative rubocop flycheck-rust robe puppet-mode magit json-mode js2-mode evil-leader evil-colemak-basics evil helm-projectile helm-ag helm scss-mode flycheck fish-mode elm-mode cargo ag)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pivotal-api-token "08c38cace810d09737da0ea7196c0b4a")
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(visible-bell t)
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

(set-face-background 'hl-line "#3e4446")

;; To have solarized working properly in the terminal I am using a
;; special theme.
(defun kfp-default-theme ()
  "#SolrizedForLife."
  (interactive)
  (setq solarized-termcolor 256)
  (set-frame-parameter nil 'background-mode 'dark)
  (set-terminal-parameter nil 'background-mode 'dark)
  (load-theme 'solarized t))

;; (kfp-default-theme)

;; Keep track of where I was in a file last
(require 'saveplace)
(setq-default save-place t)

;; Super handy way to select regions of text
;; (require 'expand-region)
;; (global-set-key (kbd "C-@") 'er/expand-region)
(projectile-mode)
(require 'helm-projectile)
(helm-projectile-on)

;; Helm-M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-.") 'helm-etags-select)
;; Multiple cusrors to make sublime look bad.
(require 'multiple-cursors)
(global-set-key (kbd "C-c m m") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m v") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)

;; Alchemist
(require 'alchemist)

;; Magit
(global-set-key (kbd "C-c g") 'magit-status)

;; Tags based searching
;; (global-set-key (kbd "C-c p t") 'helm-etags-select)

;; Flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))
;; '(scss-lint) ;; add after jshint to disable this and start using sass-lint.
;; So that we look local
;; requires: npm install -g eslint-project-relative
;; (setq flycheck-javascript-eslint-executable "/Users/kevin/Projects/OfficeSpace/huddle/node_modules/eslint/bin/eslint.js")
;; (setq flycheck-javascript-eslint-executable "eslint-project-relative")
(defun my/use-eslint-from-node-modules ()
  (let* ((root (condition-case nil (projectile-project-root) (error nil)))
	 (eslint (and root
		      (expand-file-name "bin/eslint"
					root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook 'rubocop-mode)
(add-hook 'ruby-mode-hook 'minitest-mode)

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

;; (add-hook 'emacs-lisp-mode-hook 'set-relative-line-numbers)
;; (add-hook 'rust-mode-line-numbers 'set-relative-line-numbers)
;; (add-hook 'ruby-mode-hook 'set-relative-line-numbers)
;; (add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'flycheck-rust-setup)
;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;; (add-hook 'web-mode-hook 'set-relative-line-numbers)
;; (add-hook 'elm-mode-hook 'set-relative-line-numbers)
;; (add-hook 'jsx-mode-hook 'set-relative-line-numbers)
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

;;; Maybe Spacemacs instead... This did not work out well.
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
 "tf" 'helm-projectile-find-file
 "tp" 'helm-projectile-switch-project
 "ti" 'projectile-invalidate-cache
 "tss" 'helm-projectile-ag
 "pb" 'helm-projectile-switch-to-buffer
 "tj" 'helm-etags-select
 "g"  'kfp-magit-status
 "x"  'helm-M-x
 )

(require 'evil)
(evil-mode 1)

;;; Having to define this so that "turn-off-evil-mode" will exist
;; (defun kfp-magit-status ()
;;   (interactive)
;;   (magit-status)
;;   (turn-off-evil-mode)
;; )

;; (require 'evil-colemak-basics)
;; (global-evil-colemak-basics-mode)

;; Do it last to senie if it helps load times.
(server-start)

(provide 'init)
;;; init.el ends here
(put 'downcase-region 'disabled nil)
