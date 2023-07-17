
;;#################################################################################################### 杂项
(global-set-key [f12] 'help-command)																														 ;;帮助
(global-set-key (kbd "C-x g") 'magit-status)																										 ;;Magit

;;#################################################################################################### file、buffer 等
(global-set-key (kbd "s-j") 'spacemacs/workspaces-transient-state/eyebrowse-prev-window-config)  ;;上一个workstation
(global-set-key (kbd "s-l") 'spacemacs/workspaces-transient-state/eyebrowse-next-window-config)  ;;下一个workstation

(global-set-key (kbd "s-i") 'spacemacs/layouts-transient-state/persp-prev)											 ;;上一个layout
(global-set-key (kbd "s-k") 'spacemacs/layouts-transient-state/persp-next)											 ;;下一个layout


;;(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)														 ;;dired里按回车时，不生成新的buffer

(global-set-key (kbd "C-x C-b") 'ibuffer)																												 ;;ibuffer

;;#################################################################################################### 光标
(global-set-key (kbd "C-j") 'avy-goto-char)																											 ;;avy-goto-char

(global-set-key (kbd "M-l") 'move-to-window-line-top-bottom)																		 ;;移动光标 顶部/中间/底部
(global-set-key (kbd "C-M-l") 'centered-cursor-mode)																						 ;;光标固定在中间

(global-set-key (kbd "C-M-n") (lambda () (interactive) (next-line 5)))													 ;;光标上下移动5行
(global-set-key (kbd "C-M-p") (lambda () (interactive) (previous-line 5)))

(define-key input-decode-map (kbd "C-M-m") (kbd "S-k"))
(global-set-key (kbd "S-k") 'mc/edit-lines)																											 ;;multiple-cursor
(global-set-key (kbd "M-i") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M-k") 'mc/mark-more-like-this-extended)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

;;#################################################################################################### 文本
;; (global-set-key (kbd "C-SPC") 'set-mark-command)																						 ;;mark set
(global-set-key (kbd "C-<f11>") 'set-mark-command)																						 ;;mark set

(global-set-key (kbd "C-o") 'er/expand-region)																									 ;;expand-region



(global-set-key "\M-;" 'qiang-comment-dwim-line)																								 ;;注释行尾/行/区域
(global-set-key (kbd "C-M-;") 'zhushi)																													 ;;自定义的zhushi宏

(global-set-key [remap kill-ring-save] 'my-kill-ring-save)																			 ;;复制整行/区域
(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w") 'my-kill-region)																										 ;;剪切整行/区域
(global-set-key (kbd "C-M-w") 'spacemacs/duplicate-line-or-region)															 ;;复制并粘贴整行/区域

(global-set-key (kbd "M-y") 'helm-show-kill-ring)																								 ;;kill-ring

(global-set-key (kbd "M-p") 'move-text-up)																											 ;;上下移动一行
(global-set-key (kbd "M-n") 'move-text-down)

(global-set-key (kbd "C-<backspace>") 'backward-kill-word)																			 ;;向后删除一个词

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)																				 ;;格式化buffer/region

(global-set-key (kbd "C-q") 'hs-toggle-hiding)																									 ;;hs-toggle-hiding
(global-set-key (kbd "M-q") 'hs-hide-level)																											 ;;hs-hide-lever

;;#################################################################################################### 补全
(global-set-key (kbd "C-;") 'hippie-expand)																											 ;;hippie-expand

;;#################################################################################################### 查找、高亮
(global-set-key (kbd "C-<f9>") 'symbol-overlay-put)																							 ;;symbol-overlay




(provide 'key-binding)
