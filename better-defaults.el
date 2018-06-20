(setq-default indent-tabs-mode t)                      ;;默认不用空格替代TAB
(setq default-tab-width 4)                             ;;设置TAB默认的宽度
(setq-default web-mode-markup-indent-offset 2)         ;;web-mode 缩进2

(mouse-avoidance-mode 'animate)                        ;;光标靠近鼠标时 把鼠标移走

;;(set-default-font "17")					               ;;字体大小

(dolist (charset '(kana han symbol cjk-misc bopomofo))  ;;中文字体
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "华文楷体" :size 24)))


(delete-selection-mode t)                              ;;选中后输入，直接替换选中的内容

(global-hungry-delete-mode t)                          ;;一次性删除连续的空格

(show-smartparens-mode nil)                            ;;不显示配对的括号
(show-smartparens-global-mode nil)                     ;;不显示配对的括号

;;(setq-default cursor-type 'bar)			           ;;设置光标为竖线
(setq evil-emacs-state-cursor '("green" bar))

(setq make-backup-files nil)                           ;;不生成 backup~
(setq auto-save-default nil)                           ;;不生成 #autosave#
;; (setq auto-save-visited-file-name t)                   ;;不生成 .#file_Name

(setq frame-title-format "emacs@%b")                   ;;窗口title显示buffer名

(setq tramp-default-method "plink")                    ;;tramp-mode  使用plink


(setq avy-keys '(?a ?b ?c ?d ?e ?f ?g                  ;;avy-goto-char 的按键
					?h ?i          ?m ?n
					?o ?p ?q ?r ?s ?t
					?u ?v ?w    ?y
					?l ?k ?j))

(setq auto-mode-alist									;;路径中有'views' 使用web-mode
	(append '(("/views/" . web-mode))
	 auto-mode-alist))


(defun my-cc-style()                                   ;;C++ mode 一些默认值
  (c-set-style "linux")
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)
  (c-set-offset 'access-label '/)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  )
(add-hook 'c++-mode-hook 'my-cc-style)




(setq explicit-shell-file-name "/bin/bash")     ;;远程打开shell




;;(setq projectile-indexing-method 'native)            ;;生成一个project


(add-to-list 'exec-path "~/global/bin")           ;;添加path   没有用
(add-to-list 'exec-path "/usr/bin")

(setenv "PATH" (concat "~/global/bin;" (getenv "PATH")))










;;(add-to-list 'tramp-remote-path "/plink:0:/usr/local/sbin:/plink:0:/usr/local/bin:/plink:0:/usr/sbin:/plink:0:/usr/bin:/plink:0:/root/bin:/plink:0:/root/bin")
;;(add-to-list 'tramp-remote-path "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/root/bin")


;;(setenv "GIT_ASKPASS" "git-gui--askpass")

;;(setenv "PATH" (concat "C:\\Users\\jian.wang\\diff\\bin;" (getenv "PATH")))
;;(setenv "HOME" "c:/Users/jian.wang")

;;(exec-path-from-shell-setenv "PS1" "[\\u:\\W]$$** ")












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
(setq company-minimum-prefix-length 2); 开始补全字数

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
	  '("~/.spacemacs.d/snippets"))  ;;yasnippet模板目录

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










(provide 'better-defaults)
