;;; packages.el --- myspell Layer packages File for Spacemacs
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
(setq myspell-packages
      '(
        flyspell
        ;; package names go here
        ))

;; List of packages to exclude.
(setq myspell-excluded-packages '())

(defun spacemacs/init-flyspell ()
  (defun enable-flyspell-mode ()
    (flyspell-mode 1))
  (use-package flyspell
    :defer t
    :init
    (progn
      (setq-default ispell-program-name "aspell")
      (setq-default ispell-dictionary "english")
      (add-hook 'markdown-mode-hook 'enable-flyspell-mode)
      (add-hook 'text-mode-hook 'enable-flyspell-mode)
      (spacemacs|add-toggle spelling-checking
        :status flyspell-mode
        :on (flyspell-mode)
        :off (flyspell-mode -1)
        :documentation
        "Enable flyspell for automatic spelling checking."
        :evil-leader "ts")

      (eval-after-load "ispell"
        '(add-to-list 'ispell-dictionary-alist
                      '("deutsch8"
                        "[a-zA-ZäöüßÄÖÜ]" "[^a-zA-ZäöüßÄÖÜ]" "[']" t
                        ("-C" "-d" "de_DE-neu.multi")
                        "~latin1" iso-8859-1)))

      ;; switch from german to english for the dictionary
      (defun fd-switch-dictionary()
        (interactive)
        (let* ((dic ispell-current-dictionary)
               (change (if (string= dic "deutsch8") "english" "deutsch8")))
          (ispell-change-dictionary change)
          (message "Dictionary switched from %s to %s" dic change)
          ))
      (global-set-key (kbd "<f8>")   'fd-switch-dictionary)

    )   
    :config
    (progn
      (flyspell-prog-mode)
      (spacemacs|diminish flyspell-mode " ⓢ" " s"))))

;; For each package, define a function myspell/init-<package-name>
;;
;; (defun myspell/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

