;; 1.) Script cumulates marked text in buffer "buff".
;; 2.) Script adds last line number of marked text snippet into "buff": bufname-> Line row:col. Column number ist last column in marked region.
;; See for hints on programming: https://www.gnu.org/software/emacs/manual/html_node/elisp/Current-Buffer.html

(defun a ()
  (interactive)
  (setq lns (concat "\n" (buffer-name) "->" (what-line) ":" (number-to-string (current-column)) "\n"))
  (message "%s" (buffer-file-name))

  (let ((oldbuf (current-buffer)))
    (save-current-buffer
      (get-buffer-create "buff")
      (set-buffer "buff")
      (end-of-buffer)
      (insert lns)
      (end-of-buffer)
    ))
  (append-to-buffer "buff" (region-beginning) (region-end))
  (save-current-buffer
    (set-buffer "buff")
    (insert "\n")
    (end-of-buffer)
    )
)
(global-set-key (kbd "C-h") 'a)

;; Todo:
;; Autosave "buff" content to file.
;; Remove double newlines at snippet end (when snippet contains newline).
;; Add file for browsing history and history navigation.
