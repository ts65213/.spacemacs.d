(defun qiang-comment-dwim-line (&optional arg)                          ;;注释行尾/行/区域
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))


(fset 'zhushi [?\C-b ?\M-\; ?\C-e return])                              ;;定义宏zhushi 用来注释



(defun indent-region-or-buffer ()                                       ;;格式化buffer/region
  (interactive)
  (save-excursion
	(if (region-active-p)
		(progn
		  (indent-region (region-beginning) (region-end))
		  (message "Indented selected region."))
	  (progn
		(indent-region (point-min) (point-max))
		(message "Indented buffer.")))))


(defun my-kill-ring-save (beg end flash)                                ;;复制/剪切整行/区域
  (interactive (if (use-region-p)
				   (list (region-beginning) (region-end) nil)
				 (list (line-beginning-position)
					   (line-beginning-position 2) 'flash)))
  (kill-ring-save beg end)
  (when flash
	(save-excursion
	  (if (equal (current-column) 0)
		  (goto-char end)
		(goto-char beg))
	  (sit-for 0))))

(defun my-kill-region (beg end flash)
  (interactive (if (use-region-p)
				   (list (region-beginning) (region-end) nil)
				 (list (line-beginning-position)
					   (line-beginning-position 2) 'flash)))
  (kill-ring-save beg end)
  (kill-region beg end)
  )

















(provide 'my-function)


