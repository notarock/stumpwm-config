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

;;; All eye-candy belongs here

;;; Code:

(in-package :stumpwm)

;; Current Color Scheme :
;; Gruvbox-dark
(setf *colors* (list "#1d2021"      ; 0 black
                     "#d72638"      ; 1 Red
                     "#88b92d"      ; 2 Green
                     "#f19d1a"      ; 3 Yellow
                     "#1ba595"      ; 4 Blue
                     "#be4264"      ; 5 Magenta
                     "#1e8bac"      ; 6 Cyan
                     "#e5e5e5"      ; 7 White
                     "#383c3e"      ; 8 Gray
                     "#c85e0d"      ; 9 orange
                     "#1d2021"))    ; 10 bg

(set-fg-color        (nth 7 *colors*))
(set-bg-color        (nth 10 *colors*))
(set-border-color    (nth 3 *colors*))
(set-focus-color     (nth 3 *colors* ))
(set-unfocus-color    (nth 0 *colors* ))
(set-float-focus-color      (nth 3 *colors* ))
(set-float-unfocus-color    (nth 0 *colors* ))

;; (setf *grab-pointer-foreground* (nth 7 *colors*))
;; (setf *grab-pointer-background* (nth 7 *colors*))
(setf *grab-pointer-character*         71 )
(setf *grab-pointer-character-mask*    71 )

(update-color-map (current-screen))

;; (defcommand set-font-size (size) ()
  ;; "Set the font size of mode-line and stumwpm"
  ;; (set-font (make-instance 'xft:font :family "DejaVu Sans Mono" :subfamily "Book" :size size)))

;; (set-font-size 12)

;; Head gaps run along the 4 borders of the monitor(s)
(setf swm-gaps:*head-gaps-size* 0)
;; Inner gaps run along all the 4 borders of a window
(setf swm-gaps:*inner-gaps-size* 10)
;; Outer gaps add more padding to the outermost borders of a window (touching the screen border)
(setf swm-gaps:*outer-gaps-size* 0)

(stumpwm::single-frame-p)

;; This function is undefined when using quicklisp's stumpwm package, causing crashes when executing toggle-gaps
;; It was copied from the stumpwm's master branch as a simple fix
;; source: https://github.com/stumpwm/stumpwm/blob/master/tile-window.lisp#L218
(defun only-tile-windows (windows)
  (remove-if-not (lambda (w) (typep w 'tile-window))
                 windows))

(swm-gaps:toggle-gaps)

;; End of file
