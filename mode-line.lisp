(in-package :stumpwm)

(set-module-dir
 (pathname-as-directory (concat (getenv "HOME") "/src/builds/stumpwm-contrib/modeline")))

(load-module "cpu") ;; contrib
;; (load-module "disk") ;; contrib
;; (load "/home/simon/stumpwm/gmail.lisp") ;; Personal.
(load-module "mem")
(load-module "net")
(load-module "wifi") ;; contrib

(setf *time-modeline-string* "%a %m-%d ^5*^B%l:%M^b^n")

(setq stumpwm:*mode-line-position* :top)

(setf *mode-line-background-color* (nth 10 *colors*))

(setq *separator-right* " ^7*^B««^b ")
(setq *separator-left* " ^7*^B»»^b ")

(setf stumpwm:*screen-mode-line-format*
      (list
       "^B[^b"
       "^1*%n^n"                    ; Current Group
       "^B]^b"
       " ^2*/^n "                     ; Separator groupn / focus
       "^7*^B%W^b^n"                ; Focus indicator
       *separator-left*
       "^>"                         ; right align
       *separator-right*
       "^3*^b%C"                    ; cpu
       *separator-right*
       "^2*^b%M"                    ; Memory
       *separator-right*
       "^6*[^n^B%I^b^6*]^n %l"         ; Wifi
       *separator-right*
       ;; "^5*^b%D"                    ; disk
       ;; *separator-right*
       '(:eval (string-right-trim '(#\Newline) (run-shell-command
                                                ;; "date +'%a %m-%d ^6*^B%l:%M^b^n %p'|tr -d '\\n'"
                                                ;; uses date command so time can be bold
                                                "date +'^B%m-%d ^6*%R^b'" t)))
       *separator-right*
       "          "                      ; free space for stumptray
       ))

(defcommand uaml () ()
  ""
  (update-all-mode-lines))

(dolist (head
         (list (first (screen-heads (current-screen)))) ; first
         ;; (screen-heads (current-screen)) ; all
         )
  (enable-mode-line (current-screen) head
                    t *screen-mode-line-format*))


