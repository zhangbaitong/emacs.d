;; init-ui.el

;;关闭顶部菜单
(tool-bar-mode -1)
;;关闭右部滚动条
(scroll-bar-mode -1)
;;显示行号
(global-linum-mode t)
;;修改光标类型为竖线
(setq-default cursor-type 'bar)
;;关闭欢迎界面
(setq inhibit-splash-screen t)
;;启动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;显示当前行选中状态
(global-hl-line-mode t)

(provide 'init-ui)
