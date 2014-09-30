;;; ____________________________________________________________________________
(server-start)

;;; ____________________________________________________________________________
(tool-bar-mode -1)
(setq ns-command-modifier (quote meta))
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq transient-mark-mode nil)
(setq default-truncate-lines t)

;;; ____________________________________________________________________________
(setq-default fill-column 80)
(setq sentence-end-double-space nil)

;;; ____________________________________________________________________________
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;;; ____________________________________________________________________________
(setq auto-save-default nil)
;;; ____________________________________________________________________________
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;;; ____________________________________________________________________________
(set-language-environment "Japanese")

;;; ____________________________________________________________________________
(set-default-coding-systems 'euc-jp)
(set-buffer-file-coding-system 'euc-jp-unix)
(set-terminal-coding-system 'euc-jp)
(set-keyboard-coding-system 'euc-jp)

;;; ____________________________________________________________________________
(setq dabbrev-case-fold-search nil)

;;; ____________________________________________________________________________
(setq exec-path
      (append '("/opt/local/bin"
		"/usr/texbin"
		"/Library/Frameworks/Python.framework/Versions/Current/bin")
	      exec-path)
      )

(setq load-path
      (append '("/Users/sakuma/.emacs.d/site-lisp")
	      load-path )
      )

(setq Info-additional-directory-list
      (list "~/.emacs.d/info"
            "/opt/local/share/info"
	    "/usr/share/info"
	    ))

;;; dired
;;; ____________________________________________________________________________
(put 'dired-find-alternate-file 'disabled nil)

;;; ____________________________________________________________________________
(setq default-frame-alist
      (append
       (list
	'(top . 20) '(left . 0)
	'(width . 200) '(height . 60)
	'(alpha . (90 88)) ; transparency
	'(foreground-color . "gray90")
	'(background-color . "gray20")
	'(cursor-color . "Green")
	) default-frame-alist)
      )

(create-fontset-from-ascii-font "Menlo-12:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo"
                  'unicode
                  (font-spec :family "Hiragino Kaku Gothic ProN" :size 12)
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))

(split-window-horizontally)

(set-frame-parameter (selected-frame) 'alpha  '(100 100))
;;; (set-frame-parameter (selected-frame) 'background-color  "gray20")
;;; (set-frame-parameter (selected-frame) 'background-color  "MidnightBlue")
;;; (set-frame-parameter (selected-frame) 'background-color  "DarkOliveGreen")

(setq frame-alpha 100)
(defun decrease-frame-alpha ()
  (interactive)
  (if (> frame-alpha 9) (setq frame-alpha (- frame-alpha 10)))
  (set-frame-parameter (selected-frame) 'alpha frame-alpha)
  )
(defun increase-frame-alpha ()
  (interactive)
  (if (< frame-alpha 91) (setq frame-alpha (+ frame-alpha 10)))
  (set-frame-parameter (selected-frame) 'alpha frame-alpha)
  )
(global-set-key  "\M-1" 'increase-frame-alpha)
(global-set-key  "\M-2" 'decrease-frame-alpha)

;;;
;;; ____________________________________________________________________________
'(mouse-wheel-progressive-speed nil) 
'(mouse-wheel-scroll-amount (quote (2 ((shift) . 1) ((control)))))

;;; ____________________________________________________________________________

(setq kill-whole-line t)

(global-set-key "\M-@" 'ispell-word)
(load-library "ls-lisp")
(setq ls-lisp-dirs-first t)

(setq dired-copy-preserve-time t)


;;; php-mode
;;; ____________________________________________________________________________
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;;; org-mode
;;; ____________________________________________________________________________
; (setq load-path (append '("/Users/sakuma/.emacs.d/site-lisp/org") load-path))
(require 'org-install)
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook
 (lambda ()
 (define-key org-mode-map (kbd "M-p") 'org-metaup)
 (define-key org-mode-map (kbd "M-n") 'org-metadown)
 (define-key org-mode-map (kbd "M-f") 'org-metaright)
 (define-key org-mode-map (kbd "M-b") 'org-metaleft)
 )
)

;;; term
;;; ____________________________________________________________________________
(require 'term)
(global-set-key "\C-x\C-v" '(lambda ()(interactive)(ansi-term "/bin/bash")))
(when window-system
  (setq
   term-default-fg-color "gray90"
   term-default-bg-color "transparent"
   ansi-term-color-vector
        [unspecified "black" "#ff5555" "#55ff55" "#ffff55" "#5555ff"
         "#ff55ff" "#55ffff" "white"]))

(defvar ansi-term-after-hook nil)
(add-hook 'ansi-term-after-hook
        (function
          (lambda ()
             (define-key term-raw-map "\C-x\C-v" '(lambda ()(interactive)(ansi-term "/bin/bash")))
             (define-key term-raw-map "\C-c\C-c" 'my-term-line-char-switch))))

(defadvice ansi-term (after ansi-term-after-advice (arg))
  "run hook as after advice"
  (run-hooks 'ansi-term-after-hook))
(ad-activate 'ansi-term)

(defun my-term-line-char-switch()
  (interactive)
  (if (term-in-line-mode) (term-char-mode)
    (if (term-in-char-mode) (term-line-mode))))

(add-hook 'term-mode-hook
        (function
          (lambda ()
                (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
                (make-local-variable 'mouse-yank-at-point)
                (make-local-variable 'transient-mark-mode)
                (setq mouse-yank-at-point t)
                (setq transient-mark-mode t)
                (auto-fill-mode -1)
        (setq tab-width 4)
                (define-key term-mode-map "\C-i" 'term-dynamic-complete)
                (define-key term-mode-map "\C-m" 'term-send-input))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; moccur-edit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'moccur-edit)
(defadvice moccur-edit-change-file
  (after save-after-moccur-edit-buffer activate)
  (save-buffer))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (add-to-list 'load-path "/opt/local/share/doc/git-core/contrib/emacs")
; (require 'git)
; (require 'git-blame)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (require 'yasnippet-bundle)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pymacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (autoload 'pymacs-apply "pymacs")
; (autoload 'pymacs-call "pymacs")
; (autoload 'pymacs-eval "pymacs" nil t)
; (autoload 'pymacs-exec "pymacs" nil t)
; (autoload 'pymacs-load "pymacs" nil t)
; ;;(eval-after-load "pymacs"
; ;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
; 
; (require 'pymacs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ropemacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (pymacs-load "ropemacs" "rope-")
; (setq ropemacs-enable-autoimport 't)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tramp http://savannah.gnu.org/projects/tramp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq load-path (append '("/Users/sakuma/.emacs.d/site-lisp/tramp") load-path))
(require 'tramp)
(setq tramp-default-method "ssh")
;(setq tramp-default-method "scp")
(setq tramp-verbose 10)
(setq tramp-debug-buffer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ESS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ess-site)
(setenv "DISPLAY" ":0.0")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YaTeX 1.76
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq load-path (cons (expand-file-name "/Users/sakuma/.emacs.d/site-lisp/yatex") load-path))

;; (setq YaTeX-japan nil)
;; 
;; (add-hook 'yatex-mode-hook '(lambda () (reftex-mode t)))
;; 
;; ;; YaTeX-mode
;; (setq dvi2-command "/sw/bin/xdvi"
;;       tex-command "/usr/texbin/pdflatex"
;;       bibtex-command "/usr/texbin/bibtex"
;;       dviprint-command-format "dvips %s | lpr"
;;       YaTeX-kanji-code 3)
;; 

;;; ____________________________________________________________________________
(defun previous-buffer () 
  "Select previous window." 
  (interactive) 
  (bury-buffer)) 

(defun backward-buffer () 
  "Select backward window." 
  (interactive) 
  (switch-to-buffer 
   (car (reverse (buffer-list))))) 

; (global-set-key [C-tab] 'other-window)
; (global-set-key [M-return] 'previous-buffer)
; (global-set-key [C-return] 'backward-buffer)
(global-set-key [S-tab] 'other-window)
(global-set-key "\M-]" 'previous-buffer)
(global-set-key "\M-[" 'backward-buffer)

;;; ____________________________________________________________________________
;;; "open" from dired
(add-hook 'dired-mode-hook
  	  '(lambda ()
	     (define-key dired-mode-map "0" 'dired-open-mac)))

(defun dired-open-mac ()
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-exists-p file-name)
	(call-process "/usr/bin/open" nil 0 nil file-name))))

;;; ____________________________________________________________________________
(cd "~")
