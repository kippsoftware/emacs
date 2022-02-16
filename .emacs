;;
;; My personal .emacs file with some commands dating back to about 1988
;;
;; dog	cat
;;

;; Added by Package.el
(package-initialize)

;; Show line numbers
;; M-x linum-mode 

;; set-buffer-file-coding-system
;;   Command: Set the file coding-system of the current buffer to CODING-SYSTEM.

;; Invocation from legacy shell vs. X-windows
(if window-system
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (menu-bar-mode -1)))

;; Use when projecting live emacs
(setq font-bigger-flag nil)
(setq normal-font "-*-Courier-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (setq normal-font "-*-Lucidia Sans Unicode-normal-r-*-*-14-*-*-*-c-*-fontset-standard")
;; (setq normal-font "-apple-Lucida_Sans_Typewriter-medium-normal-normal-*-14-*-*-*-p-0-iso10646-1")
;; (setq normal-font "Lucida Sans Typewriter 12")
;; (setq bigger-font "-*-Lucidia Sans Unicode-normal-r-*-*-18-*-*-*-c-*-fontset-standard")
;; (setq bigger-font "-apple-Lucida_Sans_Typewriter-medium-normal-normal-*-18-*-*-*-p-0-iso10646-1")
;; (setq bigger-font "-apple-My_Underwood-medium-normal-normal-*-24-*-*-*-p-0-iso10646-1")
(setq bigger-font "-*-Courier-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")
;; (setq bigger-font "Lucida Sans Typewriter 24")
;; (set-frame-font normal-font nil t)
;; (set-default-font normal-font)

(defun size-toggle ()
  "Toggle larger font."
  (interactive)
  (if font-bigger-flag
      (progn 
	(setq font-bigger-flag nil)
	(set-frame-font normal-font nil t)
	(message "Font size normal."))
    (progn 
      (setq font-bigger-flag t)
      (set-frame-font bigger-font nil t)
      (message "Font size bigger."))))

;; My first boss wrote the more obscure macros
(defun case-fold-toggle (arg)
  "Toggle case-fold-search variable between nil and t."
  (interactive "p")
  (if case-fold-search
      (setq case-fold-search nil)
    (setq case-fold-search t))
  (message "Case %s in searches."
	   (if (equal case-fold-search nil)
	       "matters" "folds")))

;; (standard-display-8bit 32 255)

;; Double spacing after period is handled better now
;; (set-variable 'sentence-end-double-space nil)

;; Useful when you unset C-SPACE as mark set
(transient-mark-mode 1)

;; Never miss a meeting even when in full screen mode
(setq display-time-day-and-date t)
(display-time)

;; Used to be a white box centered in the display
(setq visible-bell 1)

;; (setq-default indent-tabs-mode nil)
;; (setq indent-tabs-mode nil)

;; Install Xcode
;; Install MacPorts
;; % sudo port install aspell
;; % sudo port install aspell-dict-en
;; % brew install aspell
(setq ispell-program-name "aspell")
(add-to-list 'exec-path "/usr/local/bin")

;; Python
;; (autoload 'python-mode "python-mode" "Python editing mode." t)
;; (setq auto-mode-alist
;;   (cons '("\\.py$" . python-mode) auto-mode-alist))
;; (add-hook 'python-mode-hook 'turn-on-font-lock)
;; (setq py-indent-offset 2)

;; Go
(add-to-list 'load-path "~/.emacs.d/lisp/")
;;(load "go-mode")
;;(load "fountain-mode")
;;(add-to-list 'auto-mode-alist '("\\.fountain$" . fountain-mode))

;; Other modules
(load "wc-mode")
;;(load "typescript-mode")
;;(load "markdown-mode")

;; My key bindings; some are from "micro-emacs" on the Atari 1988
(global-set-key "\000"      'next-buffer)
(global-set-key [?\C- ]     'next-buffer)
(global-set-key "\C-\\"     'ispell-word)
(global-set-key "\C-]"      'dabbrev-expand)
(global-set-key "\C-^"      'capitalize-letter)
(global-set-key "\C-c\C-e"  'compile)
(global-set-key "\C-c\C-n"  'vc-toggle-read-only)
(global-set-key "\C-cd"     'gdb)
(global-set-key "\C-cg"     'switch-to-gud)
(global-set-key "\C-cs"     'shell)
(global-set-key "\C-h"      'delete-backward-char)
(global-set-key "\C-r"      'isearch-backward)
(global-set-key "\C-x6"     'size-toggle)
(global-set-key "\C-x7"     'case-fold-toggle)
(global-set-key "\C-x9"     'auto-fill-mode)
(global-set-key "\C-x8"     'revert-buffer)
(global-set-key "\C-x\C-m"  'mips-database)
(global-set-key "\C-x\C-n"  'scroll-up-one)
(global-set-key "\C-x\C-p"  'scroll-down-one)
(global-set-key "\C-x\C-u"  'capitalize-letter)
(global-set-key "\C-x\C-v"  'view-file)
(global-set-key "\C-xc"     'suspend-emacs)
(global-set-key "\C-xl"     'what-line)
(global-set-key "\C-xn"     'set-visited-file-name)
(global-set-key "\C-xp"     'other-buffer)
(global-set-key "\C-z"      'next-error)
(global-set-key "\M-?"      'help-command)
(global-set-key "\M-\ "     'set-mark-command)
(global-set-key "\M-\C-h"   'backward-kill-word)
(global-set-key "\M-\C-r"   'query-replace)
(global-set-key "\M-g"      'goto-line)
(global-set-key "\M-o"      'fill-paragraph)
(global-set-key "\M-r"      'replace-string)
(global-set-key "\M-s"      'center-line)
(global-set-key "\M-z"      'save-buffers-kill-emacs)
(global-set-key "\M-\C-f"   'forward-word)
(global-set-key "\M-\C-b"   'backward-word)

(define-key isearch-mode-map "\C-h" 'isearch-delete-char)
(define-key isearch-mode-map "\C-[" 'isearch-exit)

;; I read POP3 email inside emacs until at least 1996
;; handling attachments was labor intensive
(defvar save-mail-dir "~/CORR")
(setq truncate-partial-width-windows nil)
(setq c-indent-level 4)

(put 'eval-expression 'disabled nil)
(put 'upcase-region 'disabled nil)

(defvar sgml-mode-hook '(lambda ()
			  (define-key sgml-mode-map "\C-i" 'tab-to-tab-stop)))

(defvar c++-mode-hook '(lambda ()
       ; (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
			 (font-lock-mode 1)
			 (setq c++-class-member-indent 4)
			 (setq c++-untame-characters nil)
			 (setq c++-hanging-member-init-colon t)
			 (setq c++-relative-offset-p nil)))

(defvar rmail-mode-hook '(lambda ()
			   (define-key rmail-mode-map "\C-o" 'save-incoming-mail)
			   (define-key rmail-mode-map "o" 'save-incoming-mail)))


(defvar comint-mode-hook '(lambda ()
			   (define-key comint-mode-map "\C-a" 'comint-bol)
			   (define-key comint-mode-map "\C-c\C-e" 'compile)
			   (define-key comint-mode-map "\M-?" 'help)))

(defvar shell-mode-hook '(lambda ()
			   (define-key shell-mode-map "\C-a" 'comint-bol)
			   (define-key shell-mode-map "\C-c\C-e" 'compile)
			   (define-key shell-mode-map "\M-?" 'help)
			   ; (add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
			   (setq shell-pushd-regexp "pu")
			   (setq shell-popd-regexp "po")))

(defvar compile-command "sliml ")

(setq auto-mode-alist (append '(("\\.c$" . c++-mode)
				("\\.h$" . c++-mode)
				("\\.cpp$" . c++-mode)
				("\\.hD$" . c++-mode)
				("\\.hT$" . c++-mode)
				("\\.ccT$" . c++-mode)
				("\\.pl$" . perl-mode))
			      auto-mode-alist))

(defvar saved-mail-filename-date-extension-regexp "[0-9][0-9][0-9][0-9][0-9][0-9]")
(defvar saved-mail-filename-serial-extension-regexp "[a-z]")
(defvar saved-mail-filename-info-extension-regexp ".*")
(defvar saved-mail-filename-extension-separator ".")
(defvar saved-mail-filename-name-regexp ".*")
(defun uniq (l)
  (let ((p l))
    (while (not (null p))
      (if (string-equal (car p) (car (cdr p)))
	  (setcdr p (cdr (cdr p)))
	(setq p (cdr p))))
    l))

(defun get-save-mail-filename (dir &optional info)
  (let ((bad-dir t))
    (while bad-dir
      (setq dir (read-file-name "Save message in directory: " dir dir t))
      (if (file-directory-p dir)
	  (setq bad-dir nil)
	(progn (message "`%s' is not a directory" dir)
	       (sleep-for 2))))
    (setq dir (expand-file-name dir)))
  (let ((filename-regexp (concat "^\\(" saved-mail-filename-name-regexp "\\)"
				 (regexp-quote saved-mail-filename-extension-separator)
				 saved-mail-filename-date-extension-regexp
				 saved-mail-filename-serial-extension-regexp
				 saved-mail-filename-info-extension-regexp "$")))
    (let ((filename
	   (let ((name
		  (completing-read
		   "Name to file message under: "
		   (mapcar (lambda (s)
			     (list s 0))
			   (uniq (mapcar (lambda (s)
					   (string-match filename-regexp s)
					   (substring s (match-beginning 1) (match-end 1)))
					 (directory-files dir nil filename-regexp))))
		   nil nil (if (string-match filename-regexp (buffer-name))
			       (substring (buffer-name) (match-beginning 1) (match-end 1)) ""))))
	     (if (string-equal name "") nil
	       (concat name
		       saved-mail-filename-extension-separator
		       (let ((time (timezone-parse-date (current-time-string))))
			 (format "%02d%02d%02d"
				 (string-to-int (substring (elt time 0) -2))
				 (string-to-int (elt time 1))
				 (string-to-int (elt time 2)))))))))
      (if filename (let ((lastfile
			  (let ((thisfile-regexp 
				 (concat "^" (regexp-quote filename)
					 "\\(" saved-mail-filename-serial-extension-regexp "\\)"
					 saved-mail-filename-info-extension-regexp "$")))
			    (let ((l (directory-files dir nil thisfile-regexp)))
			      (if l (let ((n (nth (- (length l) 1) l)))
				      (progn
					(string-match thisfile-regexp n)
					(substring n (match-beginning 1) (match-end 1)))) nil)))))
		     (expand-file-name (concat filename
					       (if lastfile
						   (char-to-string (+ 1 (string-to-char lastfile))) "a")
					       info)
				       dir))
	nil))))

(defun save-incoming-mail ()
  (interactive)
  (let ((filename (get-save-mail-filename save-mail-dir "i")))
    (if filename (rmail-output filename))))

(defun send-outgoing-mail ()
  (interactive)
  (if (or (buffer-modified-p)
	  (y-or-n-p "Mail already sent; resend? "))
      (progn
	(let ((filename (get-save-mail-filename save-mail-dir "o"))
	      (old-point (point)))
	  (goto-char 1)
	  (if (not (search-forward mail-header-separator nil t))
	      (progn
		(goto-char old-point)
		(error "Unable to find beginning of mail message!")))
	  (goto-char old-point)
	  (mail-send)))))

(defun case-fold-toggle (arg)
  "Toggle case-fold-search variable between nil and t."
  ( interactive "p")
  (if case-fold-search
      (setq case-fold-search nil)
    (setq case-fold-search t))
  (message "Case %s in searches."
	   (if (equal case-fold-search nil)
	       "matters" "folds")))

;; Cannot live without upcase single letter
(defun capitalize-letter () "Capitalize the letter under cursor."
  (interactive) (capitalize-region (point) (+ (point) 1)) (forward-char))

(defun scroll-down-one (arg) "scroll window down <ARG> lines; defaults to 1"
  (interactive "p") (scroll-down arg))

(defun scroll-up-one (arg) "scroll window up <ARG> lines; default to 1"
  (interactive "p") (scroll-up arg))

(defvar numerate-counter -1 "*Counter variable used with the numerate function")
(defun numerate (arg) "Insert increasing numbers at current place in buffer."
  (interactive) (insert-string (setq numerate-counter (+ numerate-counter 1))))

(defun get-buffer-of-name (nametest buflist)
  (if buflist (if (funcall nametest (buffer-name (car buflist))) (car buflist)
		(get-buffer-of-name nametest (cdr buflist))) nil))

(defun gud-buffer-name-test (bufname)
  (and (equal (substring bufname 0 1) "*")
       (equal (substring bufname 0 2) "*g")
       (equal (substring bufname 0 3) "*gu")
       (equal (substring bufname 0 4) "*gud")
       (equal (substring bufname 0 5) "*gud-")))
(defun switch-to-gud ()
  "Switch to (one of) the *gud- buffers or start a new gdb process if none exists."
  (interactive)
  (let ((buf (get-buffer-of-name 'gud-buffer-name-test
				 (cdr (buffer-list)))))
    (if buf (switch-to-buffer buf)
      (call-interactively 'gdb))))

(defun next-buffer-name-test (bufname)
  (and (not (equal (substring bufname 0 1) " "))
       (not (equal bufname "*vc*"))
       (not (equal bufname "*ispell*"))
       (not (equal bufname "*ispell choices*"))
       (not (equal bufname (buffer-name (current-buffer))))
       (not (equal bufname "*Completions*"))
       (not (equal bufname "*Compile-Log*"))
       (not (equal bufname "*Help*"))
       (not (equal bufname "*directory*"))
       (not (equal bufname "*Messages*"))
;       (not (equal bufname "*scratch*"))
;       (not (equal bufname "*Buffer List*"))
       (not (equal bufname "TAGS"))))
(defun next-buffer ()
  "Switch to next buffer in buffer list. Buffers whose name begin with a space are ignored."
  (interactive)
  (let ((buf (get-buffer-of-name 'next-buffer-name-test (buffer-list))))
    (if buf (progn (bury-buffer (current-buffer)) (switch-to-buffer buf))
      (princ "No appropriate buffer to switch to!"))))

;; I got paid to work with SGML (1988+) before HTML (1994+) and XML (1996+) were a thing
(defconst sgml-validate-command
  "mmparser -s"
  "*The command to validate an SGML document.
The file name of current buffer file name will be appended to this,
separated by a space.")

(defun sgml-expand-parameter-entities (&optional never-save-file-no-question)
       "Expand parameter entity references.  Offer to save file unless prefix arg."
       (interactive "P")
       (and (not never-save-file-no-question)
            (buffer-modified-p)
            buffer-file-name
            (y-or-n-p (concat "Save buffer in " buffer-file-name "? "))
            (basic-save-buffer))
       (save-excursion (let ( (ps "\\([ \t\n]\\|--\\(-?[^-]\\)*--\\)"))
                       (quick-replace "\\(%[A-Za-z][A-Za-z0-9.-]*\\)\\([^;A-Za-z0-9.-]\\)"
                                      "\\1;\\2" t)
                       (while (re-search-forward (concat "<!ENTITY" ps "+%" ps
                                                         "+\\([A-Za-z][A-Za-z0-9.-]*\\)" ps
                                                         "+\\(\"[^\"]*\"\\|'[^']*'\\)" ps "*>")
                                                 (point-max) t)
                              (let ( (entity (concat "%"
                                                     (buffer-substring (match-beginning 5)
                                                                       (match-end 5)) ";"))
                                     (replacement-string (buffer-substring (1+ (match-beginning 8))
                                                                           (1- (match-end 8)))))
                                   (quick-replace entity replacement-string nil))))))

(defun quick-replace (from-string to-string regexp-flag)
       (let ( (search-function (if regexp-flag 're-search-forward 'search-forward))
              (lastrepl nil))
            (save-excursion (while (and (not (eobp))
                                        (funcall search-function from-string nil t))
                                   (if (eq lastrepl (point)) (forward-char 1)
                                       (replace-match to-string t (not regexp-flag))
                                       (setq lastrepl (point)))))))

(put 'narrow-to-region 'disabled nil)

(put 'downcase-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(rmail-default-rmail-file "/u1/nkipp/CORR/XMAIL")
 '(tab-width 2))

(cd "~/")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
