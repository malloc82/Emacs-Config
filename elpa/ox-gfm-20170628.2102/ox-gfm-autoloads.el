;;; ox-gfm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ox-gfm" "ox-gfm.el" (0 0 0 0))
;;; Generated autoloads from ox-gfm.el

(autoload 'org-gfm-export-as-markdown "ox-gfm" "\
Export current buffer to a Github Flavored Markdown buffer.\n\nIf narrowing is active in the current buffer, only export its\nnarrowed part.\n\nIf a region is active, export that region.\n\nA non-nil optional argument ASYNC means the process should happen\nasynchronously.  The resulting buffer should be accessible\nthrough the `org-export-stack' interface.\n\nWhen optional argument SUBTREEP is non-nil, export the sub-tree\nat point, extracting information from the headline properties\nfirst.\n\nWhen optional argument VISIBLE-ONLY is non-nil, don't export\ncontents of hidden elements.\n\nExport is done in a buffer named \"*Org GFM Export*\", which will\nbe displayed when `org-export-show-temporary-export-buffer' is\nnon-nil.\n\n(fn &optional ASYNC SUBTREEP VISIBLE-ONLY)" t nil)

(autoload 'org-gfm-convert-region-to-md "ox-gfm" "\
Assume the current region has org-mode syntax, and convert it\nto Github Flavored Markdown.  This can be used in any buffer.\nFor example, you can write an itemized list in org-mode syntax in\na Markdown buffer and use this command to convert it.\n\n(fn)" t nil)

(autoload 'org-gfm-export-to-markdown "ox-gfm" "\
Export current buffer to a Github Flavored Markdown file.\n\nIf narrowing is active in the current buffer, only export its\nnarrowed part.\n\nIf a region is active, export that region.\n\nA non-nil optional argument ASYNC means the process should happen\nasynchronously.  The resulting file should be accessible through\nthe `org-export-stack' interface.\n\nWhen optional argument SUBTREEP is non-nil, export the sub-tree\nat point, extracting information from the headline properties\nfirst.\n\nWhen optional argument VISIBLE-ONLY is non-nil, don't export\ncontents of hidden elements.\n\nReturn output file's name.\n\n(fn &optional ASYNC SUBTREEP VISIBLE-ONLY)" t nil)

(autoload 'org-gfm-publish-to-gfm "ox-gfm" "\
Publish an org file to Markdown.\nFILENAME is the filename of the Org file to be published.  PLIST\nis the property list for the given project.  PUB-DIR is the\npublishing directory.\nReturn output file name.\n\n(fn PLIST FILENAME PUB-DIR)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ox-gfm" '("org-gfm-" "gfm-table-" "width-cookies")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ox-gfm-autoloads.el ends here
