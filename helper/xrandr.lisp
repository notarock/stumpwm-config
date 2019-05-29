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

(defcommand adjust-new-display () ()
  "Refresh heads to fit the new layout and restart stumptray"
  (refresh-heads)         ;; Refresh mode-line and heads size after xrandr update
  (stumptray:stumptray)   ;; Disable strumptray
  (refresh-heads)
  (stumptray:stumptray)   ;; Enable strumptray, centered on the newly-placed mode-line
  (set-selected-wallpaper)
  )

(defcommand set-layout (file) ()
  "Load a xrandr configuration and adjust display"
  (message (concatenate 'string "Applying " file " layout...") )
  (run-shell-command (concatenate 'string "~/.screenlayout/" file ".sh"))
  (adjust-new-display))

(defcommand choose-display-layout () ()
  "Interactivement chose a xrandr display config"
  (let ((choice (select-from-menu (current-screen) *screen-layout-menu*
                                  "Choose screen layout: ")))
    (when choice
      (set-layout (string-downcase (string (second choice)))))))

(defvar *screen-layout-menu*
  (list (list "Laptop 2k" "laptop")
        (list "Bureau" "bureau")
        (list "Work (2x 1080p)"  "work")
        (list "Mirrored 1080p" "mirrored")))

;; End of file
