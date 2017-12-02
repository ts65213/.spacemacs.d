(global-set-key [f1] 'treemacs-toggle)          	       ;;F1键设为treemacs
(global-set-key [(f10)] 'loop-alpha)                       ;;F10切换透明度
(global-set-key [f12] 'help-command)                       ;;帮助



(global-set-key (kbd "C-<DEL>") 'backward-kill-word)       ;;向后删除一个词





;;(setq w32-pass-lwindow-to-system nil)
;;(setq w32-lwindow-modifier 'super) ; Left Windows key

(setq w32-pass-scroll-lock-to-system nil)
(setq w32-scroll-lock-modifier 'super) 							;; s 键

(setq w32-pass-apps-to-system nil)
(setq w32-apps-modifier 'hyper) ; Menu/App key      		;; H 键






(global-set-key (kbd "s-j") 'spacemacs/workspaces-transient-state/eyebrowse-prev-window-config)            ;;上一个workstation
(global-set-key (kbd "s-l") 'spacemacs/workspaces-transient-state/eyebrowse-next-window-config)                ;;下一个workstation

(global-set-key (kbd "s-i") 'spacemacs/layouts-transient-state/persp-prev)            ;;上一个persp
(global-set-key (kbd "s-k") 'spacemacs/layouts-transient-state/persp-next)                ;;下一个persp

(global-set-key (kbd "C-;") 'hippie-expand)		           ;;hippie-expand


(global-set-key "\M-;" 'qiang-comment-dwim-line)           ;;注释行尾/行/区域
(global-set-key (kbd "C-M-;") 'zhushi)                     ;;绑定自定义的zhushi宏

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)   ;;格式化buffer/region

(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)      ;;dired里按回车时，不生成新的buffer

(global-set-key (kbd "C-M-SPC") 'set-mark-command)         ;;C-M-SPC设为mark  不能改注册表  用ahk将C-SPC映射为C-M-SPC


(global-set-key (kbd "C-q") 'hs-toggle-hiding)             ;;绑定hs-toggle-hiding
(global-set-key (kbd "M-q") 'hs-hide-level)                ;;绑定hs-hide-lever

(global-set-key [remap kill-ring-save] 'my-kill-ring-save) ;;复制整行/区域
(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w") 'my-kill-region)               ;;剪切整行/区域
(global-set-key (kbd "C-M-w") 'spacemacs/duplicate-line-or-region)      ;;复制并粘贴整行/区域

(global-set-key (kbd "C-t") 'treemacs-toggle)          	       ;;treemacs

(global-set-key (kbd "M-y") 'helm-show-kill-ring)          ;;M-y

;;(setq local-function-key-map (delq '(kp-tab . [9]) local-function-key-map))
;;(global-set-key (kbd "C-i") 'symbol-overlay-put)
;;(keyboard-translate ?\C-i ?\H-i)
;;(global-set-key [?\H-i] 'symbol-overlay-put)               ;;symbol-overlay
(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
(global-set-key (kbd "H-i") 'symbol-overlay-put)           ;;symbol-overlay        还是与TAB绑在一起

(global-set-key (kbd "C-o") 'er/expand-region)             ;;绑定expand-region

(global-set-key (kbd "C-j") 'evil-ace-jump-char-mode)      ;;ace-jump-mode

(global-set-key (kbd "M-l") 'move-to-window-line-top-bottom)      ;;移动光标 顶部/中间/底部
(global-set-key (kbd "C-M-l") 'centered-cursor-mode)              ;;光标固定在中间

;;(global-set-key (kbd "C-s") 'spacemacs/helm-swoop-region-or-symbol)          ;;搜索

(global-set-key (kbd "C-M-n") (lambda () (interactive) (next-line 5)))       ;;光标上下移动5行
(global-set-key (kbd "C-M-p") (lambda () (interactive) (previous-line 5)))


(global-set-key (kbd "M-p") 'move-text-up)                 ;;M-p/n  上下移动一行
(global-set-key (kbd "M-n") 'move-text-down)

(global-set-key (kbd "C-x g") 'magit-status)               ;;Magit

(global-set-key (kbd "C-x C-b") 'ibuffer)                  ;;ibuffer


(define-key input-decode-map (kbd "C-m") (kbd "S-m"))
(global-set-key (kbd "S-m") 'er/expand-region)

(define-key input-decode-map (kbd "C-M-m") (kbd "S-k"))
(global-set-key (kbd "S-k") 'mc/edit-lines)              ;;multiple-cursor
(global-set-key (kbd "M-i") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M-k") 'mc/mark-more-like-this-extended)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)


(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)    ;;youdao-dictionary






;;(fset 'pre-layout [?\M-m ?l ?p ?\C-g])
;;(fset 'next-layout [?\M-m ?l ?n ?\C-g])

;;(global-set-key (kbd "C-M-,") 'pre-layout)
;;(global-set-key (kbd "C-M-.") 'next-layout)








(provide 'key-binding)


