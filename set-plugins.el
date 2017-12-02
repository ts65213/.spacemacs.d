;;-------------------------------------------------------------------------------------dired
(setq dired-recursive-deletes 'always)  ;;dired总是递归复制/删除目录
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil) ;;dired里按回车时，不生成新的buffer

;;-------------------------------------------------------------------------------------ibuffer
;;(add-to-list 'ibuffer-never-show-regexps "^\\*")
;;(add-to-list 'ibuffer-never-show-predicates "^\\*")    ;;隐藏*开头的buffer

(setq ibuffer-saved-filter-groups     ;;分组
      (quote (("default"
			   ("controller" (filename . "controllers"))
			   ("models" (filename . "models"))
               ("html" (filename . "views"))
               ("javascript" (mode . js2-mode))
               ("css" (mode . css-mode))
               ("other-php" (mode . php-mode))
               ("org" (mode . org-mode))
               ("lisp" (mode . emacs-lisp-mode))
               ("conf" (filename . "conf"))
			   ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;;-------------------------------------------------------------------------------------company
(setq company-show-numbers t); 显示序号
(setq company-idle-delay 0); 菜单延迟
(setq company-minimum-prefix-length 1); 开始补全字数

;;-------------------------------------------------------------------------------------treemacs
(setq treemacs-width 25)

;;-------------------------------------------------------------------------------------popwin
(setq-default popup-window-position 'right)

;;-------------------------------------------------------------------------------------hippie
(setq hippie-expand-try-functions-list 	;;设定hippie的顺序
	  '(try-expand-dabbrev
		try-expand-dabbrev-visible
		try-expand-dabbrev-all-buffers
		try-expand-dabbrev-from-kill
		try-complete-file-name-partially
		try-complete-file-name
		try-expand-all-abbrevs
		try-expand-list
		try-expand-line
		try-complete-lisp-symbol-partially
		try-complete-lisp-symbol))

;;-------------------------------------------------------------------------------------yasnippet
(setq yas-snippet-dirs
	  '("~/my-config/snippets"))  ;;yasnippet模板目录

(defun yas-advise-indent-function (function-symbol)
  (eval `(defadvice ,function-symbol (around yas-try-expand-first activate)
		   ,(format
			 "Try to expand a snippet before point, then call `%s' as usual"
			 function-symbol)
		   (let ((yas-fallback-behavior nil))
			 (unless (and (interactive-p)
						  (yas-expand))
			   ad-do-it)))))

;;tab有时无效  C-h k <tab>  查看tab绑定的命令  然后用下面的方式使其生效
(yas-advise-indent-function 'indent-for-tab-command)
(yas-advise-indent-function 'symbol-overlay-put)
(yas-advise-indent-function 'c-indent-line-or-region)

;;-------------------------------------------------------------------------------------package
(setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")))
;;(setq package-archives '(("popkit" . "https://elpa.popkit.org/packages/")))


;;-------------------------------------------------------------------------------------Org
;;(org-indent-mode t);;大纲缩进

(setq org-log-done 'time);;TODO完成时添加时间

;;save the clock history across Emacs sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;;子TODO都完成时，将父TODO设为DONE,貌似父TODO要有[/]或[%]才有效
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
	(org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-src-fontify-natively t)       ;;高亮org里插入的代码



;;-------------------------------------------------------------------------------------Diff
(add-hook 'ediff-load-hook
          (lambda ()
            (set-face-foreground
             ediff-fine-diff-face-A "white")
            (set-face-background
             ediff-fine-diff-face-A "black")
            (set-face-foreground
             ediff-fine-diff-face-B "white")
            (set-face-background
             ediff-fine-diff-face-B "black")
						;; (make-face-italic
             ;; ediff-fine-diff-face-B)
						))








(provide 'set-plugins)
