;; Package --- Kevin's init.el
;;; Commentary: This is the evolving config!
;;; Code:

;; Since I use brew to install things it makes more sense to
;; use those binaries.
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setenv "PATH" (concat "/usr/local/var/rbenv/shims:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/var/rbenv/shims/")))

;; custom code load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

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
    0blayout
    ag
    alchemist
    base16-theme
    cargo
    coffee-mode
    elm-mode
    evil
    evil-colemak-basics
    evil-commentary
    evil-leader
    evil-magit
    evil-matchit
    expand-region
    fish-mode
    flow-minor-mode
    flycheck
    flycheck-flow
    flycheck-rust
    helm
    helm-ag
    helm-projectile
    ir-black-theme
    js2-mode
    json-mode
    jsx-mode
    linum-relative
    magit
    markdown-mode
    minitest
    multiple-cursors
    projectile
    puppet-mode
    robe
    rubocop
    rust-mode
    scss-mode
    web-mode
    yaml-mode
    zenburn-theme))

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
 '(ansi-term-color-vector
   [unspecified "#000000" "#ff6c60" "#a8ff60" "#ffffb6" "#96cbfe" "#ff73fd" "#96cbfe" "#b5b3aa"])
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (base16-irblack)))
 '(custom-safe-themes
   (quote
    ("25c06a000382b6239999582dfa2b81cc0649f3897b394a75ad5a670329600b45" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "6f36383e007a7739933ed5d9204423adec322d1894772ff7dd5574e74a9a2d67" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "23c6fbb691955b9159887c14815a7996ca222022a6df2f7d65c038fa95961301" "c03d60937e814932cd707a487676875457e0b564a615c1edfd453f23b06fe879" "a2a65367b3cfba200b4c4b0ebb149d68480eb8288158818c7562f20304be1d7e" "3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "7ceb8967b229c1ba102378d3e2c5fef20ec96a41f615b454e0dc0bfa1d326ea6" "00f192bd9f40806d032835bd057421fc6fd2885fb4838dc49cb006919665a3b3" "dd0496a5fa4ecf12bbab4311ed6ab2e5bbfaa321a6c0c0a7b3ada101a9b4b880" "9463f597c5a52fb267571c0de829d31d04144bf3a455fcd06d09e19522e38dbf" default)))
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
    (base16-theme flow-minor-mode flycheck-flow evil-magit evil-commentary evil-matchit minitest yaml-mode markdown-mode alchemist coffee-mode 0blayout ir-black-theme jsx-mode zenburn-theme web-mode multiple-cursors expand-region linum-relative rubocop flycheck-rust robe puppet-mode magit json-mode js2-mode evil-leader evil-colemak-basics evil helm-projectile helm-ag helm scss-mode flycheck fish-mode elm-mode cargo ag)))
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
 '(show-paren-match ((t (:background "#073642" :foreground "#2aa198" :weight bold)))))

;; A dir where I can load custom code
;; (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; Color scheme aquired from: https://github.com/sellout/emacs-color-theme-solarized
;; (add-to-list 'custom-theme-load-path (expand-file-name "themes/emacs-color-theme-solarized" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

;; My config:
(setq bell-volume 0)

(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

;; (set-face-background 'hl-line "#3e4446")

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
(setq helm-grep-ag-command "ag --line-numbers -S --hidden --color --color-match '31;43' --nogroup %s %s %s")
(setq helm-grep-ag-pipe-cmd-switches '("--color-match '31;43'"))

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
;; (setq flycheck-javascript-eslint-executable "eslint-project-relative")
;; (setq flycheck-javascript-eslint-executable "/Users/kevin/Projects/OfficeSpace/huddle/node_modules/eslint/bin/eslint.js")
;; (defun my/use-eslint-from-node-modules ()
;;   (let* ((root (condition-case nil (projectile-project-root) (error nil)))
;; 	 (eslint (and root
;; 		      (expand-file-name "bin/eslint"
;; 					root))))
;;     (when (and eslint (file-executable-p eslint))
;;       (setq-local flycheck-javascript-eslint-executable eslint))))

;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
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
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
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
 "f" 'helm-projectile-find-file
 "p" 'helm-projectile-switch-project
 "i" 'projectile-invalidate-cache
 "s" 'helm-projectile-ag
 "b" 'helm-projectile-switch-to-buffer
 "j" 'helm-etags-select
 "g"  'magit-status
 "x"  'helm-M-x
 )

(require 'evil)
(evil-mode 1)

(require 'evil-magit)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(evil-commentary-mode)

;; (require 'evil-colemak-basics)
;; (global-evil-colemak-basics-mode)

(autoload 'crystal-mode "crystal-mode" "Major mode for crystal files" t)
(add-to-list 'auto-mode-alist '("\\.cr$" . crystal-mode))
(add-to-list 'interpreter-mode-alist '("crystal" . crystal-mode))

;; My helper functions.
(defun kfp-black-theme ()
  "Activate the xoria256 theme."
  (interactive)
  (load-theme 'xoria256))

;; (kfp-black-theme)

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


;; (load-file "~/.emacs.d/flow-for-emacs/flow.el")

;; Do it last to see if it helps load times.
(server-start)

(provide 'init)
;;; init.el ends here
(put 'downcase-region 'disabled nil)
