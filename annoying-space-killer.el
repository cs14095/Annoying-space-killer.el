;;; annoying-space-killer.el --- Simple commmand that kills spaces

;; Copyright (C) 2016 Takuma Matsushita

;; Author: Takuma Matsushita <cs14095@gmail.com>
;; Created: 24 Oct 2016
;; Version: 0.0.1
;; Keywords: convinience
;; Homepage: https://github.com/cs14095/ciel.el
;; Package-Requires: ((emacs "24"))


;; This file is not part of GNU Emacs

;; The MIT License (MIT)

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;; Simple command that kills consecutive spaces, tabs and new line characters.
;; This will helpful when you writing lambda expresssions.
;; Some mode doesn't provide lambda expression and annoying spaces sometimes breed.
;; For example you want to write like this
;; ---------------------------------------
;;   hogehoge
;; ")}"
;; ---------------------------------------
;;  but emacs some modes indent like this
;; ---------------------------------------
;;  hogehoge
;; )
;; }
;; ---------------------------------------
;; or some mode is...
;; ---------------------------------------
;; hogehoge
;; )               }
;; ---------------------------------------
;; PRESS "C-c ask".

;; ## Usage

;; put this file to where you want and add the following
;; (setq load-path (cons "path-to-file" load-path))
;; (require 'annoying-space-killer)
;; (global-set-key "\C-cask" 'ask-kill)

;; ## Example

;; Press "C-c ask" then this kills consecutive spaces.

;;; Code:

;;;###autoload
(defun ask-kill ()
  "kill annoying spaces"
  (interactive)
  (let ((region))
    (setq region (ask--define-region))
    (kill-region (car region) (cadr region))))

(defun ask--define-region ()
  (let ((init (point)) (cur (point)) (beg) (end))
    (while (or (string= " "  (char-to-string (preceding-char)))
	       (string= "\n" (char-to-string (preceding-char)))
	       (string= "\t" (char-to-string (preceding-char))))
      (backward-char)
      (setq cur (point)))
    (setq beg cur) ;; set beg
    (goto-char init) ;; return
    (while (or (string= " "  (char-to-string (preceding-char)))
	       (string= "\n" (char-to-string (preceding-char)))
	       (string= "\t" (char-to-string (preceding-char))))
      (forward-char)
      (setq cur (point)))
    (backward-char)
    (setq cur (point)) ;; adjust pos
    (setq end cur)
    (list beg end)))

(provide 'annoying-space-killer)

;;; annoying-space-killer.el ends here
