(fset 'up-10-lines
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([67108913 67108912 16] 0 "%d")) arg)))
(fset 'down-10-lines
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([67108913 67108912 14] 0 "%d")) arg)))
