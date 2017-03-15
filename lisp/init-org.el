(with-eval-after-load 'org
;;(require 'org)
  (setq org-agenda-files '("~/Documents/record2016/org"))
  ;打开org-mode注释内的语法高亮
  (setq org-src-fontify-natively t)
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	  "* TODO [#B] %?\n %i\n"
	  :empty-lines 1)))
 ;; (setq org-todo-keywords
  ;;  '((sequence "TODO(t!)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
   ;;   ))
  
  );;--end with

;;配置gtd
;;(setq org-agenda-files '(~/org))
;;(setq org-agenda-files '(/Users/zhangtao/Documents/repository/github/practice-emacs))
(global-set-key (kbd "C-c a") 'org-agenda)


(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-org)
