;; Default mode
(custom-set-variables '(major-mode (quote conf-mode)))

;; Load theme
(load-theme 'manoj-dark)

;; Set melpa stable
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Never, ever use tabs
(setq-default indent-tabs-mode nil)

;; Disable backup
(setq backup-inhibited t)

;; Other settings
(setq-default fill-column 9999)
(setq auto-fill-mode t)
(setq-default auto-fill-function 'do-auto-fill)

;; Line numbers
(global-linum-mode t)
(set-window-margins nil 1)
(column-number-mode t)
(setq linum-format "%4d ")

;; Save cursor position in files
(save-place-mode 1)
(setq save-place-file "~/.emacs.d/saveplace")
;;(setq-default save-place t)

;; Extra functions
(defun ff/comment-and-go-down (arg)
  "Comments and goes down ARG lines."
  (interactive "p")
  (condition-case nil
      (comment-region (point-at-bol) (point-at-eol)) (error nil))
  (next-line 1)
  (if (> arg 1) (ff/comment-and-go-down (1- arg))))


(defun ff/uncomment-and-go-up (arg)
  "Uncomments and goes up ARG lines."
  (interactive "p")
  (condition-case nil
      (uncomment-region (point-at-bol) (point-at-eol)) (error nil))
  (next-line -1)
  (if (> arg 1) (ff/uncomment-and-go-down (1- arg))))


;; Keybindings

(global-set-key (kbd "ESC <down>") 'ff/comment-and-go-down)
(global-set-key (kbd "ESC <up>") 'ff/uncomment-and-go-up)

;; Unset page up and down
(global-unset-key (kbd "<prior>"))
(global-unset-key (kbd "<next>"))
