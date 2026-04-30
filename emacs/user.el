;; Configure Flymake for verbose diagnostics
(use-package flymake
  :ensure t
  :pin gnu
  :config
  (setq flymake-diagnostic-format-alist
        '((t . (origin code message)))))

;; Load opam config file
(let ((opam-config-file (expand-file-name "opam-emacs.el" user-emacs-directory)))
  (when (file-exists-p opam-config-file)
    (load-file opam-config-file)))

;; neocaml
;; https://github.com/bbatsov/neocaml
(use-package neocaml
  :ensure t
  :config
  (neocaml-install-grammars))

;; Ocaml-eglot provides some ootb features
;; https://github.com/tarides/ocaml-eglot/blob/main/README.md
(use-package ocaml-eglot
  :ensure t
  :after neocaml
  :hook
  (neocaml-mode . ocaml-eglot-mode)
  (ocaml-eglot-mode . eglot-ensure)
  (ocaml-eglot-mode . (lambda () (add-hook #'before-save-hook #'eglot-format nil t)))
  :config
  (setq ocaml-eglot-syntax-checker 'flymake))

;; Additional modes configuration
(use-package opam-switch-mode
  :ensure t
  :hook
  (neocaml-base-mode . opam-switch-mode))

  :config
  (setq ocaml-eglot-syntax-checker 'flymake)

(use-package dune
  :ensure t)

;; Dafny
(use-package boogie-friends
  :ensure t)
(setq flycheck-dafny-executable "/usr/bin/dafny")
