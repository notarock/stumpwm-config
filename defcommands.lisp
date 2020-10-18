; -* mode: lisp; -*-
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

;;; Define usefull commands and load helpers

;;; Code:

(in-package :stumpwm)

;;;; Run or raise most used programs
(defcommand thunderbird () ()
  "Run-or-Raise Thunderbird"
  (run-or-raise "thunderbird" '(:class "Thunderbird")))

(defcommand firefox () ()
  "Run-or-Raise Firefox"
  (run-or-raise "firefox" '(:class "Firefox")))

(defcommand emacs () ()
  "Run-or-Raise Emacs"
  (run-or-raise "emacs" '(:class "Emacs")))

;; Brightness control
(defcommand backlight-up () ()
  "Up backlight by 20"
  (run-shell-command "xbacklight + 20"))

(defcommand backlight-down () ()
  "Up backlight by 20"
  (run-shell-command "xbacklight - 20"))

;; Volumes control
(defcommand volume-mute () ()
  "Mute / Unmute volume"
  (run-shell-command "amixer set Master toggle"))

(defcommand volume-up () ()
  "Mute / Unmute volume"
  (run-shell-command "pactl -- set-sink-volume 0 +10% && notify-send 'Volume +10'"))

(defcommand volume-down () ()
  "Mute / Unmute volume"
  (run-shell-command "pactl -- set-sink-volume 0 -10% && notify-send 'Volume -10'"))

(defcommand set-selected-wallpaper () ()
  "Set /Pictures/wallpaper/selected.png as wallpaper"
  (run-shell-command "feh --bg-scale ~/Pictures/wallpaper/selected*"))

(defcommand lock-screen () ()
  "Uses ~/bin/lockscreen.sh to lock the screen"
  (run-shell-command "~/bin/lockscreen.sh"))

(defcommand screenshot () ()
  "Launch flameshot"
  (run-shell-command "flameshot gui"))

;; Load helpers
(load (concat (getenv "HOME") "/.config/stumpwm/helper/xrandr.lisp")) ;; Frame-preferences and groups mapping
(load (concat (getenv "HOME") "/.config/stumpwm/helper/web-jump.lisp")) ;; Frame-preferences and groups mapping
(load (concat (getenv "HOME") "/.config/stumpwm/helper/confirm-command.lisp")) ;; Frame-preferences and groups mapping

;; End of file
