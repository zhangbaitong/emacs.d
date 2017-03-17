;;加载org-mode后进行配置
(with-eval-after-load 'org
  ;;设置agenda目录
  (setq org-agenda-files '("~/org"))
  ;打开注释内语法高亮
  (setq org-src-fontify-natively t)
  ;;设置模板并制定todo文件
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/org/todo-work.org" "工作安排")
	  "* TODO [#B] %?\n %i\n"
	  :empty-lines 1)))
 ;; (setq org-todo-keywords
  ;;  '((sequence "TODO(t!)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
   ;;   ))
  
  );;--end with

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-org)
