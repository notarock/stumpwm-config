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

;;; Load all modules used by stumpwm

;;; Code:

(in-package :stumpwm)

;;; Load modules
(set-module-dir
 (pathname-as-directory (concat (getenv "HOME") "/.config/stumpwm/stumpwm-contrib/util")))

(load-module "pass")
(load-module "end-session")
;; (load-module "ttf-fonts")
(load-module "swm-gaps")
(load-module "swm-golden-ratio")
(load-module "productivity")

;; ;; mode-line utility modules
(set-module-dir
 (pathname-as-directory (concat (getenv "HOME") "/.config/stumpwm/stumpwm-contrib/modeline")))

(load-module "cpu")
(load-module "mem")
(load-module "net")
(load-module "wifi")
(load-module "stumptray")

;; Additionnal lisp modules extensions
; (ql:quickload "clx-truetype") ;; Used for font rendering

;; End of file
