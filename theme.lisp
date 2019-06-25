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
;; Base16-summerfruit
(setf *colors* (list "#101010"      ; 0 black
                     "#960050"      ; 1 Red
                     "#66aa11"      ; 2 Green
                     "#c47f2c"      ; 3 Yellow
                     "#30309b"      ; 4 Blue
                     "#7e40a5"      ; 5 Magenta
                     "#3579a8"      ; 6 Cyan
                     "#9999aa"      ; 7 White
                     "#505050"      ; 8 Gray
                     "#ffba68"      ; 9 orange
                     "#101010"))    ; 10 bg

(set-fg-color         (nth 7 *colors*))
(set-bg-color         (nth 10 *colors*))
(set-border-color     (nth 2 *colors*))
(set-focus-color      (nth 1 *colors* ))
(set-unfocus-color    (nth 4 *colors* ))
(set-float-focus-color      (nth 1 *colors* ))
(set-float-unfocus-color    (nth 4 *colors* ))

;; (setf *grab-pointer-foreground* (nth 7 *colors*))
;; (setf *grab-pointer-background* (nth 7 *colors*))
(setf *grab-pointer-character*         71 )
(setf *grab-pointer-character-mask*    71 )


(update-color-map (current-screen))

(defcommand set-font-size (size) ()
  "Set the font size of mode-line and stumwpm"
  (set-font (make-instance 'xft:font :family "DejaVu Sans Mono" :subfamily "Book" :size size)))

(set-font-size 12)

;; End of file
