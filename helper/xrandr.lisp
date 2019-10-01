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

;;; Change xorg display settings easily using select-from-menu and .screenlayout
;;; files (generated using arandr)

;;; Code:

(in-package :stumpwm)

(defcommand set-dpi-2k () ()
  "Set xResources DPI"
  (run-shell-command "xrdb ~/.Xresources-2k")
  (set-font-size 12)
  )

(defcommand set-dpi-1080p () ()
  "Set xResources DPI"
  (run-shell-command "xrdb ~/.Xresources-1080p")
  (set-font-size 9)
  )

(defcommand adjust-new-display (resolution) ()
  "Refresh heads to fit the new layout and restart stumptray"
  (if
   (equal resolution "2k")(set-dpi-2k))
  (if
   (equal resolution "1080p")(set-dpi-1080p))
  (refresh-heads)         ;; Refresh mode-line and heads size after xrandr update
  (stumptray:stumptray)   ;; Disable strumptray
  (refresh-heads)
  (stumptray:stumptray)   ;; Enable strumptray, centered on the newly-placed mode-line
  (set-selected-wallpaper)
  )

(defcommand set-layout (args) ()
  "Load a xrandr configuration and adjust display"
  (message (concatenate 'string "Applying " (first args) " layout...") )
  (run-shell-command (concatenate 'string "~/.screenlayout/" (first args) ".sh"))
  (adjust-new-display (second args)))

(defcommand choose-display-layout () ()
  "Interactivement chose a xrandr display config"
  (let ((choice (select-from-menu (current-screen) *screen-layout-menu*
                                  "Choose screen layout: ")))
    (when choice
      (set-layout (list (string (second choice))(string (third choice)))))))

(defvar *screen-layout-menu*
  (list (list "Laptop 2k" "laptop" "2k")
        (list "Bureau" "bureau" "1080p")
        (list "Cedille" "cedille" "1080p")
        (list "Work (2x 1080p)"  "work" "1080p")
        (list "Mirrored 1080p" "mirrored" "1080p")))

;; End of file
