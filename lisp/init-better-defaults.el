
;;禁用提示声音
(setq ring-bell-function 'ignore)
;;禁止备份文件和自动保存
(setq make-backup-files nil)
(setq auto-save-default nil)
;;自动加载被修改文件
(global-auto-revert-mode t)
;;添加长字符别名
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("z12" "zhangbaitong")
					    ))
;;开启最近打开文件模式
(recentf-mode 1)
(setq recentf-max-menu-items 25)
;;开启elisp-mode的括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;开启删除选中模式
(delete-selection-mode 1)
;;配置company提示延迟和开始提示前缀字符长度
(setq-default company-idle-delay 0.08)
(setq-default company-minimum-prefix-length 1)








(provide 'init-better-defaults)
