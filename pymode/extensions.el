;;; extensions.el --- pymode Layer extensions File for Spacemacs
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

(setq pymode-pre-extensions
      '(
        ;; pre extension names go here
        ))

(setq pymode-post-extensions
      '(
        ;; post extension names go here
        ))


                                        ; enable ipython in the classic mode
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args " --classic"
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(autoload 'jedi:setup "jedi" nil t)
                                        ; (setq jedi:setup-keys t)
(add-hook 'python-mode-hook
          (lambda()
            (auto-complete-mode 1)
            (jedi:setup)
            (company-backends 'company-jedi)
            (python-cell-mode 1)
            (linum-mode 1)))
;; For each extension, define a function pymode/init-<extension-name>
;;
;; (defun pymode/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
