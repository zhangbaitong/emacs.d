;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;自定义加载功能
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(require 'cl)
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
				) "Default Packages")

(setq package-selected-packages zhangbaitong/packages)

(defun zhangbaitong/packages-installed-p()
  (loop for pkg in zhangbaitong/packages
	when (not (package-installed-p pkg))
	do (return nil)
	finally (return t)))
;;;更新packages列表
(unless (zhangbaitong/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg zhangbaitong/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;;配置命令行程序可见
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;关闭顶部菜单
(tool-bar-mode -1)
;关闭右部滚动条

(scroll-bar-mode -1)
;显示行号
(global-linum-mode t)
;关闭欢迎界面
(setq inhibit-splash-screen t)
;定义F2打开init文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)
;保留最近打开的文件列表
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;启动全局的自动补全minor-mode
(global-company-mode t)
(setq-default company-idle-delay 0.08)
(setq-default company-minimum-prefix-length 1)
;修改光标类型为竖线
(setq-default cursor-type 'bar)
;禁止备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)
;打开org-mode注释内的语法高亮
(require 'org)
(setq org-src-fontify-natively t)
;;配置gtd
(setq org-agenda-files '(~/org))
(global-set-key (kbd "C-c a") 'org-agenda)
;;开启删除选中模式
(delete-selection-mode -1)
;;启动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;开启elisp-mode的括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;显示当前行选中状态
(global-hl-line-mode t)
;;加载monokai主题
(load-theme 'monokai t)
;;自动加载被修改文件
(global-auto-revert-mode t)
;;加载饥饿删除功能
(require 'hungry-delete)
(global-hungry-delete-mode t)
;;配置smartparens
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;;配置Counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
;;配置全局帮助键绑定
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;配置js环境
;;;js文件识别模式
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
