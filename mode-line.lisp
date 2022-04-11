; -*- mode: lisp; -*-
;                                   _            ,__ __
;    ()                            (_|   |   |_//|  |  |
;    /\_|_         _  _  _     _     |   |   |   |  |  |
;   /  \|  |   |  / |/ |/ |  |/ \_   |   |   |   |  |  |
;  /(__/|_/ \_/|_/  |  |  |_/|__/     \_/ \_/    |  |  |_/
;                           /|
;                           \|
;    __
;   / ()  _        |\ o  _,
;  |     / \_/|/|  |/ | / |
;   \___/\_/  | |_/|_/|/\/|/
;                  |)    (|
;
;; Copyright © 2018, 2019 Roch D'amour (notarock)

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Mode-line format and modules configuration

;;; Code:

(in-package :stumpwm)
(setf *time-modeline-string* "%a %m-%d ^5*^B%l:%M^b^n")

(setq stumpwm:*mode-line-position* :top)

(setf *mode-line-background-color* (nth 10 *colors*))

(setq *separator-right* " ^7*^B««^b ")
(setq *separator-left* " ^7*^B»»^b ")

(setf stumpwm:*screen-mode-line-format*
      (list
       "^B[^b"                      ; [
       "^1*%n^n"                    ; Current Group
       "^B]^b"                      ; ]
       " ^2*/^n "                   ; ---
       "^7*^B%W^b^n"                ; Focused frame
       *separator-left*             ; ---
       "^>"                         ; middle
       *separator-right*            ; ---
       "^3*^b%C"                    ; cpu
       *separator-right*            ; ---
       "^2*^b%M"                    ; Memory
       *separator-right*            ; ---
       "^6*[^n^B%I^b^6*]^n %l"      ; Wifi
       *separator-right*            ; ---
       '(:eval (string-right-trim '(#\Newline) (run-shell-command
                                                "date +'^B%m-%d ^6*%R^b'" t)))
       *separator-right*            ; ---
       "          "                 ; free space for stumptray
       ))

(dolist (head
         (list (first (screen-heads (current-screen)))))
  (enable-mode-line (current-screen) head
                    t *screen-mode-line-format*))

(stumptray:stumptray)

;; End of file
