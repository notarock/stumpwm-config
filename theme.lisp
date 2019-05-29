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
(setf *colors* (list "#202020"      ; 0 black
                     "#ff0086"      ; 1 Red
                     "#00c918"      ; 2 Green
                     "#aba800"      ; 3 Yellow
                     "#3777e6"      ; 4 Blue
                     "#ad00a1"      ; 5 Magenta
                     "#1faaaa"      ; 6 Cyan
                     "#ffffff"      ; 7 White
                     "#505050"      ; 8 Gray
                     "#fd8900"      ; 9 orange
                     "#151515"))    ; 10 bg

(set-fg-color         (nth 7 *colors*))
(set-bg-color         (nth 10 *colors*))
(set-border-color     (nth 2 *colors*))
(set-focus-color      (nth 6 *colors* ))
(set-unfocus-color    (nth 10 *colors* ))
(set-float-focus-color      (nth 6 *colors* ))
(set-float-unfocus-color    (nth 10 *colors* ))

;; (setf *grab-pointer-foreground* (nth 7 *colors*))
;; (setf *grab-pointer-background* (nth 7 *colors*))
(setf *grab-pointer-character*         71 )
(setf *grab-pointer-character-mask*    71 )


(update-color-map (current-screen))

;; Font configuration
(set-font (make-instance 'xft:font :family "DejaVu Sans Mono" :subfamily "Book" :size 12))

;; End of file
