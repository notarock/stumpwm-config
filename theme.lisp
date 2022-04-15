; -*- mode: lisp; -*-
;                                   _            ,__ __
;    ()                            (_|   |   |_//|  |  |
;    /\_|_         _  _  _     _     |   |   |   |  |  |
;   /  \|  |   |  / |/ |/ |  |/ \_   |   |   |   |  |  |
;  /(__/|_/ \_/|_/  |  |  |_/|__/     \_/ \_/    |  |  |_/
;                           /|
;                           \|
;    __
;   / ()  _        |\ O  _,
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
                     "#fb543f"      ; 1 Red
                     "#95c085"      ; 2 Green
                     "#fac03b"      ; 3 Yellow
                     "#0d6678"      ; 4 Blue
                     "#8ba59b"      ; 5 Cyan
                     "#8f4673"      ; 6 Magenta
                     "#a89984"      ; 7 White
                     "#665c54"      ; 8 Gray
                     "#fe8625"      ; 9 orange
                     "#32302f"))    ; 10 bg

(set-fg-color        (nth 7 *colors*))
(set-bg-color        (nth 0 *colors*))
(set-border-color    (nth 3 *colors*))
(set-focus-color     (nth 3 *colors* ))
(set-unfocus-color    (nth 8 *colors* ))
(set-float-focus-color      (nth 3 *colors* ))
(set-float-unfocus-color    (nth 8 *colors* ))

;; (setf *grab-pointer-foreground* (nth 7 *colors*))
;; (setf *grab-pointer-background* (nth 7 *colors*))
(setf *grab-pointer-character*         71 )
(setf *grab-pointer-character-mask*    71 )

(update-color-map (current-screen))

(require :ttf-fonts)
(defun add-font-folder (folder)
  (setq clx-truetype::*font-dirs*
        (append (list (namestring folder))
                clx-truetype::*font-dirs*)))
(add-font-folder (concat (getenv "HOME") "/.local/share/fonts"))
(add-font-folder "/run/current-system/profile/share/fonts/")
(setf clx-truetype::+font-cache-filename+ (concat (getenv "HOME") "/.fonts/font-cache.sexp"))
(xft:cache-fonts)
(set-font (make-instance 'xft:font :family "Essential PragmataPro" :subfamily "Regular" :size 10))

(stumpwm::single-frame-p)

;; End of file
