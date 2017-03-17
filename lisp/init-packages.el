(require 'cl)
;;自定义加载功能
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
;;;自定义packages列表
(defvar zhangbaitong/packages '(
				company
				monokai-theme
				hungry-delete
				swiper
				counsel
				smartparens
				js2-mode
				nodejs-repl
				exec-path-from-shell
				popwin
				reveal-in-osx-finder
				web-mode
				js2-refactor
				expand-region
				iedit
				org-pomodoro
				which-key
				php-mode
				ac-php
				flymake-php
				) "Default Packages")
(setq package-selected-packages zhangbaitong/packages)
;;;;更新packages列表
(defun zhangbaitong/packages-installed-p()
  (loop for pkg in zhangbaitong/packages
	when (not (package-installed-p pkg))
	do (return nil)
	finally (return t)))
(unless (zhangbaitong/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg zhangbaitong/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;;配置命令行程序可见
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(global-hungry-delete-mode t)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;;配置Counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;;配置js环境
;;;js文件识别模式
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.phtml" . web-mode)
       ("\\.html\\'" . web-mode)) 
       auto-mode-alist))

;;加载monokai主题
(load-theme 'monokai t)

;保留最近打开的文件列表
(require 'recentf)
(recentf-mode t)
;启动全局的自动补全minor-mode
(global-company-mode t)
;;配置popwin支持快速关闭窗口
(require 'popwin)
(popwin-mode t)
;;配置web-mode
(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent()
  (interactive)
  "web development"
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
	  (progn
	    (setq js-indent-level (if (= js-indent-level 2) 4 2))
	    (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))
;;切换缩进2<->4
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
;;;;M-; 注释
;;配置js2-refactor
(add-hook 'js2-mode-hook 'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
;;;;popwin: M-s o 全文匹配 c-x o切窗口 ret选择 e 编辑
(global-set-key (kbd "M-s i") 'counsel-imenu)
;;区域选择增强
(global-set-key (kbd "C-=") 'er/expand-region)
;;iedit多区域选择 C-;
(global-set-key (kbd "C-;") 'iedit-mode)


(require 'org-pomodoro)



(provide 'init-packages)




