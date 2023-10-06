
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(setq indent-tabs-mode nil)

(menu-bar-mode -1)            ; Disable the menu bar

(setq inhibit-startup-message t) ;; Disable splash screen


;; FONT SETTINGS

(defvar jh/default-font-size 100)
(defvar jh/variable-pitch-font-size 100)
(defvar jh/default-font-name "Jetbrains Mono")
(defvar jh/variable-pitch-font-name "Hack Nerd Font")

(set-face-attribute 'default nil
		    :font jh/default-font-name
		    :height jh/default-font-size)
(set-face-attribute 'variable-pitch nil
		    :font jh/variable-pitch-font-name
		    :height jh/variable-pitch-font-size)


;; LIGATURES
(load "ligature.el")


;; THEME SETTINGS

;; (load "zenburn-theme.el")

;; ;; use variable-pitch fonts for some headings and titles
;; (setq zenburn-use-variable-pitch t)

;; ;; scale headings in org-mode
;; (setq zenburn-scale-org-headlines t)

;; ;; scale headings in outline-mode
;; (setq zenburn-scale-outline-headlines t)
;; (load-theme 'zenburn t)

(load "gruber-darker-theme")
(load-theme 'gruber-darker t)
