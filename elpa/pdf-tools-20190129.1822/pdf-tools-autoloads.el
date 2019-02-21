;;; pdf-tools-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pdf-annot" "pdf-annot.el" (0 0 0 0))
;;; Generated autoloads from pdf-annot.el

(autoload 'pdf-annot-minor-mode "pdf-annot" "\
Support for PDF Annotations.\n\n\\{pdf-annot-minor-mode-map}\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-annot" '("pdf-annot-")))

;;;***

;;;### (autoloads nil "pdf-cache" "pdf-cache.el" (0 0 0 0))
;;; Generated autoloads from pdf-cache.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-cache" '("page" "pdf-cache-" "textregions" "boundingbox" "define-pdf-cache-function")))

;;;***

;;;### (autoloads nil "pdf-dev" "pdf-dev.el" (0 0 0 0))
;;; Generated autoloads from pdf-dev.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-dev" '("pdf-dev-")))

;;;***

;;;### (autoloads nil "pdf-history" "pdf-history.el" (0 0 0 0))
;;; Generated autoloads from pdf-history.el

(autoload 'pdf-history-minor-mode "pdf-history" "\
Keep a history of previously visited pages.\n\nThis is a simple stack-based history.  Turning the page or\nfollowing a link pushes the left-behind page on the stack, which\nmay be navigated with the following keys.\n\n\\{pdf-history-minor-mode-map}\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-history" '("pdf-history-")))

;;;***

;;;### (autoloads nil "pdf-info" "pdf-info.el" (0 0 0 0))
;;; Generated autoloads from pdf-info.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-info" '("pdf-info-")))

;;;***

;;;### (autoloads nil "pdf-isearch" "pdf-isearch.el" (0 0 0 0))
;;; Generated autoloads from pdf-isearch.el

(autoload 'pdf-isearch-minor-mode "pdf-isearch" "\
Isearch mode for PDF buffer.\n\nWhen this mode is enabled \\[isearch-forward], among other keys,\nstarts an incremental search in this PDF document.  Since this mode\nuses external programs to highlight found matches via\nimage-processing, proceeding to the next match may be slow.\n\nTherefore two isearch behaviours have been defined: Normal isearch and\nbatch mode.  The later one is a minor mode\n(`pdf-isearch-batch-mode'), which when activated inhibits isearch\nfrom stopping at and highlighting every single match, but rather\ndisplay them batch-wise.  Here a batch means a number of matches\ncurrently visible in the selected window.\n\nThe kind of highlighting is determined by three faces\n`pdf-isearch-match' (for the current match), `pdf-isearch-lazy'\n(for all other matches) and `pdf-isearch-batch' (when in batch\nmode), which see.\n\nColors may also be influenced by the minor-mode\n`pdf-view-dark-minor-mode'.  If this is minor mode enabled, each face's\ndark colors, are used (see e.g. `frame-background-mode'), instead\nof the light ones.\n\n\\{pdf-isearch-minor-mode-map}\nWhile in `isearch-mode' the following keys are available. Note\nthat not every isearch command work as expected.\n\n\\{pdf-isearch-active-mode-map}\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-isearch" '("pdf-isearch-")))

;;;***

;;;### (autoloads nil "pdf-links" "pdf-links.el" (0 0 0 0))
;;; Generated autoloads from pdf-links.el

