;;; tango-custom-theme.el --- Tango-based custom theme for faces

;; Copyright (C) 2010-2015 Free Software Foundation, Inc.

;; Authors: Chong Yidong <cyd@stupidchicken>
;;          Jan Moringen <jan.moringen@uni-bielefeld.de>

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary

;; The colors in this theme come from the Tango palette, which is in
;; the public domain: http://tango.freedesktop.org/

;;; Code:


(deftheme tango-custom
  "Face colors using the Tango palette (light background).
Basic, Font Lock, Isearch, Gnus, Message, Ediff, Flyspell,
Semantic, and Ansi-Color faces are included.")


(let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                             ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                             ((x-list-fonts "Verdana")         '(:font "Verdana"))
                             ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                             (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (let ((class '((class color) (min-colors 89)))
        ;; Tango palette colors.
        (butter-1 "#fce94f") (butter-2 "#edd400") (butter-3 "#c4a000")
        (orange-1 "#fcaf3e") (orange-2 "#f57900") (orange-3 "#ce5c00")
        (choc-1 "#e9b96e") (choc-2 "#c17d11") (choc-3 "#8f5902")
        (cham-1 "#8ae234") (cham-2 "#73d216") (cham-3 "#4e9a06")
        (blue-1 "#729fcf") (blue-2 "#3465a4") (blue-3 "#204a87")
        (plum-1 "#ad7fa8") (plum-2 "#75507b") (plum-3 "#5c3566")
        (red-1 "#ef2929")  (red-2 "#cc0000")  (red-3 "#a40000")
        (alum-1 "#eeeeec") (alum-2 "#d3d7cf") (alum-3 "#babdb6")
        (alum-4 "#888a85") (alum-5 "#5f615c") (alum-6 "#2e3436")
        ;; Not in Tango palette; used for better contrast.
        (cham-4 "#346604") (blue-0 "#8cc4ff") (orange-4 "#b35000"))

    (custom-theme-set-faces
     'tango-custom
     `(default ((,class (:foreground ,alum-6 :background ,alum-1))))
     `(cursor ((t (:background ,blue-3))))
     ;; Highlighting faces
     `(fringe ((,class (:background "gray80")))) ;; alum-2
     `(linum  ((,class (:background "gray80" :foreground "medium blue"))))
     `(highlight ((,class (:background "gray87")))) ;; alum-3
     `(region ((,class (:background "#a4cdff" :distant-foreground "#808080")))) ;; alum-3
     `(secondary-selection ((,class (:background ,blue-0 :distant-foreground "black"))))
     `(isearch ((,class (:foreground "#ffffff" :background ,orange-3))))
     `(lazy-highlight ((,class (:background ,choc-1))))
     `(trailing-whitespace ((,class (:background ,red-1))))
     '(dired-directory ((t (:foreground "royal blue"))))
     '(ido-first-match ((t (:foreground "dark green"))))
     ;; Mode line faces
     `(mode-line ((,class (:box (:line-width -1 :style released-button)
			                    :background ,alum-2 :foreground ,alum-6))))
     `(mode-line-inactive ((,class (:box (:line-width -1 :style released-button)
				                         :background ,alum-4 :foreground ,alum-6))))
     '(wg-mode-line-face ((t (:foreground "SteelBlue4" :distant-foreground "cyan"))))
     ;; Escape and prompt faces
     `(minibuffer-prompt ((,class (:weight bold :foreground ,blue-3))))
     `(escape-glyph ((,class (:foreground ,red-3))))
     `(error ((,class (:foreground ,red-3))))
     `(warning ((,class (:foreground ,orange-3))))
     `(success ((,class (:foreground ,cham-3))))
     ;; Font lock faces
     `(font-lock-builtin-face ((,class (:foreground ,plum-2))))
     ;; `(font-lock-comment-face ((,class (:slant italic :foreground "gray60")))) ;; ,alum-5
     `(font-lock-comment-face ((,class (:slant normal :foreground "gray60")))) ;; ,alum-5
     `(font-lock-constant-face ((,class (:foreground "dark cyan")))) ;; ,blue-3 :weight bold
     `(font-lock-function-name-face ((,class (:foreground "Blue1")))) ;; ,red-3
     `(font-lock-keyword-face ((,class (:foreground "Purple")))) ;; ,cham-4
     `(font-lock-string-face ((,class (:foreground "dark red")))) ;; ,plum-3
     `(font-lock-number-face ((,class (:foreground "VioletRed3")))) ;; ,plum-3
     `(font-lock-type-face ((,class (:foreground "ForestGreen")))) ;; ,blue-1
     `(font-lock-variable-name-face ((,class (:foreground ,orange-4)))) ;; ,orange-4
     ;; ;; Org mode, different font size for different level of headings
     ;; `(org-level-8 ((,class (:inherit outline-8 ,@variable-tuple))))
     ;; `(org-level-7 ((,class (:inherit outline-7 ,@variable-tuple))))
     ;; `(org-level-6 ((,class (:inherit outline-6 ,@variable-tuple))))
     ;; `(org-level-5 ((,class (:inherit outline-5 ,@variable-tuple))))
     ;; ;; `(org-level-4 ((,class (:inherit outline-4 ,@variable-tuple :height 1.1 :foreground "gold4"))))
     ;; ;; `(org-level-3 ((,class (:inherit outline-3 ,@variable-tuple :height 1.2))))
     ;; ;; `(org-level-2 ((,class (:inherit outline-2 ,@variable-tuple :height 1.3))))
     ;; ;; `(org-level-1 ((,class (:inherit outline-1 ,@variable-tuple :height 1.4))))
     ;; `(org-level-4 ((,class (:inherit outline-4 ,@variable-tuple :foreground "gold4"))))
     ;; `(org-level-3 ((,class (:inherit outline-3 ,@variable-tuple))))
     ;; `(org-level-2 ((,class (:inherit outline-2 ,@variable-tuple))))
     ;; `(org-level-1 ((,class (:inherit outline-1 ,@variable-tuple))))
     ;; ;; `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))
     ;; ;; '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
     ;; ;; '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
     ;; ;; '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
     ;; ;; '(org-level-4 ((t (:inherit outline-4 :height 1.0 :foreground "gold4"))))
     ;; ;; `(org-level-4 ((,class (:foreground "gold4"))))
     ;; ;; '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
     `(org-level-8 ((,class (:inherit outline-8 :height 1.0))))
     `(org-level-7 ((,class (:inherit outline-7 :height 1.0))))
     `(org-level-6 ((,class (:inherit outline-6 :height 1.0))))
     `(org-level-5 ((,class (:inherit outline-5 :height 1.0))))
     `(org-level-4 ((,class (:inherit outline-4 :height 1.0))))
     `(org-level-3 ((,class (:inherit outline-3 :height 1.0))))
     `(org-level-2 ((,class (:inherit outline-2 :height 1.0))))
     `(org-level-1 ((,class (:inherit outline-1 :height 1.0))))
     ;; Magit
     '(magit-section-highlight ((t (:extend t :background "grey85"))))
     ;; Button and link faces
     `(link ((,class (:underline t :foreground ,blue-3))))
     `(link-visited ((,class (:underline t :foreground ,blue-2))))
     ;; Gnus faces
     `(gnus-group-news-1 ((,class (:weight bold :foreground ,plum-3))))
     `(gnus-group-news-1-low ((,class (:foreground ,plum-3))))
     `(gnus-group-news-2 ((,class (:weight bold :foreground ,blue-3))))
     `(gnus-group-news-2-low ((,class (:foreground ,blue-3))))
     `(gnus-group-news-3 ((,class (:weight bold :foreground ,red-3))))
     `(gnus-group-news-3-low ((,class (:foreground ,red-3))))
     `(gnus-group-news-4 ((,class (:weight bold :foreground ,"#7a4c02"))))
     `(gnus-group-news-4-low ((,class (:foreground ,"#7a4c02"))))
     `(gnus-group-news-5 ((,class (:weight bold :foreground ,orange-3))))
     `(gnus-group-news-5-low ((,class (:foreground ,orange-3))))
     `(gnus-group-news-low ((,class (:foreground ,alum-4))))
     `(gnus-group-mail-1 ((,class (:weight bold :foreground ,plum-3))))
     `(gnus-group-mail-1-low ((,class (:foreground ,plum-3))))
     `(gnus-group-mail-2 ((,class (:weight bold :foreground ,blue-3))))
     `(gnus-group-mail-2-low ((,class (:foreground ,blue-3))))
     `(gnus-group-mail-3 ((,class (:weight bold :foreground ,cham-3))))
     `(gnus-group-mail-3-low ((,class (:foreground ,cham-3))))
     `(gnus-group-mail-low ((,class (:foreground ,alum-4))))
     `(gnus-header-content ((,class (:foreground ,cham-3))))
     `(gnus-header-from ((,class (:weight bold :foreground ,butter-3))))
     `(gnus-header-subject ((,class (:foreground ,red-3))))
     `(gnus-header-name ((,class (:foreground ,blue-3))))
     `(gnus-header-newsgroups ((,class (:foreground ,alum-4))))
     ;; Message faces
     `(message-header-name ((,class (:foreground ,blue-3))))
     `(message-header-cc ((,class (:foreground ,butter-3))))
     `(message-header-other ((,class (:foreground ,choc-2))))
     `(message-header-subject ((,class (:foreground ,red-3))))
     `(message-header-to ((,class (:weight bold :foreground ,butter-3))))
     `(message-cited-text ((,class (:slant italic :foreground ,alum-5))))
     `(message-separator ((,class (:weight bold :foreground ,cham-3))))
     ;; SMerge
     `(smerge-refined-change ((,class (:background ,plum-1))))
     ;; Ediff
     `(ediff-current-diff-A ((,class (:background ,blue-1))))
     `(ediff-fine-diff-A ((,class (:background ,plum-1))))
     `(ediff-current-diff-B ((,class (:background ,butter-1))))
     `(ediff-fine-diff-B ((,class (:background ,orange-1))))
     ;; Flyspell
     `(flyspell-duplicate ((,class (:underline ,orange-1))))
     `(flyspell-incorrect ((,class (:underline ,red-1))))
     ;; Semantic faces
     `(semantic-decoration-on-includes ((,class (:underline  ,cham-4))))
     `(semantic-decoration-on-private-members-face
       ((,class (:background ,alum-2))))
     `(semantic-decoration-on-protected-members-face
       ((,class (:background ,alum-2))))
     `(semantic-decoration-on-unknown-includes
       ((,class (:background ,choc-3))))
     `(semantic-decoration-on-unparsed-includes
       ((,class (:underline  ,orange-3))))
     `(semantic-tag-boundary-face ((,class (:overline   ,blue-1))))
     `(semantic-unmatched-syntax-face ((,class (:underline  ,red-1))))

     (custom-theme-set-variables
      'tango-custom
      `(ansi-color-names-vector [,alum-6 ,red-3 ,cham-3 ,butter-3
				                         ,blue-3 ,plum-3 ,blue-1 ,alum-1])))))

(provide-theme 'tango-custom)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; tango-custom-theme.el ends here
