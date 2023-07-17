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

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))
















(provide 'my-function)


