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

;;; This file define all frame-preferences, groups 

;;; Code:

(in-package :stumpwm)

;;;; Most used programs
(defcommand thunderbird () ()
  "Run-or-Raise Thunderbird"
  (run-or-raise "thunderbird" '(:class "Thunderbird")))

(defcommand firefox () ()
  "Run-or-Raise Firefox"
  (run-or-raise "firefox" '(:class "Firefox")))

(defcommand emacs () ()
  "Run-or-Raise Emacs"
  (run-or-raise "emacs" '(:class "Emacs")))

;;;; Frame Preferences

(define-frame-preference "Default"
    ;; frame raise lock (lock AND raise == jumpto)
    (0 t   t :class "Firefox"))

(define-frame-preference "MAIL"
    ;; frame raise lock (lock AND raise == jumpto)
    (0 t   t :class "Thunderbird"))

(define-frame-preference "EMACS"
    ;; frame raise lock (lock AND raise == jumpto)
    (0 t   t :class "Emacs"))

;;;; Define groups

;;      DEFAUT              ;; 1
(gnewbg "EMACS")            ;; 2
(gnewbg "TERM")             ;; 3
(gnewbg "POSTMAN")          ;; 4
(gnewbg "MISC")             ;; 5
(gnewbg-float "FLOAT")      ;; 6
(gnewbg "ETC")              ;; 7
(gnewbg "MUSIC")            ;; 8
(gnewbg "MAIL")             ;; 9

;; TODO: Move all keybindings in another file
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
(define-key *top-map* (kbd "s--") "gprev")
(define-key *top-map* (kbd "s-=") "gnext")

;; Show programs in every workspaces
(define-key *top-map* (kbd "s-0") "vgroups")


;; End of file
