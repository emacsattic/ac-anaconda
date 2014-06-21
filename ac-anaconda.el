;;; ac-anaconda.el --- Anaconda sources for auto-complete-mode

;; Copyright (C) 2014 by Malyshev Artem

;; Authors: Malyshev Artem <proofit404@gmail.com>
;; URL: https://github.com/anaconda-mode/ac-anaconda
;; Version: 0.1.0
;; Package-Requires: ((auto-complete "1.4.0") (anaconda-mode "0.1.0"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'auto-complete)
(require 'anaconda-mode)

(defun ac-anaconda-available ()
  "Return t if `anaconda-mode' completions are available."
  (and (eq major-mode 'python-mode)
       (anaconda-mode-running-p)))

(defun ac-anaconda-candidates ()
  "Obtain candidates list from anaconda."
  (--map (propertize (plist-get it :name) 'item it)
         (anaconda-mode-complete)))

(defun ac-anaconda-get-property (property candidate)
  "Return the property PROPERTY of completion candidate CANDIDATE."
  (let ((item (get-text-property 0 'item candidate)))
    (plist-get item property)))

(defun ac-anaconda-doc (candidate)
  "Return documentation buffer for chosen CANDIDATE."
  (ac-anaconda-get-property :doc candidate))

;;;###autoload
(defun ac-anaconda-setup ()
  "Set up `ac-sources' for `anaconda-mode'."
  (push 'ac-source-anaconda ac-sources))

;;;###autoload
(defconst ac-source-anaconda
  '((available . ac-anaconda-available)
    (candidates . ac-anaconda-candidates)
    (document . ac-anaconda-doc)
    (symbol . "a"))
  "`auto-complete' completion source for `anaconda-mode'.")

(provide 'ac-anaconda)

;;; ac-anaconda.el ends here
