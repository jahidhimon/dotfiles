;;; movement.el ---  Provides some beautiful movement inside emacs

;; Copyright <2022> <Jahid Hasan Imon>
;; 
;; Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
;; to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
;; and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
;; 
;; The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
;; 
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
;; WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


;;; Commentary:

;;; This is a collection of scripts for my own needs.
;;; I hope anyone who collects it be somewhat helped having the most fun using Emacs.
;;;
;;; I developed them using Emacs 28.2 and haven't test on the older Emacs version.
;;; If this script breaks, YOU HAVE BEEN WARNED....
;;;
;;; This script will bind some keybindings such as:
;;; 1. <C-o>     <Vim normal mode o>
;;; 2. <C-S-o>   <Vim normal mode O>
;;;
;;; If you find any bug please let me know.


;;; Code:

(defun mm-vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun mm-vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun mm-set-keybindings ()
	"Set all the keybindings for the movement.el package."
	(interactive)
	(define-key global-map (kbd "C-o")   'mm-vi-open-line-below)
	(define-key global-map (kbd "C-S-o") 'mm-vi-open-line-above)
	"Movement.el keybindings has been set")

(provide 'movement)
;;; movement.el ends here
