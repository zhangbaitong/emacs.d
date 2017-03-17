;;开启acc-jump-mode
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(unless (package-installed-p 'ac-php )
	(package-refresh-contents)
	(package-install 'ac-php )
)

;;php-mode
(require 'php-mode)
(add-hook 'php-mode-hook
        '(lambda ()
           (auto-complete-mode t)
           (require 'ac-php)
           (setq ac-sources  '(ac-source-php ) )
           (yas-global-mode 1)
           (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
           (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
           ))
;;php syntax check
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

(provide 'init-php)