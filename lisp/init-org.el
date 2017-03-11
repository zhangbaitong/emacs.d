(require 'org)
;打开org-mode注释内的语法高亮
(setq org-src-fontify-natively t)
;;配置gtd
(setq org-agenda-files '(~/org))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
