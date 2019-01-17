;;; highlight-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "highlight" "highlight.el" (0 0 0 0))
;;; Generated autoloads from highlight.el

(defvar hlt-auto-face-foreground nil "\
*Foreground color for pseudo faces created from a chosen background.\nThe value is either a color (name or #RGB hex triplet) or nil.  A nil\nvalue means that highlighting does not change the existing foreground\ncolor.")

(custom-autoload 'hlt-auto-face-foreground "highlight" t)

(defvar hlt-auto-faces-flag nil "\
*Non-nil means highlighting can automatically choose faces.\nHighlighting action can use the next background color or face in\n`hlt-auto-face-backgrounds'.  When a given item in the list is a color\nname, not a face, `hlt-auto-face-foreground' is used as the\ncorresponding foreground.\n\nThis option has no effect on unhighlighting.")

(custom-autoload 'hlt-auto-faces-flag "highlight" t)

(defvar hlt-default-copy/yank-props '(face) "\
*Properties that `hlt-copy-props' and `hlt-yank-props' use by default.\nYou can use a prefix argument with those commands to override the\ndefault behavior.\nEither a list of properties (symbols) or `t', meaning all properties.")

(custom-autoload 'hlt-default-copy/yank-props "highlight" t)

(defvar hlt-face-prop (if (< emacs-major-version 22) 'face 'font-lock-face) "\
*Face property used for highlighting: `face' or `font-lock-face'.\nIf the value is `font-lock-face' then highlighting by library\n`highlight.el' disappears when `font-lock-mode' is turned off.\n\nIf the value is `face', and if library`font-lock+.el' has been loaded,\nthen highlighting persists - it is independent of font-locking.\n\nFor Emacs 20 or 21, font-locking does not recognize property\n`font-lock-face', so just use `face' (the default value for these\nversions), not `font-lock-face' - do not change the value.")

(custom-autoload 'hlt-face-prop "highlight" t)

(defvar hlt-line-dups-ignore-regexp "[ 	]*" "\
Regexp to ignore leading and trailing text for duplicate lines.\nOr nil if no such text is to be ignored.\nUsed by `hlt-highlight-line-dups-region' to determine whether two\nlines are duplicates.")

(custom-autoload 'hlt-line-dups-ignore-regexp "highlight" t)

(defvar hlt-max-region-no-warning 100000 "\
*Maximum size (chars) of region to highlight without confirmation.\nThis is used only for highlighting of a regexp, which can be slow.")

(custom-autoload 'hlt-max-region-no-warning "highlight" t)

(defvar hlt-overlays-priority 0 "\
*Priority of the overlays created by `hlt-*' functions.")

(custom-autoload 'hlt-overlays-priority "highlight" t)

(defvar hlt-use-overlays-flag 'only "\
*Non-nil means use overlays to highlight; nil means use text properties.\nThis value also affects some actions, such as unhighlighting, for text\nthat is highlighted.  If the value is `only' (the default value), then\nthose actions only affect overlay highlighting.  Otherwise, they\naffect both kinds of highlighting.")

(custom-autoload 'hlt-use-overlays-flag "highlight" t)

(autoload 'hlt-choose-default-face "highlight" "\
Choose a face for highlighting.\nSet `hlt-last-face' to the face, and return it.\n\nYou can choose a face name or a color name.  If a color is chosen, it\nis used for the face background.  The face foreground is determined by\nthe value of `hlt-auto-face-foreground'.\n\n(fn FACE)" t nil)

(autoload 'hlt-next-face "highlight" "\
Choose the next face for highlighting and unhighlighting.\nUse `hlt-auto-face-backgrounds' and `hlt-auto-face-foreground'.\n\nA non-negative numeric prefix arg N means use the Nth entry of\n`hlt-auto-face-backgrounds'.  Counting is 0-based.\n\nA negative numeric prefix arg N means count from the end, not the\nbeginning, of `hlt-auto-face-backgrounds': -1 means the last entry, -2\nmeans the next-to-last, etc. (counting from the end is 1-based, not\n0-based).\n\nFrom LISP, if the first argument is `previous' then choose the\nprevious face, not the next one.\n\n(fn &optional FACE-NB MSGP)" t nil)

(autoload 'hlt-previous-face "highlight" "\
Like `hlt-next-face', but previous, not next.\nUse of a numeric prefix arg is the same as for `hlt-next-face'.\n\n(fn &optional FACE-NB MSGP)" t nil)

(autoload 'hlt-highlighter "highlight" "\
Highlight the text you drag the mouse over.\nThe face used is the last face that was used for highlighting.\nYou can use command `hlt-choose-default-face' to choose the default\nface to use.\n\nIf `hlt-auto-faces-flag' is non-nil then this command cycles to the\nnext color/face.  This is the case even if you do not drag the\nmouse (empty highlight).  A message tells you what the face is.\n\nA numeric prefix arg N means use the face represented by the Nth entry\nof `hlt-auto-face-backgrounds' (uses `hlt-next-face').\n\n(fn START-EVENT &optional FACE-NB)" t nil)

(autoload 'hlt-eraser "highlight" "\
Erase highlights that you click or drag the mouse over.\nIf `hlt-use-overlays-flag' is non-nil, then remove overlay\nhighlighting for the last face that was used for highlighting.  (You\ncan use command `hlt-choose-default-face' first to choose a different\nface.)\n\nIf `hlt-use-overlays-flag' is not `only', then remove text-property\nhighlighting for *ALL* faces (not just highlighting faces).  This\nmeans, in particular, that a value of nil erases both overlays for the\nlast face and text properties for all faces.\n\nWith a numeric prefix arg N, if `hlt-use-overlays-flag' is `only',\nerase the face represented by the Nth entry of\n`hlt-auto-face-backgrounds' (uses `hlt-next-face').\n\n(fn START-EVENT &optional FACE-NB)" t nil)

(autoload 'hlt-highlighter-mouse "highlight" "\
Same as `hlt-highlighter', but for binding to a menu item.\n\n(fn)" t nil)

(autoload 'hlt-eraser-mouse "highlight" "\
Same as `hlt-eraser', but for binding to a menu item.\n\n(fn)" t nil)

(autoload 'hlt-highlight "highlight" "\
Highlight or unhighlight.\nIf the region is not active or it is empty, then use the whole buffer.\nThe face used is the last face that was used for highlighting.\nYou can use command `hlt-choose-default-face' to choose a different face.\n\nThis is several commands rolled into one, depending on the prefix arg:\n\n* No prefix arg: highlight all text in region/buffer\n* Plain prefix arg (`C-u') or zero prefix arg (`C-0'): UNhighlight all\n* Positive prefix arg (`C-1'): highlight regexp matches\n* Negative prefix arg (`C--'): UNhighlight regexp matches\n\nYou can also use the individual commands:\n\n* `hlt-highlight-region'          - same as no prefix arg\n* `hlt-unhighlight-region'        - same as `C-u' or `C-0'\n* `hlt-highlight-regexp-region'   - same as `C-1'\n* `hlt-unhighlight-regexp-region' - same as `C--'\n\n(fn &optional PREFIX)" t nil)

(autoload 'hlt-highlight-region-in-buffers "highlight" "\
Use `hlt-highlight-region' in each buffer of list BUFFERS.\nA prefix arg >= 0 means highlight with `mouse-face', not `face'.\nA prefix arg <= 0 means highlight all visible or iconified buffers.\nOtherwise, you are prompted for the BUFFERS to highlight, one at a\n time.  Use `C-g' to end prompting.\nIf you specify no BUFFERS then the current buffer is highlighted.\n\nNon-nil optional arg MSGP means show status messages.\n\n(fn BUFFERS &optional MSGP)" t nil)

(autoload 'hlt-highlight-region "highlight" "\
Highlight either the region/buffer or new input that you type.\nUse the region if active, or the buffer otherwise.\n\nIf *ALL* of the following are true then apply the last-used face as a\ntext property to the next and subsequent characters that you type, and\nadd that face to a Facemenu menu (`Text Properties' or one of its\nsubmenus):\n\n * You call this command interactively.\n * You use no prefix arg.\n * Option `hlt-use-overlays-flag' is nil\n * The last property used for highlighting was `face'.\n\nOtherwise, the behavior respects `hlt-use-overlays-flag' and depends\non the optional arguments, as follows:\n\nOptional args START and END are the limits of the area to act on.\n  They default to the region limits.  If the region is not active or\n  it is empty, then use the whole buffer.  (But see BUFFERS, below.)\n\nOptional 3rd arg FACE is the face to use.\n  Interactively, this is the last face that was used for highlighting.\n  (You can use command `hlt-choose-default-face' to choose a different face.)\n\nOptional 4th arg MSGP non-nil means to display a progress message.\n  Interactively, MSGP is t.\n\nOptional 5th arg MOUSEP non-nil means use `mouse-face', not `face'.\n  Interactively, MOUSEP is provided by the prefix arg.\n\nOptional 6th arg BUFFERS is the list of buffers to highlight.\n  If non-nil and this command is called interactively then explicit\n  START and END values are ignored, and the actual values are\n  determined automatically for each buffer, based on whether the\n  region is active there.\n\n(fn &optional START END FACE MSGP MOUSEP BUFFERS)" t nil)

(autoload 'hlt-unhighlight-region-in-buffers "highlight" "\
Use `hlt-unhighlight-region' in each buffer of list BUFFERS.\nA prefix arg >= 0 means unhighlight `mouse-face', not `face'.\nA prefix arg <= 0 means unhighlight all visible or iconified buffers.\nOtherwise, you are prompted for the BUFFERS to unhighlight, one at a\n time.  Use `C-g' to end prompting.\nIf you specify no BUFFERS then the current buffer is unhighlighted.\n\nNon-nil optional arg MSGP means show status messages.\n\n(fn BUFFERS &optional MSGP)" t nil)

(autoload 'hlt-unhighlight-region "highlight" "\
Remove all highlighting in region or buffer.\nUse the region if active, or the buffer otherwise.\nThe arguments are the same as for `hlt-highlight-region'.\n\nIf `hlt-use-overlays-flag' is non-nil, then remove overlay highlighting.\nIf `hlt-use-overlays-flag' is not `only', then remove text-property\nhighlighting.  This means, in particular, that a value of nil removes\nboth overlays and text properties.\n\n(fn &optional START END FACE MSGP MOUSEP BUFFERS)" t nil)

(autoload 'hlt-highlight-regexp-region-in-buffers "highlight" "\
Use `hlt-highlight-regexp-region' in each buffer of list BUFFERS.\nA prefix arg >= 0 means highlight with `mouse-face', not `face'.\nA prefix arg <= 0 means highlight all visible or iconified buffers.\nOtherwise, you are prompted for the BUFFERS to highlight, one at a\n time.  Use `C-g' to end prompting.\nIf you specify no BUFFERS then the current buffer is highlighted.\n\nSee `hlt-highlight-regexp-region' for other arguments.\n\n(fn REGEXP BUFFERS &optional FACE MSGP MOUSEP NTH)" t nil)

(autoload 'hlt-highlight-regexp-region "highlight" "\
Highlight regular expression REGEXP in region/buffer.\nUse the region if active, or the buffer otherwise.\n\nOptional args START and END are the limits of the area to act on.\n  They default to the region limits.  (But see BUFFERS, below.)\nOptional 4th arg FACE is the face to use.\n  Interactively, this is the last face that was used for highlighting.\n  (You can use command `hlt-choose-default-face' to choose a different face.)\nOptional 5th arg MSGP:\n  t means to treat this as an interactive call when deciding to\n    display all messages.\n  non-nil & non-t means to display only error and warning messages.\nOptional 6th arg MOUSEP non-nil means to use `mouse-face' property,\n  not `face'.  Interactively, this is provided by the prefix arg.\nOptional 7th arg NTH determines which regexp subgroup is highlighted.\n  If nil or 0, the entire regexp is highlighted.  Otherwise, the NTH\n  regexp subgroup (\"\\\\(...\\\\)\" expression) is highlighted.\n  (NTH is not available interactively.)\nOptional 6th arg BUFFERS is the list of buffers to highlight.\n  If non-nil then explicit START and END values are ignored, and the\n  actual values are determined automatically for each buffer, based on\n  whether the region is active there.\n\n(fn &optional START END REGEXP FACE MSGP MOUSEP NTH BUFFERS)" t nil)

(autoload 'hlt-unhighlight-regexp-region-in-buffers "highlight" "\
Use `hlt-unhighlight-regexp-region' in each buffer of list BUFFERS.\nA prefix arg >= 0 means unhighlight `mouse-face', not `face'.\nA prefix arg <= 0 means unhighlight all visible or iconified buffers.\nOtherwise, you are prompted for the BUFFERS to unhighlight, one at a\n time.  Use `C-g' to end prompting.\nIf you specify no BUFFERS then the current buffer is unhighlighted.\n\nSee `hlt-highlight-regexp-region' for other arguments.\n\n(fn REGEXP BUFFERS &optional NTH MSGP)" t nil)

(autoload 'hlt-unhighlight-regexp-region "highlight" "\
Unhighlight text matching regular expression REGEXP in region/buffer.\nThis is like `hlt-highlight-regexp-region' (which see), but opposite.\nWhere `hlt-highlight-regexp-region' highlights REGEXP matches, this\nunhighlights the matches.\n\n(fn &optional START END REGEXP FACE MSGP MOUSEP NTH BUFFERS)" t nil)

(autoload 'hlt-highlight-regexp-to-end "highlight" "\
Highlight text after cursor that matches REGEXP.\nThe behavior respects `hlt-use-overlays-flag' and depends on the\noptional arguments, as follows:\n\n Optional 2nd arg FACE is the face to use.\n  Interactively, this is the last face that was used for highlighting.\n  (You can use command `hlt-choose-default-face' to choose a different\n  face.)\n\n Optional 3rd arg MSGP non-nil means to display a progress message.\n  Interactively, MSGP is t.\n\n Optional 4th arg MOUSEP non-nil means use property `mouse-face', not\n `face'.  Interactively, MOUSEP is provided by the prefix arg.\n\n Optional 5th arg NTH determines which regexp subgroup is highlighted.\n  If nil or 0, the entire regexp is highlighted.  Otherwise, the NTH\n  regexp subgroup (\"\\\\(...\\\\)\" expression) is highlighted.\n  (NTH is not available interactively.)\n\n(fn REGEXP &optional FACE MSGP MOUSEP NTH)" t nil)

(autoload 'hlt-unhighlight-regexp-to-end "highlight" "\
UNhighlight text after cursor that matches REGEXP.\nThis is like `hlt-highlight-regexp-to-end' (which see), but opposite.\nWhere `hlt-highlight-regexp-to-end' highlights REGEXP matches, this\nunhighlights the matches.\n\n(fn REGEXP &optional FACE MSGP MOUSEP NTH)" t nil)

(autoload 'hlt-highlight-regexp-groups-region "highlight" "\
Like `hlt-highlight-regexp-region', but highlight regexp groups.\nHighlight regular expression REGEXP in region/buffer.\nUse the region if active, or the buffer otherwise.\n\nUp to 8 group levels are highlighted, using faces `hlt-regexp-level-1'\nthrough `hlt-regexp-level-8'.  The current default highlighting face\nis used to highlight the non-group matches. You can change the default\nface using command `hlt-choose-default-face'.\n\nOptional args START and END are the limits of the area to act on.\n  They default to the region limits.\nOptional 4th arg MSGP:\n  t means to treat this as an interactive call when deciding to\n    display all messages.\n  non-nil & non-t means to display only error and warning messages.\nOptional 5th arg MOUSEP non-nil means to use `mouse-face' property,\n  not `face'.  Interactively, this is provided by the prefix arg.\n\n(fn &optional START END REGEXP MSGP MOUSEP)" t nil)

(autoload 'hlt-unhighlight-regexp-groups-region "highlight" "\
Like `hlt-highlight-regexp-groups-region', but opposite.\nWhere `hlt-highlight-regexp-groups-region' highlights REGEXP matches,\nthis unhighlights the matches.\n\n(fn &optional START END REGEXP MSGP MOUSEP)" t nil)

(autoload 'hlt-unhighlight-region-for-face-in-buffers "highlight" "\
Use `hlt-unhighlight-region-for-face' in each buffer of list BUFFERS.\nA prefix arg >= 0 means unhighlight `mouse-face', not `face'.\nA prefix arg <= 0 means unhighlight all visible or iconified buffers.\nOtherwise, you are prompted for the BUFFERS to unhighlight, one at a\n time.  Use `C-g' to end prompting.\nIf you specify no BUFFERS then the current buffer is unhighlighted.\n\nSee `hlt-unhighlight-region-for-face' for other arguments.\n\n(fn FACE BUFFERS &optional MSGP)" t nil)

(autoload 'hlt-unhighlight-region-for-face "highlight" "\
Remove any highlighting in the region that uses FACE.\nSame as `hlt-unhighlight-region', but removes only highlighting\nthat uses FACE.  Interactively, you are prompted for the face.\n\nThis works only for overlay highlighting, not text-property\nhighlighting.\n\nNote: When text in the region has been highlighted using more than one\nface, unhighlighting for one of those faces can mean that adjacent\nhighlighting outside the region appears to change.  That outside text\nstill has the same multiple-overlay face highlighting, but the overlay\nstacking order is not the same as it was.\n\nOptional arg FACE is the face to use.\n  Interactively, this is the last face that was used for highlighting.\n  (You can use command `hlt-choose-default-face' to choose a different face.)\nOptional args START and END are the limits of the area to act on.\n  They default to the region limits.  (But see BUFFERS, below.)\nOptional arg MSGP non-nil means show status messages.\nOptional arg MOUSEP non-nil means use `mouse-face' property, not\n  `face'.  Interactively, MOUSEP is provided by the prefix arg.\nOptional arg BUFFERS is the list of buffers to unhighlight for FACE.\n  If non-nil then explicit START and END values are ignored, and the\n  actual values are determined automatically for each buffer, based on\n  whether the region is active there.\n\n(fn &optional FACE START END MSGP MOUSEP BUFFERS)" t nil)

(autoload 'hlt-replace-highlight-face-in-buffers "highlight" "\
Use `hlt-replace-highlight-face' in each buffer of list BUFFERS.\nA prefix arg >= 0 means highlight with `mouse-face', not `face'.\nA prefix arg <= 0 means highlight all visible or iconified buffers.\nOtherwise, you are prompted for the BUFFERS to highlight, one at a\n time.  Use `C-g' to end prompting.\nIf you specify no BUFFERS then the current buffer is highlighted.\n\nSee `hlt-replace-highlight-face' for other arguments.\n\n(fn OLD-FACE NEW-FACE BUFFERS &optional MSGP)" t nil)

(autoload 'hlt-replace-highlight-face "highlight" "\
Replace OLD-FACE by NEW-FACE in overlay highlighting in the region.\nThis command applies only to overlay highlighting created by library\n`highlight.el'.\n\nUpdate the last-used highlighting face.\n\nWith a prefix argument, replace OLD-FACE as the `mouse-face' property,\n not the `face' property.\n\nOther arguments:\n Optional args START and END are the limits of the area to act on.\n  They default to the region limits.  If the region is not active or\n  it is empty, then use the whole buffer.\n Optional arg MSGP non-nil means display a progress message.\n Optional arg MOUSEP non-nil means use `mouse-face' property, not\n  `face'.  Interactively, MOUSEP is provided by the prefix arg.\n\n(fn OLD-FACE NEW-FACE &optional START END MSGP MOUSEP BUFFERS)" t nil)

(autoload 'hlt-highlight-symbol "highlight" "\
Highlight occurrences of SYMBOL.\nThe symbol at point is used by default, or the symbol under the mouse\npointer if the command is invoked using the mouse.\n\nHighlight over the region if active, or the buffer otherwise.\nWith a prefix arg, use all buffers that are visible or iconified.\n(This first unhighlights occurrences, to prevent stacking up multiple\nhighlighting on the same occurrences.)\n\nWhen called from Lisp:\n* ALL-BUFFERS-P corresponds to the prefix-argument behavior.\n* FACE is the face to use.\n\n(fn SYMBOL &optional ALL-BUFFERS-P FACE)" t nil)

(autoload 'hlt-unhighlight-symbol "highlight" "\
Unhighlight occurrences of SYMBOL.\nThe symbol at point is used by default, or the symbol under the mouse\npointer if the command is invoked using the mouse.\n\nUnhighlight over the region if active, or the buffer otherwise.\nWith a prefix arg, use all buffers that are visible or iconified.\n\nWhen called from Lisp:\n* ALL-BUFFERS-P corresponds to the prefix-argument behavior.\n* FACE is the face to unhighlight.\n\n(fn SYMBOL &optional ALL-BUFFERS-P FACE)" t nil)

(autoload 'hlt-highlight-enclosing-list "highlight" "\
Highlight the ARGth level sexp enclosing point.\nARG is the numeric prefix value.\n\nA negative prefix arg prompts you for the face to use.  This face is\nused by default from then on.  You can also choose the default face\nusing command `hlt-choose-default-face'.  The same face is used as the\ndefault for all `hlt-*' functions.\n\nWhen used in Lisp code:\n MOUSEP non-nil means use property `mouse-face', not `face'.\n\n(fn ARG &optional FACE MOUSEP)" t nil)

(autoload 'hlt-highlight-single-quotations "highlight" "\
Highlight single-quoted text in the region.\nThis means, for example, commands and keys between `'s: `foobar'.\nIf the region is not active or it is empty, then use the whole buffer.\nWith a prefix argument, prompt for the highlighting face to use.\nOtherwise, use the last face used for highlighting.\n You can also use command `hlt-choose-default-face' to choose a\n different face.\n\n(fn &optional FACE)" t nil)

(autoload 'hlt-highlight-line-dups-region "highlight" "\
Highlight sets of duplicate lines in the region.\nEach set is given a different background, according to user option\n`hlt-auto-face-backgrounds'.\n\nWhether leading and trailing whitespace is ignored is controlled by\noption `hlt-line-dups-ignore-regexp'.  But a prefix argument reverses\nthis: if the option value is \"\" then whitespace defined by\n\"[ 	]*\" is ignored, and otherwise whitespace is not ignored.\n\n(fn &optional START END MSGP FLIP)" t nil)

(autoload 'hlt-highlight-lines "highlight" "\
Highlight full lines in region, window-wide.\n\n(fn START END FACE MSGP)" t nil)

(autoload 'hlt-mouse-face-each-line "highlight" "\
Put `mouse-face' on each line of buffer in region.\nIf the region is active and not empty, then limit mouse-face\nhighlighting to the region.  Otherwise, use the whole buffer.\nWith a prefix argument, prompt for the highlighting face to use.\nOtherwise, use the last face used for highlighting.\n You can also use command `hlt-choose-default-face' to choose a\n different face.\nOptional args START and END are the limits of the area to act on.\n  They default to the region limits.\nOptional arg MSGP non-nil means display a progress message.\n\n(fn &optional START END FACE MSGP)" t nil)

(autoload 'hlt-toggle-use-overlays-flag "highlight" "\
Toggle `hlt-use-overlays-flag'.\nIf the current value is non-nil, it is set to nil.\nIf the current value is nil, it is set to the last non-nil value.\n\n(fn)" t nil)

(defalias 'hlt-paste-props 'hlt-yank-props)

(autoload 'hlt-yank-props "highlight" "\
Yank (paste) copied text properties over the active region.\nInteractively, do nothing if there is no nonempty active region.\nBy default, yank only the copied properties defined by\n `hlt-default-copy/yank-props'.\nWith a plain or non-negative prefix arg, yank all copied properties.\nWith a negative prefix arg, you are prompted for the copied properties\n to yank.  To finish entering properties, hit `RET RET' (i.e., twice).\n\nNOTE: If the list of copied text properties is empty, then yanking\n      REMOVES ALL PROPERTIES from the text in the region.  This\n      provides an easy way to UNpropertize text.\n\n(fn START END &optional ARG MSGP)" t nil)

(autoload 'hlt-mouse-copy-props "highlight" "\
Same as `hlt-copy-props', but copy at mouse pointer, not at point.\n\n(fn &optional EVENT ARG MSGP)" t nil)

(autoload 'hlt-copy-props "highlight" "\
Copy text properties at point for use by `hlt-yank-props'.\nProperties are copied to `hlt-copied-props'.\nBy default, copy the properties defined by\n `hlt-default-copy/yank-props'.\nWith a plain or non-negative prefix arg, copy all properties.\nWith a negative prefix arg, you are prompted for the properties to\n copy.  To finish entering properties, hit `RET RET' (i.e., twice).\n\n(fn &optional POSITION ARG MSGP)" t nil)

(autoload 'hlt-highlight-isearch-matches "highlight" "\
Highlight matches of the current Isearch search pattern using FACE.\nIf the region is active then it limits highlighting.  If inactive then\nhighlight matches throughout the buffer, or the list of BUFFERS.  If\nthis is accessed from a `multi-search' command then the BUFFERS are\nthe buffers being searched.\n\nWith no prefix arg:\n * If `hlt-auto-faces-flag' is nil then use the last highlighting face\n   used or chosen with command `hlt-choose-default-face'.\n * If non-nil then use the next highlighting face.\n\nWith a non-negative prefix arg, prompt for the face to use.\nWith a non-positive prefix arg, use `mouse-face' instead of `face'.\n\nTo use a prefix argument you must set either `isearch-allow-scroll' or\n`isearch-allow-prefix' (if available) to non-nil.  Otherwise, a prefix\narg during Isearch exits Isearch.\n\n(fn &optional FACE MSGP MOUSEP BUFFERS STRING)" t nil)

(autoload 'hlt-unhighlight-isearch-matches "highlight" "\
Unhighlight matches of the current Isearch search pattern.\nWith no prefix arg, unhighlight all faces.\nWith a non-negative prefix arg, prompt for the face to unhighlight.\nWith a non-positive prefix arg, use `mouse-face' instead of `face'.\nWith any other prefix arg, unhighlight the last highlighting face used\n or chosen with command `hlt-choose-default-face'.\n (`hlt-auto-faces-flag' has no effect.)\n\nTo use a prefix argument you must set either `isearch-allow-scroll' or\n`isearch-allow-prefix' (if available) to non-nil.  Otherwise, a prefix\narg during Isearch exits Isearch.\n\nNon-interactively, FACE = nil means unhighlight all faces.\n\n(fn &optional FACE MSGP MOUSEP BUFFERS STRING)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "highlight" '("hlt-" "menu-bar-edit-menu")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; highlight-autoloads.el ends here
