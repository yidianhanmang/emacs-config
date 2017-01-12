
;;; melpa
(setq package-archives
	  '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
		("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)


;;; color-theme
;(require 'color-theme)
;(color-theme-dark-blue2)


;;; smex
(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "M-x") 'smex)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "gfm-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


;; Enable company globally for all mode
(global-company-mode)

;; Reduce the time after which the company auto completion popup opens
(setq company-idle-delay 0.2)

;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)

;; install racer : 
;; git clone https://github.com/phildawes/racer.git
;; cd ~/racer
;; cargo build --release
;; mv ~/racer/release/racer /usr/local/bin
;; rm -rf ~/racer

;; Set path to racer binary
(setq racer-cmd "/usr/local/bin/racer")

;; Set path to rust src directory
(setq racer-rust-src-path "/home/yidianhanmang/.rust/src/")

;; Load rust-mode when you open .rs files
(add-to-list 'auto-mode-alist '("\.rs\'" . rust-mode))

;; Setting up configurations when you load rust-mode
(add-hook 'rust-mode-hook
		  '(lambda ()
			 ;; Enable racer
			 (racer-activate)

			 ;; Hook in racer with eldoc to provide documentation
			 (racer-turn-on-eldoc)
			 
			 ;; Use flycheck-rust in rust-mode
			 (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
			 
			 ;; Use company-racer in rust mode
			 (set (make-local-variable 'company-backends) '(company-racer))
			 
			 ;; Key binding to jump to method definition
			 (local-set-key (kbd "M-.") #'racer-find-definition)
			 
			 ;; Key binding to auto complete and indent
			 (local-set-key (kbd "TAB") #'racer-complete-or-indent)))
