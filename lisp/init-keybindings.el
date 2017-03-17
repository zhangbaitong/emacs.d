;;自定义按键
;;;;查找键定义: c-h k cmd
;;第一版按键定义
;;(global-set-key (kbd "M-o") 'ido-find-file)
;;(global-set-key (kbd "M-s") 'save-buffer)
;;(global-set-key (kbd "M-q") 'quit-window)
;;(global-set-key (kbd "M-l") 'ido-switch-buffer)
;;;;;;定义smex
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
 ;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;;第二版按键定义
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-c p f") 'counsel-git)
;;配置全局帮助键绑定
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
;;打开init.el文件
(global-set-key (kbd "<f2>") 'open-init-file)
;;最近打开的文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;缩进格式化
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
;;补充company-mode的补全
(global-set-key (kbd "s-/") 'hippie-expand)
;;dired回车在当前缓冲区打开
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(global-set-key (kbd "C-c a") 'org-agenda)

;;;;定义插件按键
;;;;;;定义switch-window
(global-set-key (kbd "M-p") 'switch-window)

(provide 'init-keybindings)
