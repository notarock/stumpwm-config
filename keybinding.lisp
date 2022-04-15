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

;; All my keybinds.

;;; Code:
(in-package :stumpwm)

;;; Code:
(set-prefix-key (kbd "s-c"))

;; Frames navigation using HJKL
(loop for (vi-key name) in '(("k" "up")
                             ("j" "down")
                             ("h" "left")
                             ("l" "right"))
      do (let ((key-combo (format nil "s-~A" vi-key))
               (shifted-key-combo (format nil "s-~A" (string-upcase vi-key))))
           (define-key *top-map* (kbd key-combo)
             (format nil "move-focus ~A" name))
           (define-key *top-map* (kbd shifted-key-combo)
             (format nil "move-window ~A" name))))

;; Frames manipulation
(define-key *top-map* (kbd "s-u") "vsplit")
(define-key *top-map* (kbd "s-o") "hsplit")
(define-key *top-map* (kbd "s-r") "remove")
(define-key *top-map* (kbd "s-f") "fullscreen")

;; Switching groups (workspaces)
(define-key *top-map* (kbd "s-1") "gselect 1")
(define-key *top-map* (kbd "s-2") "gselect 2")
(define-key *top-map* (kbd "s-3") "gselect 3")
(define-key *top-map* (kbd "s-4") "gselect 4")
(define-key *top-map* (kbd "s-5") "gselect 5")
(define-key *top-map* (kbd "s-6") "gselect 6")
(define-key *top-map* (kbd "s-7") "gselect 7")
(define-key *top-map* (kbd "s-8") "gselect 8")
(define-key *top-map* (kbd "s-9") "gselect 9")

(define-key *top-map* (kbd "s-m") "gmove")

;; Show programs in every workspaces
(define-key *top-map* (kbd "s-0") "vgroups")

;; Banish cursor
(define-key *top-map* (kbd "s-b") "banish")

;; Launcher && terminal
(define-key *top-map* (kbd "s-RET") (concat "run-shell-command exec " "kitty"))
(define-key *top-map* (kbd "s-d") "run-shell-command rofi -show run")

;; Brightness
(define-key *top-map* (kbd "XF86MonBrightnessUp") "backlight-up")
(define-key *top-map* (kbd "XF86MonBrightnessDown") "backlight-down")

;; Volume
(define-key *top-map* (kbd "XF86AudioMute") "volume-mute")
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "volume-up")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "volume-down")

(define-key *top-map* (kbd "s-S") "screenshot")

;; Add "run-or-raises" programs to root-map
(define-key *root-map* (kbd "f")            "firefox")
(define-key *root-map* (kbd "s-f")            "firefox")
(define-key *root-map* (kbd "t")            "thunderbird")
(define-key *root-map* (kbd "s-t")            "thunderbird")
(define-key *root-map* (kbd "p")            "pass-copy-menu")
(define-key *root-map* (kbd "s-p")            "pass-copy-menu")

(define-key *top-map* (kbd "s-1") "gselect 1")
(define-key *top-map* (kbd "s-2") "gselect 2")
(define-key *top-map* (kbd "s-3") "gselect 3")
(define-key *top-map* (kbd "s-4") "gselect 4")


(define-key *top-map* (kbd "s-Delete") "productivity-mode-toggle")

;; Quit menu
(define-key *top-map* (kbd "s-)") "end-session")
(define-key *top-map* (kbd "XF86PowerOff") "end-session")
;; Web search
(define-key *top-map* (kbd "s-s") "duckduckgo")
;; Select xrandr configuration (uses ~/.screensession folder)
(define-key *top-map* (kbd "XF86Display") "choose-display-layout")

(define-key *top-map* (kbd "s-R") "ask-confirmation-loadrc")

(define-key *root-map* (kbd "s-l")            "lock-screen")

;; End of file
