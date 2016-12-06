;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; gerenal

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier 10 Pitch" :foundry "bitstream" :slant normal :weight normal :height 113 :width normal)))))

;; cua-mode: C-x,C-v,C-c,C-z
(cua-mode t)

;;; close startup message
(setq inhibit-startup-message -1)

;;; close tool bar and scroll bar
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; default major
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;; disable backup
(setq make-backup-files)

;;; close auto save
(setq auto-save-default -1)

;;; 括号匹配，高亮显示另外一边到括号
(setq show-paren-mode t)
(setq show-paren-style 'parenthesis)

;;; yes/no->y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;; title
(setq frame-title-format "%f")

;;;disable version control
(setq vc-handled-backends nil)

;;; display column number
(global-linum-mode t)
(setq column-number-mode t)
(setq line-number-mode t)

;;; display time
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;;; ido
(require 'ido)
(ido-mode t)

;;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; org mode
(require 'org-install)

;;; windmove
(windmove-default-keybindings)

;;; winner mode 
(winner-mode t) ;C-x <left>和C-x <right> to switch buffer
(global-set-key (kbd "C-x <up>") 'winner-undo)
(global-set-key (kbd "C-x <down>") 'winner-redo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; custom shortcut keys

(global-set-key (kbd "C-'")   'set-mark-command) 
(global-set-key (kbd "C-x j") 'goto-line)
(global-set-key (kbd "M-p")   'backward-paragraph)
(global-set-key (kbd "M-n")   'forward-paragraph)
				 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; hideshow
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'c++-mode-hook        'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'asm-mode-hook        'hs-minor-mode)

(global-set-key (kbd "M-1")     'hs-toggle-hiding)
(global-set-key (kbd "M-2")     'hs-hide-all)
(global-set-key (kbd "M-3")     'hs-show-all)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; cc-mode
(global-cwarn-mode 1)

(setq-default tab-width 4
	  indent-tabs-mode t)

(setq-default  c-basic-offset 4)

(setq c-default-style
    '((c-mode . "LINUX") (other . "LINUX")))

(c-toggle-auto-newline)
(c-toggle-hungry-state)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; makefile
(add-to-list 'auto-mode-alist '("\\.mak$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.defs$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.mk$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile\\." . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\onfig$" . conf-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; gtags-mode
(autoload 'gtags-mode "gtags" "" t)

(setq c-mode-hook
	 '(lambda ()
	    (gtags-mode 1)
	    ))
(global-set-key (kbd "M-g s") 'gtags-find-symbol)
(global-set-key (kbd "M-g f") 'gtags-find-file)
(global-set-key (kbd "M-g t") 'gtags-find-tag)
(global-set-key (kbd "M-g h") 'gtags-find-tag-from-here)
(global-set-key (kbd "M-g r") 'gtags-find-rtag)
(global-set-key (kbd "M-g p") 'gtags-pop-stack)
(global-set-key (kbd "M-g c") 'gtags-make-complete-list)
(global-set-key (kbd "M-g g") 'gtags-find-with-grep)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; kconfig mode
(defvar kconfig-mode-font-lock-keywords
  '(("^[\t, ]*\\_<bool\\_>" . font-lock-type-face)
	("^[\t, ]*\\_<int\\_>" . font-lock-type-face)
	("^[\t, ]*\\_<boolean\\_>" . font-lock-type-face)
	("^[\t, ]*\\_<tristate\\_>" . font-lock-type-face)
	("^[\t, ]*\\_<depends on\\_>" . font-lock-variable-name-face)
	("^[\t, ]*\\_<select\\_>" . font-lock-variable-name-face)
	("^[\t, ]*\\_<help\\_>" . font-lock-variable-name-face)
	("^[\t, ]*\\_<---help---\\_>" . font-lock-variable-name-face)
	("^[\t, ]*\\_<default\\_>" . font-lock-variable-name-face)
	("^[\t, ]*\\_<range\\_>" . font-lock-variable-name-face)
	("^\\_<config\\_>" . font-lock-constant-face)
	("^\\_<comment\\_>" . font-lock-constant-face)
	("^\\_<menu\\_>" . font-lock-constant-face)
	("^\\_<endmenu\\_>" . font-lock-constant-face)
	("^\\_<if\\_>" . font-lock-constant-face)
	("^\\_<endif\\_>" . font-lock-constant-face)
	("^\\_<menuconfig\\_>" . font-lock-constant-face)
	("^\\_<source\\_>" . font-lock-keyword-face)
	("\#.*" . font-lock-comment-face)
	("\".*\"$" . font-lock-string-face)))
 
(define-derived-mode kconfig-mode text-mode
  "kconfig"
  (set (make-local-variable 'font-lock-defaults)
	   '(kconfig-mode-font-lock-keywords t)))
 
(add-to-list 'auto-mode-alist '("*[k|K]config" . kconfig-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; highlight-indentation
;(require 'highlight-indentation)
;(add-hook 'python-mode-hook 'highlight-indentation)
;(add-hook 'cc-mode-hook 'highlight-indentation)
;(add-hook 'c-mode-hook 'highlight-indentation)


;;; elpa config
(load-file "~/.emacs.d/elpa.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
