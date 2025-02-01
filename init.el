;; auto-load agda-mode for .agda and .lagda.md
(setq auto-mode-alist
   (append
     '(("\\.agda\\'" . agda2-mode)
       ("\\.lagda.md\\'" . agda2-mode))
     auto-mode-alist))

(defun flash-mode-line ()
  (ding)
  (let ((orig-bg (face-background 'mode-line)))
    (set-face-background 'mode-line "#F2804F")
    (run-with-idle-timer 0.1 nil
                         (lambda (bg) (set-face-background 'mode-line bg))
                         orig-bg)))
 (setq visible-bell nil
      ring-bell-function #'flash-mode-line
      )

(global-display-line-numbers-mode 1)


;; coq proof-general
(require 'package)
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; see remark below
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


