;;; packages.el --- mykey Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq mykey-packages
      '(
        key-chord
      ;; package names go here
      ))

;; List of packages to exclude.
(setq mykey-excluded-packages '())

(defun mykey/init-key-chord ()
  (defun enable-key-chord-mode  ()
    (key-chord-mode 1))
  (use-package key-chord
    :defer t
    :init
    (progn
      (key-chord-mode 1)
      (key-chord-define-global "vg"     'eval-region)
      (key-chord-define-global "vb"     'eval-buffer)
      (key-chord-define-global "cy"     'yank-pop)
      (key-chord-define-global "qs"     'query-replace)
                                        ; frame actions
                                        ; (key-chord-define-global "nn"     'other-window);
                                        ; (key-chord-define-global "b1"     'delete-other-windows)
                                        ; (key-chord-define-global "b0"     'delete-window)
      (defun kill-this-buffer-if-not-modified ()
        (interactive)
                                        ; taken from menu-bar.el
        (if (menu-bar-non-minibuffer-window-p)
            (kill-buffer-if-not-modified (current-buffer))
          (abort-recursive-edit)))
      (key-chord-define-global "kb"     'kill-this-buffer-if-not-modified)
                                        ; file actions
      (key-chord-define-global "bf"     'ido-switch-buffer)
      (key-chord-define-global "cf"     'ido-find-file)
      (key-chord-define-global "vc"     'vc-next-action)

      (key-chord-define-global "JJ" 'prelude-switch-to-previous-buffer)
      (key-chord-define-global "uu" 'undo-tree-visualize)
      (key-chord-define-global "xx" 'execute-extended-command)
      (key-chord-define-global "yy" 'browse-kill-ring)
      (key-chord-define-global "qq" 'yas-expand)

    )
  :config
  (progn
    (spacemacs|diminish key-chord-mode " K" " c"))))

;; For each package, define a function mykey/init-<package-name>
;;
;; (defun mykey/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
