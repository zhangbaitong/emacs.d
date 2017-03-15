
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
;;开启匹配括号高亮
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "高亮闭包括号"
(cond ((looking-at-p "\\s(") (funcall fn))
      (t (save-excursion
	   (ignore-errors (backward-up-list))
	   (funcall fn)))))
;;开启删除选中模式
(delete-selection-mode 1)
;;配置company提示延迟和开始提示前缀字符长度
(setq-default company-idle-delay 0.08)
(setq-default company-minimum-prefix-length 1)
;;缩进格式化
(defun indent-buffer()
  "全文件格式化"
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  "格式化选中区域，否则全文见格式化"
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "缩进选中区域。"))
      (progn
	(indent-buffer)
	(message "缩进整个buffer。")))))
;;补全增强
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))
;;简化emacs提问为y or n
(fset 'yes-or-no-p 'y-or-n-p)
;;dired遍历操作
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
;;dired使用单一buffer
(put 'dired-find-alternate-file 'disabled nil)
;;当前文件目录代开dired c-x c-j
(require 'dired-x)
;;双窗口对拷
(setq dired-dwim-target t)
;;处理web页面的换行符号
(defun hidden-dos-eol()
  "不显示^M符号，方式混合unix和dos的换行符号"
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
(defun remove-dos-eol()
  "删除^M"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
;;dwim : do what i mean
(defun occur-dwin()
  "使用鼠标当前所在内容作为occur搜索字符"
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'sympol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwin)

;;(set-language-environment "UTF-8")

(provide 'init-better-defaults)
