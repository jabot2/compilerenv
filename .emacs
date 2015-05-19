; -*- emacs-lisp -*-

;; (and (fboundp 'mouse-wheel-mode) (mouse-wheel-mode 1))
(set-variable 'undo-limit 20000000)
(set-variable 'undo-strong-limit 30000000)
(and (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))

(add-hook 'java-mode-hook 
	  (lambda () 
	     (set (make-local-variable 'compile-command )
		  (format "javac -Xlint %s" 
		  (buffer-name (current-buffer))))))

(line-number-mode 1)
(column-number-mode 1)
(global-font-lock-mode 1)
(show-paren-mode t)
(menu-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message  t)
(setq inhibit-splash-screen t)
(transient-mark-mode t)
(ido-mode)
