(setq-default indent-tabs-mode t)                      ;;默认不用空格替代TAB
(setq default-tab-width 4)                             ;;设置TAB默认的宽度
(setq-default web-mode-markup-indent-offset 2)         ;;web-mode 缩进2

(mouse-avoidance-mode 'animate)                        ;;光标靠近鼠标时 把鼠标移走

(set-default-font "17")					               ;;字体大小
(delete-selection-mode t)                              ;;选中后输入，直接替换选中的内容

(global-hungry-delete-mode t)                          ;;一次性删除连续的空格

;;(setq-default cursor-type 'bar)			           ;;设置光标为竖线
(setq evil-emacs-state-cursor '("green" bar))

(setq make-backup-files nil)                           ;;不生成临时文件  没效果？

(setq frame-title-format "emacs@%b")                   ;;窗口title显示buffer名

(setq tramp-default-method "plink")                    ;;tramp-mode  使用plink

(setq avy-keys '(?z ?b ?c ?x ?e ?w ?g                  ;;avy-goto-char 的按键
					?h ?i ?v ?u ?t ?m ?n
					?o ?p ?q ?r ?y ?a
					?l ?s ?k ?d ?j ?f))

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
(setenv "PATH" (concat "~/global/bin;" (getenv "PATH")))










;;(add-to-list 'tramp-remote-path "/plink:0:/usr/local/sbin:/plink:0:/usr/local/bin:/plink:0:/usr/sbin:/plink:0:/usr/bin:/plink:0:/root/bin:/plink:0:/root/bin")
;;(add-to-list 'tramp-remote-path "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/root/bin")


;;(setenv "GIT_ASKPASS" "git-gui--askpass")

;;(setenv "PATH" (concat "C:\\Users\\jian.wang\\diff\\bin;" (getenv "PATH")))
;;(setenv "HOME" "c:/Users/jian.wang")

;;(exec-path-from-shell-setenv "PS1" "[\\u:\\W]$$** ")










(provide 'better-defaults)