(autoload 'pdf-links-minor-mode "pdf-links" "\
Handle links in PDF documents.\\<pdf-links-minor-mode-map>\n\nIf this mode is enabled, most links in the document may be\nactivated by clicking on them or by pressing \\[pdf-links-action-perform] and selecting\none of the displayed keys, or by using isearch limited to\nlinks via \\[pdf-links-isearch-link].\n\n\\{pdf-links-minor-mode-map}\n\n(fn &optional ARG)" t nil)

(autoload 'pdf-links-action-perform "pdf-links" "\
Follow LINK, depending on its type.\n\nThis may turn to another page, switch to another PDF buffer or\ninvoke `pdf-links-browse-uri-function'.\n\nInteractively, link is read via `pdf-links-read-link-action'.\nThis function displays characters around the links in the current\npage and starts reading characters (ignoring case).  After a\nsufficient number of characters have been read, the corresponding\nlink's link is invoked.  Additionally, SPC may be used to\nscroll the current page.\n\n(fn LINK)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-links" '("pdf-links-")))

;;;***

;;;### (autoloads nil "pdf-loader" "pdf-loader.el" (0 0 0 0))
;;; Generated autoloads from pdf-loader.el

(autoload 'pdf-loader-install "pdf-loader" "\
Prepare Emacs for using PDF Tools.\n\nThis function acts as a replacement for `pdf-tools-install' and\nmakes Emacs load and use PDF Tools as soon as a PDF file is\nopened, but not sooner.\n\nThe arguments are passed verbatim to `pdf-tools-install', which\nsee.\n\n(fn &optional NO-QUERY-P SKIP-DEPENDENCIES-P NO-ERROR-P FORCE-DEPENDENCIES-P)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-loader" '("pdf-loader--")))

;;;***

;;;### (autoloads nil "pdf-misc" "pdf-misc.el" (0 0 0 0))
;;; Generated autoloads from pdf-misc.el

(autoload 'pdf-misc-minor-mode "pdf-misc" "\
FIXME:  Not documented.\n\n(fn &optional ARG)" t nil)

(autoload 'pdf-misc-size-indication-minor-mode "pdf-misc" "\
Provide a working size indication in the mode-line.\n\n(fn &optional ARG)" t nil)

(autoload 'pdf-misc-menu-bar-minor-mode "pdf-misc" "\
Display a PDF Tools menu in the menu-bar.\n\n(fn &optional ARG)" t nil)

(autoload 'pdf-misc-context-menu-minor-mode "pdf-misc" "\
Provide a right-click context menu in PDF buffers.\n\n\\{pdf-misc-context-menu-minor-mode-map}\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-misc" '("pdf-misc-")))

;;;***

;;;### (autoloads nil "pdf-occur" "pdf-occur.el" (0 0 0 0))
;;; Generated autoloads from pdf-occur.el

(autoload 'pdf-occur "pdf-occur" "\
List lines matching STRING or PCRE.\n\nInteractively search for a regexp. Unless a prefix arg was given,\nin which case this functions performs a string search.\n\nIf `pdf-occur-prefer-string-search' is non-nil, the meaning of\nthe prefix-arg is inverted.\n\n(fn STRING &optional REGEXP-P)" t nil)

(autoload 'pdf-occur-multi-command "pdf-occur" "\
Perform `pdf-occur' on multiple buffer.\n\nFor a programmatic search of multiple documents see\n`pdf-occur-search'.\n\n(fn)" t nil)

(defvar pdf-occur-global-minor-mode nil "\
Non-nil if Pdf-Occur-Global minor mode is enabled.\nSee the `pdf-occur-global-minor-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `pdf-occur-global-minor-mode'.")

(custom-autoload 'pdf-occur-global-minor-mode "pdf-occur" nil)

(autoload 'pdf-occur-global-minor-mode "pdf-occur" "\
Enable integration of Pdf Occur with other modes.\n\nThis global minor mode enables (or disables)\n`pdf-occur-ibuffer-minor-mode' and `pdf-occur-dired-minor-mode'\nin all current and future ibuffer/dired buffer.\n\n(fn &optional ARG)" t nil)

(autoload 'pdf-occur-ibuffer-minor-mode "pdf-occur" "\
Hack into ibuffer's do-occur binding.\n\nThis mode remaps `ibuffer-do-occur' to\n`pdf-occur-ibuffer-do-occur', which will start the PDF Tools\nversion of `occur', if all marked buffer's are in `pdf-view-mode'\nand otherwise fallback to `ibuffer-do-occur'.\n\n(fn &optional ARG)" t nil)

(autoload 'pdf-occur-dired-minor-mode "pdf-occur" "\
Hack into dired's `dired-do-search' binding.\n\nThis mode remaps `dired-do-search' to\n`pdf-occur-dired-do-search', which will start the PDF Tools\nversion of `occur', if all marked buffer's are in `pdf-view-mode'\nand otherwise fallback to `dired-do-search'.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-occur" '("pdf-occur-")))

;;;***

;;;### (autoloads nil "pdf-outline" "pdf-outline.el" (0 0 0 0))
;;; Generated autoloads from pdf-outline.el

(autoload 'pdf-outline-minor-mode "pdf-outline" "\
Display an outline of a PDF document.\n\nThis provides a PDF's outline on the menu bar via imenu.\nAdditionally the same outline may be viewed in a designated\nbuffer.\n\n\\{pdf-outline-minor-mode-map}\n\n(fn &optional ARG)" t nil)

(autoload 'pdf-outline "pdf-outline" "\
Display an PDF outline of BUFFER.\n\nBUFFER defaults to the current buffer.  Select the outline\nbuffer, unless NO-SELECT-WINDOW-P is non-nil.\n\n(fn &optional BUFFER NO-SELECT-WINDOW-P)" t nil)

(autoload 'pdf-outline-imenu-enable "pdf-outline" "\
Enable imenu in the current PDF buffer.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-outline" '("pdf-outline")))

;;;***

;;;### (autoloads nil "pdf-sync" "pdf-sync.el" (0 0 0 0))
;;; Generated autoloads from pdf-sync.el

(autoload 'pdf-sync-minor-mode "pdf-sync" "\
Correlate a PDF position with the TeX file.\n\\<pdf-sync-minor-mode-map>\nThis works via SyncTeX, which means the TeX sources need to have\nbeen compiled with `--synctex=1'.  In AUCTeX this can be done by\nsetting `TeX-source-correlate-method' to 'synctex (before AUCTeX\nis loaded) and enabling `TeX-source-correlate-mode'.\n\nThen \\[pdf-sync-backward-search-mouse] in the PDF buffer will open the\ncorresponding TeX location.\n\nIf AUCTeX is your preferred tex-mode, this library arranges to\nbind `pdf-sync-forward-display-pdf-key' (the default is `C-c C-g')\nto `pdf-sync-forward-search' in `TeX-source-correlate-map'.  This\nfunction displays the PDF page corresponding to the current\nposition in the TeX buffer.  This function only works together\nwith AUCTeX.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-sync" '("pdf-sync-")))

;;;***

;;;### (autoloads nil "pdf-tools" "pdf-tools.el" (0 0 0 0))
;;; Generated autoloads from pdf-tools.el

(defvar pdf-tools-handle-upgrades t "\
Whether PDF Tools should handle upgrading itself.")

(custom-autoload 'pdf-tools-handle-upgrades "pdf-tools" t)

(autoload 'pdf-tools-install "pdf-tools" "\
Install PDF-Tools in all current and future PDF buffers.\n\nIf the `pdf-info-epdfinfo-program' is not running or does not\nappear to be working, attempt to rebuild it.  If this build\nsucceeded, continue with the activation of the package.\nOtherwise fail silently, i.e. no error is signaled.\n\nBuild the program (if necessary) without asking first, if\nNO-QUERY-P is non-nil.\n\nDon't attempt to install system packages, if SKIP-DEPENDENCIES-P\nis non-nil.\n\nDo not signal an error in case the build failed, if NO-ERROR-P is\nnon-nil.\n\nAttempt to install system packages (even if it is deemed\nunnecessary), if FORCE-DEPENDENCIES-P is non-nil.\n\nNote that SKIP-DEPENDENCIES-P and FORCE-DEPENDENCIES-P are\nmutually exclusive.\n\nNote further, that you can influence the installation directory\nby setting `pdf-info-epdfinfo-program' to an appropriate\nvalue (e.g. ~/bin/epdfinfo) before calling this function.\n\nSee `pdf-view-mode' and `pdf-tools-enabled-modes'.\n\n(fn &optional NO-QUERY-P SKIP-DEPENDENCIES-P NO-ERROR-P FORCE-DEPENDENCIES-P)" t nil)

(autoload 'pdf-tools-enable-minor-modes "pdf-tools" "\
Enable MODES in the current buffer.\n\nMODES defaults to `pdf-tools-enabled-modes'.\n\n(fn &optional MODES)" t nil)

(autoload 'pdf-tools-help "pdf-tools" "\
\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-tools" '("pdf-tools-")))

;;;***

;;;### (autoloads nil "pdf-util" "pdf-util.el" (0 0 0 0))
;;; Generated autoloads from pdf-util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-util" '("pdf-util-" "display-buffer-split-below-and-attach")))

;;;***

;;;### (autoloads nil "pdf-view" "pdf-view.el" (0 0 0 0))
;;; Generated autoloads from pdf-view.el

(autoload 'pdf-view-bookmark-jump-handler "pdf-view" "\
The bookmark handler-function interface for bookmark BMK.\n\nSee also `pdf-view-bookmark-make-record'.\n\n(fn BMK)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-view" '("pdf-view-")))

;;;***

;;;### (autoloads nil "pdf-virtual" "pdf-virtual.el" (0 0 0 0))
;;; Generated autoloads from pdf-virtual.el

(autoload 'pdf-virtual-edit-mode "pdf-virtual" "\
Major mode when editing a virtual PDF buffer.\n\n(fn)" t nil)

(autoload 'pdf-virtual-view-mode "pdf-virtual" "\
Major mode in virtual PDF buffers.\n\n(fn)" t nil)

(defvar pdf-virtual-global-minor-mode nil "\
Non-nil if Pdf-Virtual-Global minor mode is enabled.\nSee the `pdf-virtual-global-minor-mode' command\nfor a description of this minor mode.\nSetting this variable directly does not take effect;\neither customize it (see the info node `Easy Customization')\nor call the function `pdf-virtual-global-minor-mode'.")

(custom-autoload 'pdf-virtual-global-minor-mode "pdf-virtual" nil)

(autoload 'pdf-virtual-global-minor-mode "pdf-virtual" "\
Enable recognition and handling of VPDF files.\n\n(fn &optional ARG)" t nil)

(autoload 'pdf-virtual-buffer-create "pdf-virtual" "\
\n\n(fn &optional FILENAMES BUFFER-NAME DISPLAY-P)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pdf-virtual" '("pdf-virtual-")))

;;;***

;;;### (autoloads nil nil ("pdf-tools-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pdf-tools-autoloads.el ends here
