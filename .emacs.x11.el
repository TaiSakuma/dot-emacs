;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FSF Emacs 20/21 $BMQ(B $B%f!<%6@_Dj%U%!%$%k$N%5%s%W%k(B
;;            MATSUBAYASHI 'Shaolin' Kohji (shaolin@vinelinux.org)
;;                      modified by Jun Nishii <jun@vinelinux.org>
;;                      modified by Daisuke SUZUKI <daisuke@vinelinux.org>
;;            $Id: .emacs.el,v 1.36 2004/10/27 12:54:46 daisuke Exp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  $B%7%9%F%`$N%"%C%W%0%l!<%I;~$K$3$N%U%!%$%k$r<+F0E*$K99?7$7$?$$>l9g$O(B
;;  $B$3$N%U%!%$%k$rJQ99$;$:$K(B .emacs.my.el $B$K5-=R$7$F$/$@$5$$!#(B


;;; $B=i4|@_Dj%U%!%$%k$N;XDj(B

(setq user-init-file "~/.emacs.x11.el")

;;; $B%^%/%m%5!<%A%Q%9$NDI2C(B
;;; ~/lib/emacs $B0J2<$K%f!<%6MQ$N(B *.el, *.elc $B$rCV$/$3$H$,$G$-$^$9(B
(setq load-path (append '("~/lib/emacs") load-path))

;;; $B8@8l4D6-$N;XDj(B

(set-language-environment "Japanese")

;;; $B4A;z%3!<%I$N@_Dj(B

(set-default-coding-systems 'euc-jp)
(set-buffer-file-coding-system 'euc-jp-unix)
(set-terminal-coding-system 'euc-jp)
(set-keyboard-coding-system 'euc-jp)

;;; emacsclient $B%5!<%P$r5/F0(B
(server-start)

;; $B4D6-JQ?t(B EMACS_IME $B$rD4$Y$k!#(B
;; EMACS_IME $B$,$J$1$l$P(B canna $B$r;HMQ$9$k(B

(setq emacs-ime (getenv "EMACS_IME"))
(if (null emacs-ime)
    (setq emacs-ime "canna"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X $BHG(B Emacs $B$N%U%)%s%H(B/$B%+%i!<@_Dj(B
;; .emacs-faces.el, .emacs-fontset.el $B;2>H(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs-faces.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs-21 $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cond
 ((>= emacs-major-version 21)
 
 ;;; $B%a%K%e!<%P!<$r>C$9(B
 ;(menu-bar-mode nil)
 ;;; $B%D!<%k%P!<$r>C$9(B
(tool-bar-mode nil)
 ;;; cursor $B$N(B blink $B$r;_$a$k(B
 ;(blink-cursor-mode nil) 
 ;;; $BI=<($N9T4V$r3H$2$k(B
 ;(set-default 'line-spacing 2)
 ;;; active $B$G$J$$(B window $B$N6u(B cursor $B$r=P$5$J$$(B
 (setq cursor-in-non-selected-windows nil)
 ;;; $B%U%)%s%H$N%9%1!<%k$r$7$J$$(B
 (setq scalable-fonts-allowed nil)
 ;;; [Home] Key $B$H(B [End] Key $B$r=>Mh$NF0:n$KLa$9(B
 (define-key global-map [home] 'beginning-of-buffer)
 (define-key global-map [end] 'end-of-buffer)

 ;;; image.el $B$K$*$1$k(B JPEG $B$NH=Dj4p=`$r4K$a$k(B
 (eval-after-load "image"
  '(setq image-type-regexps
    (cons (cons "^\377\330" 'jpeg) image-type-regexps)))

 ;;; $BI=<($N9T4V$r3H$2$k(B
 (setq line-spacing 2)

 ;;; $BF|K\8l%a%K%e!<%P!<(B
 ;(if (equal (substring (concat (getenv "LANG") "__") 0 2) "ja")
 ;    (load "menu-tree"))
))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Anthy $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(if (or (equal emacs-ime "anthy")
;        (equal emacs-ime "Anthy"))
;    (progn
;      (require 'anthy)
;      ;; $BJQ493+;O%-!<(B
;      (define-key global-map "\C-\\" 'anthy-mode)
;      (define-key global-map "\C-o" 'anthy-mode)
;      (define-key global-map [kanji] 'anthy-mode)
;      (define-key global-map [M-kanji] 'anthy-mode)
;    )
;)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SKK-9.6m 
;;   Mule $B>e$N2>L>4A;zJQ49%7%9%F%`(B SKK $B$N@_Dj(B
;;   C-x t $B$G%A%e!<%H%j%"%k$,5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;; $B;HMQ$9$k<-=q$N@_Dj(B ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SKK-JISYO.L $B$r%a%b%j>e$KFI$_9~$s$GMxMQ$9$k>l9g(B
;(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")

;;; SKK-JISYO.M $B$r%a%b%j>e$KFI$_9~$_!"(B
;;; $B8+IU$+$i$J$$>l9g$O(B skkserv $B$r5/F0$7$F(B SKK-JISYO.L $B$+$i8!:w$9$k>l9g(B
;;; (skkexdic $B%Q%C%1!<%8$,I,MW$G$9(B)
;;(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.M")
;;(setq skk-aux-large-jisyo "/usr/share/skk/SKK-JISYO.L")
;;(setq skk-server-portnum 1178)
;;(setq skk-server-host "localhost")
;;(setq skk-server-prog "/usr/libexec/skkserv")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
(autoload 'skk-mode "skk" nil t)
(autoload 'skk-auto-fill-mode "skk" nil t)
(autoload 'skk-tutorial "skk-tut" nil t)
(autoload 'skk-isearch-mode-setup "skk-isearch" nil t)
(autoload 'skk-isearch-mode-cleanup "skk-isearch" nil t)
(add-hook 'isearch-mode-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-setup) ))))
(add-hook 'isearch-mode-end-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-cleanup)
			   (skk-set-cursor-color-properly) ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; T-Gnus 6.13.3 ($B;29M(B)
;;   NetNews $B%j!<%@!<(B GNUS (SEMI $BBP1~HG(B)
;;   M-x gnus $B$G5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; News Server $BL>$d%I%a%$%sL>$rE,@Z$K;XDj$7$F$/$@$5$$(B
;(setq gnus-nntp-server "news.hoge.hoge.or.jp")
;(setq gnus-local-domain "hoge.hoge.or.jp")
;(setq gnus-local-organization "HogeHoGe Org.")
;(setq gnus-use-generic-from t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mew 3.3  -  Messaging in the Emacs World
;;   $B%a!<%k%j!<%@!<(B Mew
;;   M-x mew $B$G5/F0$7$^$9(B
;;
;;   $B8D?MMQ$N@_Dj%U%!%$%k$O(B ~/.mew.el $B$rMxMQ$7$F$/$@$5$$!#(B
;;   $B:G?7$N(B .mew.el $B$O(B /usr/share/doc/mew-common-*/vine.dot.mew $B$K$"$j$^$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(if (file-exists-p (expand-file-name "~/.mew.el"))
    (load (expand-file-name "~/.mew.el") nil t nil))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YaTeX 1.72
;;   [La]TeX $BF~NO%b!<%I(B
;;   M-x yatex $B$H$9$k$+!"(B.tex $B$G=*$o$k%U%!%$%k$rFI$_9~$`$H5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; YaTeX-mode
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(setq dvi2-command "xdvi"
      tex-command "latex"
      dviprint-command-format "dvips %s | lpr"
      YaTeX-kanji-code 3)

;; YaHtml-mode
(setq auto-mode-alist
      (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
(setq yahtml-www-browser "mozilla")

;; TeX source special $B$N$?$a$N@_Dj(B
(if (load "xdvi-search" t) ; $BI,?\(B
    (progn
      (custom-set-variables
       '(server-switch-hook (quote (raise-frame)))) ; $BAk$r>e$K(B
      (custom-set-faces)
      (add-hook 'yatex-mode-hook
                '(lambda ()
                   (define-key YaTeX-mode-map "\C-c\C-j" 'xdvi-jump-to-line)))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dic (eldic.el)
;;   Mule $B>e$G(B dic $B$rMxMQ$9$k$?$a$N@_Dj$G$9(B
;;   ~/lib/emacs $B$K(B /usr/doc/dic/eldic.el $B$r%3%T!<$7$F(B
;;   dic-shell-file-name $B$NJU$j$rE,@Z$K@_Dj$7$F$/$@$5$$!#(B
;;   C-c C-c C-e $B$G1QOB!"(BC-c C-c C-j $B$GOB1Q$,0z$1$^$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(global-set-key "\C-c\C-c\C-e" 'lookup-edic)
;;(global-set-key "\C-c\C-c\C-j" 'lookup-jdic)
;;(autoload 'lookup-edic "eldic" nil t)
;;(autoload 'lookup-jdic "eldic" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B%[%$!<%k%^%&%9BP1~(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
                     
(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Liece
;;  IRC $B%/%i%$%"%s%H$G$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(autoload 'liece "liece" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rpm-mode
;;  RPM $B$N(B spec $B%U%!%$%k:n@.MQ%b!<%I(B
;;  ~/lib/emacs $B$K(B /usr/doc/rpm/rpm-mode.el $B$r%3%T!<$7$F0J2<$N@_Dj$r(B
;;  $B9T$C$F$/$@$5$$(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq auto-mode-alist (nconc '(("\\.spec" . rpm-mode)) auto-mode-alist))
;(autoload 'rpm-mode "rpm-mode" "Major mode for editing SPEC file of RPM." t) 
;(setq packager "Vine User <vine@hoge.fuga>");$B<+J,$NL>A0(B
;      (setq buildrootroot "/var/tmp");BuildRoot$B$N>l=j(B
;      (setq projectoname "Project Vine");$B%W%m%8%'%/%HL>(B 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B$=$NB>$N@_Dj(B
;;
;; $B$3$l$i$N@_Dj$rJQ99$9$k>l9g$O!"(B~/.emacs.my.el $B$K=q$/$3$H(B
;; $B$r$*A&$a$7$^$9!#(Betcskel $B%Q%C%1!<%8$N%"%C%W%G!<%H;~$K(B 
;; /etc/skel/.emacs.el $B$r$=$N$^$^>e=q$-$G$-$^$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; C-h $B$H(B Del $B$NF~$lBX$((B
;;; Help $B$,(B Shift + Ctrl + h $B$*$h$S(B Del $B$K3dEv$F$i$l!"(B
;;; $BA00lJ8;z:o=|$,(B Ctrl + h $B$K3dEv$F$i$l$^$9(B
;(load-library "term/keyswap")
;(if (eq window-system 'x)
;    (progn
;      (define-key function-key-map [delete] [8])
;      (put 'delete 'ascii-character 8)))

;;; Ctrl-H $B$rA0(B1$BJ8;z:o=|$KJQ99(B
;(define-key global-map "" 'backward-delete-char)

;;; $B%9%/%m!<%k%P!<$r1&B&$KI=<($9$k(B
(set-scroll-bar-mode 'right)

;;; gz$B%U%!%$%k$bJT=8$G$-$k$h$&$K(B
(auto-compression-mode t)

;;; $B0l9T$,(B 80 $B;z0J>e$K$J$C$?;~$K$O<+F02~9T$9$k(B
(setq fill-column 80)
;(setq text-mode-hook 'turn-on-auto-fill)
(setq default-major-mode 'text-mode)

;;; $B%9%F!<%?%9%i%$%s$K;~4V$rI=<($9$k(B
(if (>= emacs-major-version 20)
    (progn
      (setq dayname-j-alist
           '(("Sun" . "$BF|(B") ("Mon" . "$B7n(B") ("Tue" . "$B2P(B") ("Wed" . "$B?e(B")
             ("Thu" . "$BLZ(B") ("Fri" . "$B6b(B") ("Sat" . "$BEZ(B")))
      (setq display-time-string-forms
           '((format "%s$BG/(B%s$B7n(B%s$BF|(B(%s) %s:%s %s"
                     year month day
                     (cdr (assoc dayname dayname-j-alist))
                     24-hours minutes
		     load)))
      ))
(display-time)

;;; visible-bell
(setq visible-bell t)

;;; $B9THV9f$rI=<($9$k(B
(line-number-mode t)

;;; mule/emacs -nw $B$G5/F0$7$?;~$K%a%K%e!<%P!<$r>C$9(B
;(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;;; $B0u:~@_Dj(B
;(setq-default lpr-switches '("-Pepson"))
(setq-default lpr-switches '("-2P"))
(setq-default lpr-command "mpage")

;;; ps-print
(setq ps-multibyte-buffer 'non-latin-printer)
(if (>= emacs-major-version 21)
    (progn
      (require 'ps-mule)
      (defalias 'ps-mule-header-string-charsets 'ignore)))

;;; $B%P%C%U%!$N:G8e$G(Bnewline$B$G?75,9T$rDI2C$9$k$N$r6X;_$9$k(B
(setq next-line-add-newlines nil)

;;; $B2hLL:G2<9T$G(B[$B"-(B]$B$r2!$7$?$H$-$N%9%/%m!<%k?t(B
;(setq scroll-step 1)
 
;;; mark $BNN0h$K?'IU$1(B
;(setq transient-mark-mode t)

;;; $B:G=*99?7F|$N<+F0A^F~(B
;;;   $B%U%!%$%k$N@hF,$+$i(B 8 $B9T0JFb$K(B Time-stamp: <> $B$^$?$O(B
;;;   Time-stamp: " " $B$H=q$$$F$"$l$P!"%;!<%V;~$K<+F0E*$KF|IU$,A^F~$5$l$^$9(B
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B%f!<%6MQ=i4|2=%U%!%$%k(B
;; ~/.emacs.my.el $B$K8D?MMQ@_Dj$r=q$1$^$9!#(B
;; $B$3$N%U%!%$%k$rD>@\$$$8$j$?$/$J$$>l9g$O!"8D?M@_Dj$rJ,N%$7$F$/$@$5$$(B

(if (file-exists-p (expand-file-name "~/.emacs.my.el"))
    (load (expand-file-name "~/.emacs.my.el") nil t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B$3$N%U%!%$%k$K4V0c$$$,$"$C$?>l9g$KA4$F$rL58z$K$7$^$9(B
(put 'eval-expression 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local Variables:
;; mode: emacs-lisp
;; buffer-file-coding-system: junet-unix
;; End:
