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

;;配置Counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)


;;配置js环境
;;;js文件识别模式
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;加载monokai主题
(load-theme 'monokai t)

;保留最近打开的文件列表
(require 'recentf)
(recentf-mode t)



;启动全局的自动补全minor-mode
(global-company-mode t)

(global-set-key (kbd "C-c a") 'org-agenda)
;;配置popwin支持快速关闭窗口
(require 'popwin)
(popwin-mode t)



(provide 'init-packages)
