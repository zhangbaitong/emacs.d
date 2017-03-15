;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; set load path
(add-to-list 'load-path "~/.emacs.d/lisp")
;; open init file by default
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; split file in modes file
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
;; use lisp/custom.el as a emacs custom config file
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
;; open debug mode
;;(setq debug-on-error t)
