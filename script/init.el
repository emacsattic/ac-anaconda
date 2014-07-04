;;; init.el --- minimal ac-anaconda configuration

;;; Commentary:

;;; Code:

(require 'cask)

(let ((source-directory (locate-dominating-file load-file-name "Cask")))
  (cask-initialize source-directory)
  (add-to-list 'load-path source-directory))

;; Anaconda settings.

(setq anaconda-mode-debug t)

;; Auto complete settings.

(require 'ac-anaconda)

(add-hook 'python-mode-hook 'ac-anaconda-setup)

;; Pyenv settings.

(pyenv-mode)

(provide 'init)

;;; init.el ends here
