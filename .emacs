;; .emacs

(if (string-match "XEmacs" emacs-version)
    (if (string-match "21.1" emacs-version)
        (load (expand-file-name "~/.xemacs.el") nil t nil)
      (load (expand-file-name "~/.xemacs/init.el") nil t nil))
  (if (featurep 'carbon-emacs-package)
        (load (expand-file-name "~/.emacs.carbon.el") nil t nil)
    (load (expand-file-name "~/.emacs.mac.el") nil t nil))
)


