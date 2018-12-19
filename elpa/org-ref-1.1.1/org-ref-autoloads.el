;;; org-ref-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "doi-utils" "doi-utils.el" (0 0 0 0))
;;; Generated autoloads from doi-utils.el

(autoload 'doi-utils-get-bibtex-entry-pdf "doi-utils" "\
Download pdf for entry at point if the pdf does not already exist locally.\nThe entry must have a doi. The pdf will be saved\nto `org-ref-pdf-directory', by the name %s.pdf where %s is the\nbibtex label.  Files will not be overwritten.  The pdf will be\nchecked to make sure it is a pdf, and not some html failure\npage. You must have permission to access the pdf. We open the pdf\nat the end if `doi-utils-open-pdf-after-download' is non-nil.\n\nWith one prefix ARG, directly get the pdf from a file (through\n`read-file-name') instead of looking up a DOI. With a double\nprefix ARG, directly get the pdf from an open buffer (through\n`read-buffer-to-switch') instead. These two alternative methods\nwork even if the entry has no DOI, and the pdf file is not\nchecked.\n\n(fn &optional ARG)" t nil)

(autoload 'doi-utils-add-bibtex-entry-from-doi "doi-utils" "\
Add DOI entry to end of a file in the current directory.\nPick the file ending with .bib or in\n`org-ref-default-bibliography'.  If you have an active region that\nstarts like a DOI, that will be the initial prompt.  If no region\nis selected and the first entry of the ‘kill-ring’ starts like a\nDOI, then that is the intial prompt.  Otherwise, you have to type\nor paste in a DOI.\nArgument BIBFILE the bibliography to use.\n\n(fn DOI &optional BIBFILE)" t nil)

(autoload 'doi-utils-doi-to-org-bibtex "doi-utils" "\
Convert a DOI to an ‘org-bibtex’ form and insert it at point.\n\n(fn DOI)" t nil)

(autoload 'bibtex-set-field "doi-utils" "\
Set FIELD to VALUE in bibtex file.  create field if it does not exist.\nOptional argument NODELIM see `bibtex-make-field'.\n\n(fn FIELD VALUE &optional NODELIM)" t nil)

(autoload 'doi-utils-update-bibtex-entry-from-doi "doi-utils" "\
Update fields in a bibtex entry from the DOI.\nEvery field will be updated, so previous change will be lost.\n\n(fn DOI)" t nil)

(autoload 'doi-utils-update-field "doi-utils" "\
Update the field at point in the bibtex entry.\nData is retrieved from the doi in the entry.\n\n(fn)" t nil)

(autoload 'doi-utils-wos "doi-utils" "\
Open Web of Science entry for DOI.\n\n(fn DOI)" t nil)

(autoload 'doi-utils-wos-citing "doi-utils" "\
Open Web of Science citing articles entry for DOI.\nMay be empty if none are found.\n\n(fn DOI)" t nil)

(autoload 'doi-utils-wos-related "doi-utils" "\
Open Web of Science related articles page for DOI.\n\n(fn DOI)" t nil)

(autoload 'doi-utils-open "doi-utils" "\
Open DOI in browser.\n\n(fn DOI)" t nil)

(autoload 'doi-utils-open-bibtex "doi-utils" "\
Search through variable `reftex-default-bibliography' for DOI.\n\n(fn DOI)" t nil)

(autoload 'doi-utils-crossref "doi-utils" "\
Search DOI in CrossRef.\n\n(fn DOI)" t nil)

(autoload 'doi-utils-google-scholar "doi-utils" "\
Google scholar the DOI.\n\n(fn DOI)" t nil)

(autoload 'doi-utils-pubmed "doi-utils" "\
Search Pubmed for the DOI.\n\n(fn DOI)" t nil)

(autoload 'doi-link-menu "doi-utils" "\
Generate the link menu message, get choice and execute it.\nOptions are stored in `doi-link-menu-funcs'.\nArgument LINK-STRING Passed in on link click.\n\n(fn LINK-STRING)" t nil)

(autoload 'doi-utils-crossref-citation-query "doi-utils" "\
Query Crossref with the title of the bibtex entry at point.\nGet a list of possible matches.  This opens a helm buffer to\nselect an entry.  The default action inserts a doi and url field\nin the bibtex entry at point.  The second action opens the doi\nurl.  If there is already a doi field, the function raises an\nerror.\n\n(fn)" t nil)

(autoload 'doi-utils-debug "doi-utils" "\
Generate an org-buffer showing data about DOI.\n\n(fn DOI)" t nil)

(autoload 'doi-utils-add-entry-from-crossref-query "doi-utils" "\
Search Crossref with QUERY and use helm to select an entry to add to BIBTEX-FILE.\n\n(fn QUERY BIBTEX-FILE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doi-utils" '("crossref-add-bibtex-entry" "doi-" "pnas-pdf-url" "plist-get-keys" "aps-pdf-url" "aip-pdf-url" "asme-biomechanical-pdf-url" "osa-pdf-url" "iop-pdf-url" "ieee" "generic-full-pdf-url" "jstor-pdf-url" "jneurosci-pdf-url" "springer-" "science-" "sage-pdf-url" "linkinghub-elsevier-pdf-url" "rsc-pdf-url" "ecs" "tandfonline-pdf-url" "wiley-pdf-url" "*doi-utils-" "nature-pdf-url")))

;;;***

;;;### (autoloads nil "nist-webbook" "nist-webbook.el" (0 0 0 0))
;;; Generated autoloads from nist-webbook.el

(autoload 'nist-webbook-formula "nist-webbook" "\
Search NIST webbook for FORMULA.\n\n(fn FORMULA)" t nil)

(autoload 'nist-webbook-name "nist-webbook" "\
Search NIST webbook for NAME.\n\n(fn NAME)" t nil)

;;;***

;;;### (autoloads nil "org-ref-arxiv" "org-ref-arxiv.el" (0 0 0 0))
;;; Generated autoloads from org-ref-arxiv.el

(autoload 'arxiv-add-bibtex-entry "org-ref-arxiv" "\
Add bibtex entry for ARXIV-NUMBER to BIBFILE.\n\n(fn ARXIV-NUMBER BIBFILE)" t nil)

(autoload 'arxiv-get-pdf "org-ref-arxiv" "\
Retrieve a pdf for ARXIV-NUMBER and save it to PDF.\n\n(fn ARXIV-NUMBER PDF)" t nil)

(autoload 'arxiv-get-pdf-add-bibtex-entry "org-ref-arxiv" "\
Add bibtex entry for ARXIV-NUMBER to BIBFILE.\nRemove troublesome chars from the bibtex key, retrieve a pdf\nfor ARXIV-NUMBER and save it to PDFDIR with the same name of the\nkey.\n\n(fn ARXIV-NUMBER BIBFILE PDFDIR)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-arxiv" '("arxiv-")))

;;;***

;;;### (autoloads nil "org-ref-bibtex" "org-ref-bibtex.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from org-ref-bibtex.el

(autoload 'org-ref-bibtex-generate-longtitles "org-ref-bibtex" "\
Generate longtitles.bib which are @string definitions.\nThe full journal names are in `org-ref-bibtex-journal-abbreviations'.\n\n(fn)" t nil)

(autoload 'org-ref-bibtex-generate-shorttitles "org-ref-bibtex" "\
Generate shorttitles.bib which are @string definitions.\nThe abbreviated journal names in `org-ref-bibtex-journal-abbreviations'.\n\n(fn)" t nil)

(autoload 'org-ref-stringify-journal-name "org-ref-bibtex" "\
Replace journal name in a bibtex entry with a string.\nThe strings are defined in\n`org-ref-bibtex-journal-abbreviations'.  The optional arguments KEY,\nSTART and END allow you to use this with `bibtex-map-entries'\n\n(fn &optional KEY START END)" t nil)

(autoload 'org-ref-helm-set-journal-string "org-ref-bibtex" "\
Helm interface to set a journal string in a bibtex entry.\nEntries come from `org-ref-bibtex-journal-abbreviations'.\n\n(fn)" t nil)

(autoload 'org-ref-set-journal-string "org-ref-bibtex" "\
Set a bibtex journal name to the string that represents FULL-JOURNAL-NAME.\nThis is defined in `org-ref-bibtex-journal-abbreviations'.\n\n(fn FULL-JOURNAL-NAME)" t nil)

(autoload 'org-ref-replace-nonascii "org-ref-bibtex" "\
Hook function to replace non-ascii characters in a bibtex entry.\n\n(fn)" t nil)

(autoload 'org-ref-title-case-article "org-ref-bibtex" "\
Convert a bibtex entry article title to title-case.\nThe arguments KEY, START and END are optional, and are only there\nso you can use this function with `bibtex-map-entries' to change\nall the title entries in articles.\n\n(fn &optional KEY START END)" t nil)

(autoload 'org-ref-sentence-case-article "org-ref-bibtex" "\
Convert a bibtex entry article title to sentence-case.\nThe arguments KEY, START and END are optional, and are only there\nso you can use this function with `bibtex-map-entries' to change\nall the title entries in articles.\n\n(fn &optional KEY START END)" t nil)

(autoload 'org-ref-bibtex-next-entry "org-ref-bibtex" "\
Jump to the beginning of the next bibtex entry.\nN is a prefix argument.  If it is numeric, jump that many entries\nforward.  Negative numbers do nothing.\n\n(fn &optional N)" t nil)

(autoload 'org-ref-bibtex-previous-entry "org-ref-bibtex" "\
Jump to beginning of the previous bibtex entry.\nN is a prefix argument.  If it is numeric, jump that many entries back.\n\n(fn &optional N)" t nil)

(autoload 'org-ref-bibtex-entry-doi "org-ref-bibtex" "\
Get doi from entry at point.\n\n(fn)" t nil)

(autoload 'org-ref-bibtex-format-url-if-doi "org-ref-bibtex" "\
Hook function to format url to follow the current DOI conventions.\n\n(fn)" t nil)

(autoload 'org-ref-bibtex-wos "org-ref-bibtex" "\
Open bibtex entry in Web Of Science if there is a DOI.\n\n(fn)" t nil)

(autoload 'org-ref-bibtex-wos-citing "org-ref-bibtex" "\
Open citing articles for bibtex entry in Web Of Science if\nthere is a DOI.\n\n(fn)" t nil)

(autoload 'org-ref-bibtex-wos-related "org-ref-bibtex" "\
Open related articles for bibtex entry in Web Of Science if\nthere is a DOI.\n\n(fn)" t nil)

(autoload 'org-ref-bibtex-crossref "org-ref-bibtex" "\
Open the bibtex entry in Crossref by its doi.\n\n(fn)" t nil)

(autoload 'org-ref-bibtex-google-scholar "org-ref-bibtex" "\
Open the bibtex entry at point in google-scholar by its doi.\n\n(fn)" t nil)

(autoload 'org-ref-bibtex-pubmed "org-ref-bibtex" "\
Open the bibtex entry at point in Pubmed by its doi.\n\n(fn)" t nil)

(autoload 'org-ref-bibtex-pdf "org-ref-bibtex" "\
Open the pdf for the bibtex entry at point.\nThin wrapper to get `org-ref-bibtex' to open pdf, because it\ncalls functions with a DOI argument.\n\n(fn DOI)" t nil)

(autoload 'org-ref-bibtex-assoc-pdf-with-entry "org-ref-bibtex" "\
Prompt for pdf associated with entry at point and rename it.\nCheck whether a pdf already exists in `org-ref-pdf-directory' with the\nname '[bibtexkey].pdf'. If the file does not exist, rename it to\n'[bibtexkey].pdf' using\n`org-ref-bibtex-assoc-pdf-with-entry-move-function' and place it in\n`org-ref-pdf-directory'. Optional PREFIX argument toggles between\n`rename-file' and `copy-file'.\n\n(fn &optional PREFIX)" t nil)

(autoload 'org-ref-bibtex "org-ref-bibtex" "\
Menu command to run in a bibtex entry.\nFunctions from `org-ref-bibtex-menu-funcs'.  They all rely on the\nentry having a doi.\n\n(fn)" t nil)

(autoload 'org-ref-email-bibtex-entry "org-ref-bibtex" "\
Email current bibtex entry at point and pdf if it exists.\n\n(fn)" t nil)

(autoload 'org-ref-set-bibtex-keywords "org-ref-bibtex" "\
Add KEYWORDS to a bibtex entry.\nIf KEYWORDS is a list, it is converted to a comma-separated\nstring.  The KEYWORDS are added to the beginning of the\nfield.  Otherwise KEYWORDS should be a string of comma-separate\nkeywords.  Optional argument ARG prefix arg to replace keywords.\n\n(fn KEYWORDS &optional ARG)" t nil)

(autoload 'org-ref-extract-bibtex-blocks "org-ref-bibtex" "\
Extract all bibtex blocks in buffer to BIBFILE.\nIf BIBFILE exists, append, unless you use a prefix arg (C-u), which\nwill clobber the file.\n\n(fn BIBFILE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-bibtex" '("org-ref-" "orhc-")))

;;;***

;;;### (autoloads nil "org-ref-citeproc" "org-ref-citeproc.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from org-ref-citeproc.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-citeproc" '("orcp-" "superscript" "sentence-beginning-p" "lastname" "firstname" "bibliography-style" "baseline" "bold" "italics" "citation-style" "*orcp-")))

;;;***

;;;### (autoloads nil "org-ref-core" "org-ref-core.el" (0 0 0 0))
;;; Generated autoloads from org-ref-core.el

(autoload 'org-ref-show-link-messages "org-ref-core" "\
Turn on link messages.\nYou will see a message in the minibuffer when on a cite, ref or\nlabel link.\n\n(fn)" t nil)

(autoload 'org-ref-cancel-link-messages "org-ref-core" "\
Stop showing messages in minibuffer when on a link.\n\n(fn)" t nil)

(autoload 'org-ref-change-completion "org-ref-core" "\
Change the completion backend.\nOptions are \"org-ref-helm-bibtex\", \"org-ref-helm-cite\",\n\"org-ref-ivy-cite\" and \"org-ref-reftex\".\n\n(fn)" t nil)

(autoload 'org-ref-mouse-message "org-ref-core" "\
Display message for link under mouse cursor.\n\n(fn)" t nil)

(autoload 'org-ref-mouse-messages-on "org-ref-core" "\
Turn on mouse messages.\n\n(fn)" t nil)

(autoload 'org-ref-mouse-messages-off "org-ref-core" "\
Turn off mouse messages.\n\n(fn)" t nil)

(autoload 'org-ref-insert-bibliography-link "org-ref-core" "\
Insert a bibliography with completion.\n\n(fn)" t nil)

(autoload 'org-ref-list-of-figures "org-ref-core" "\
Generate buffer with list of figures in them.\nARG does nothing.\nIgnore figures in COMMENTED sections.\n\n(fn &optional ARG)" t nil)

(autoload 'org-ref-list-of-tables "org-ref-core" "\
Generate a buffer with a list of tables.\nARG does nothing.\n\n(fn &optional ARG)" t nil)

(autoload 'org-ref-insert-ref-link "org-ref-core" "\
Completion function for a ref link.\n\n(fn)" t nil)

(autoload 'org-pageref-insert-ref-link "org-ref-core" "\
Insert a pageref link with completion.\n\n(fn)" t nil)

(autoload 'org-ref-define-citation-link "org-ref-core" "\
Add a citation link of TYPE for `org-ref'.\nWith optional KEY, set the reftex binding.  For example:\n(org-ref-define-citation-link \"citez\" ?z) will create a new\ncitez link, with reftex key of z, and the completion function.\n\n(fn TYPE &optional KEY)" t nil)

(autoload 'org-ref-insert-cite-with-completion "org-ref-core" "\
Insert a cite link of TYPE with completion.\n\n(fn TYPE)" t nil)

(autoload 'org-ref-store-bibtex-entry-link "org-ref-core" "\
Save a citation link to the current bibtex entry.\nSave in the default link type.\n\n(fn)" t nil)

(autoload 'org-ref-index "org-ref-core" "\
Open an *index* buffer with links to index entries.\nPATH is required for the org-link, but it does nothing here.\n\n(fn &optional PATH)" t nil)

(autoload 'org-ref-open-bibtex-pdf "org-ref-core" "\
Open pdf for a bibtex entry, if it exists.\nassumes point is in\nthe entry of interest in the bibfile.  but does not check that.\n\n(fn)" t nil)

(autoload 'org-ref-open-bibtex-notes "org-ref-core" "\
From a bibtex entry, open the notes if they exist.\nIf the notes do not exist, then create a heading.\n\nI never did figure out how to use reftex to make this happen\nnon-interactively.  the `reftex-format-citation' function did not\nwork perfectly; there were carriage returns in the strings, and\nit did not put the key where it needed to be.  so, below I replace\nthe carriage returns and extra spaces with a single space and\nconstruct the heading by hand.\n\n(fn)" t nil)

(autoload 'org-ref-open-in-browser "org-ref-core" "\
Open the bibtex entry at point in a browser using the url field or doi field.\n\n(fn)" t nil)

(autoload 'org-ref-build-full-bibliography "org-ref-core" "\
Build pdf of all bibtex entries, and open it.\n\n(fn)" t nil)

(autoload 'org-ref-extract-bibtex-entries "org-ref-core" "\
Extract the bibtex entries in the current buffer into a src block.\n\n(fn)" t nil)

(autoload 'org-ref-find-bad-citations "org-ref-core" "\
Create a list of citation keys that do not have a matching bibtex entry.\nList is displayed in an `org-mode' buffer using the known bibtex\nfile.  Makes a new buffer with clickable links.\n\n(fn)" t nil)

(autoload 'org-ref-find-non-ascii-characters "org-ref-core" "\
Find non-ascii characters in the buffer.  Useful for cleaning up bibtex files.\n\n(fn)" t nil)

(autoload 'org-ref-sort-bibtex-entry "org-ref-core" "\
Sort fields of entry in standard order.\n\n(fn)" t nil)

(autoload 'org-ref-downcase-bibtex-entry "org-ref-core" "\
Downcase the entry type and fields.\n\n(fn)" t nil)

(autoload 'org-ref-clean-bibtex-entry "org-ref-core" "\
Clean and replace the key in a bibtex entry.\nSee functions in `org-ref-clean-bibtex-entry-hook'.\n\n(fn)" t nil)

(autoload 'org-ref-sort-citation-link "org-ref-core" "\
Replace link at point with sorted link by year.\n\n(fn)" t nil)

(autoload 'org-ref-swap-citation-link "org-ref-core" "\
Move citation at point in DIRECTION +1 is to the right, -1 to the left.\n\n(fn DIRECTION)" t nil)

(autoload 'org-ref-next-key "org-ref-core" "\
Move cursor to the next cite key when on a cite link.\nOtherwise run `right-word'. If the cursor moves off the link,\nmove to the beginning of the next cite link after this one.\n\n(fn)" t nil)

(autoload 'org-ref-previous-key "org-ref-core" "\
Move cursor to the previous cite key when on a cite link.\nOtherwise run `left-word'. If the cursor moves off the link,\nmove to the beginning of the previous cite link after this one.\n\n(fn)" t nil)

(autoload 'org-ref-link-message "org-ref-core" "\
Print a minibuffer message about the link that point is on.\n\n(fn)" t nil)

(autoload 'org-ref-help "org-ref-core" "\
Open the `org-ref' manual.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-core" '("oro" "orp" "oru" "orn" "ori" "orsl" "orc" "org-")))

;;;***

;;;### (autoloads nil "org-ref-glossary" "org-ref-glossary.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from org-ref-glossary.el

(autoload 'org-ref-add-glossary-entry "org-ref-glossary" "\
Insert a new glossary entry.\nLABEL is how you refer to it with links.\nNAME is the name of the entry to be defined.\nDESCRIPTION is the definition of the entry.\nEntry gets added after the last #+latex_header line.\n\n(fn LABEL NAME DESCRIPTION)" t nil)

(autoload 'org-ref-add-acronym-entry "org-ref-glossary" "\
Add an acronym entry with LABEL.\nABBRV is the abbreviated form.\nFULL is the expanded acronym.\n\n(fn LABEL ABBRV FULL)" t nil)

(autoload 'org-ref-insert-glossary-link "org-ref-glossary" "\
Helm command to insert glossary and acronym entries as links.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-glossary" '("org-ref-" "or-")))

;;;***

;;;### (autoloads nil "org-ref-helm" "org-ref-helm.el" (0 0 0 0))
;;; Generated autoloads from org-ref-helm.el

(autoload 'org-ref-helm-insert-label-link "org-ref-helm" "\
Insert label link at point.\nHelm will display existing labels in the current buffer to avoid\nduplication. If you use a prefix arg insert a radio target\ninstead of a label.\n\n(fn)" t nil)

(autoload 'org-ref-helm-insert-ref-link "org-ref-helm" "\
Helm menu to insert ref links to labels in the document.\nIf you are on link, replace with newly selected label.  Use\n\\[universal-argument] to insert a different kind of ref link.\nUse a double \\[universal-argument] \\[universal-argument] to insert a\n[[#custom-id]] link\n\n(fn)" t nil)

(autoload 'org-ref "org-ref-helm" "\
Opens a helm interface to actions for `org-ref'.\nShows bad citations, ref links and labels.\nThis widens the file so that all links go to the right place.\n\n(fn)" t nil)

(autoload 'helm-tag-bibtex-entry "org-ref-helm" "\
Helm interface to add keywords to a bibtex entry.\nRun this with the point in a bibtex entry.\n\n(fn)" t nil)

;;;***

;;;### (autoloads nil "org-ref-helm-bibtex" "org-ref-helm-bibtex.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-ref-helm-bibtex.el

(autoload 'org-ref-bibtex-completion-completion "org-ref-helm-bibtex" "\
Use helm and ‘helm-bibtex’ for completion.\n\n(fn)" t nil)

(autoload 'org-ref-helm-load-completions-async "org-ref-helm-bibtex" "\
Load the bibtex files into helm sources asynchronously.\nFor large bibtext files, the intial call to ‘org-ref-helm-insert-cite-link’\ncan take a long time to load the completion sources.  This function loads\nthe completion sources in the background so the initial call to ‘org-ref-helm-insert-cite-link’ is much faster.\n\n(fn)" t nil)

(autoload 'org-ref-helm-insert-cite-link "org-ref-helm-bibtex" "\
Insert a citation link with `helm-bibtex'.\nWith one prefix ARG, insert a ref link.\nWith two prefix ARGs, insert a label link.\n\n(fn &optional ARG)" t nil)

(autoload 'org-ref-cite-click-helm "org-ref-helm-bibtex" "\
Open helm for actions on a cite link.\nsubtle points.\n\n1. get name and candidates before entering helm because we need\nthe org-buffer.\n\n2. switch back to the org buffer before evaluating the\naction.  most of them need the point and buffer.\n\nKEY is returned for the selected item(s) in helm.\n\n(fn KEY)" t nil)

(autoload 'org-ref-browser "org-ref-helm-bibtex" "\
Quickly browse label links in helm.\nWith a prefix ARG, browse citation links.\n\n(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-helm-bibtex" '("org-ref-" "bibtex-completion-copy-candidate")))

;;;***

;;;### (autoloads nil "org-ref-helm-cite" "org-ref-helm-cite.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-ref-helm-cite.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-helm-cite" '("org-ref-helm-" "orhc")))

;;;***

;;;### (autoloads nil "org-ref-isbn" "org-ref-isbn.el" (0 0 0 0))
;;; Generated autoloads from org-ref-isbn.el

(autoload 'org-ref-isbn-clean-bibtex-entry "org-ref-isbn" "\
Clean a bibtex entry inserted via `isbn-to-bibtex'.\nSee functions in `org-ref-isbn-clean-bibtex-entry-hook'.\n\n(fn)" t nil)

(autoload 'isbn-to-bibtex-lead "org-ref-isbn" "\
Search lead.to for ISBN bibtex entry.\nYou have to copy the entry if it is on the page to your bibtex\nfile.\n\n(fn ISBN)" t nil)

(autoload 'isbn-to-bibtex "org-ref-isbn" "\
Get bibtex entry for ISBN and insert it into BIBFILE.\nNothing happens if an entry with the generated key already exists\nin the file. Data comes from worldcat.\n\n(fn ISBN BIBFILE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-isbn" '("org-ref-isbn-" "oricb-")))

;;;***

;;;### (autoloads nil "org-ref-ivy-cite" "org-ref-ivy-cite.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from org-ref-ivy-cite.el

(autoload 'org-ref-ivy-cite-completion "org-ref-ivy-cite" "\
Use ivy for completion.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-ivy-cite" '("or-" "org-ref-")))

;;;***

;;;### (autoloads nil "org-ref-latex" "org-ref-latex.el" (0 0 0 0))
;;; Generated autoloads from org-ref-latex.el

(autoload 'org-ref-latex-debug "org-ref-latex" "\
\n\n(fn)" t nil)

(autoload 'org-ref-latex-click "org-ref-latex" "\
Jump to entry clicked on.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-latex" '("org-ref-")))

;;;***

;;;### (autoloads nil "org-ref-pdf" "org-ref-pdf.el" (0 0 0 0))
;;; Generated autoloads from org-ref-pdf.el

(autoload 'org-ref-pdf-dnd-protocol "org-ref-pdf" "\
Drag-n-drop protocol.\nPDF will be a string like file:path.\nACTION is what to do. It is required for `dnd-protocol-alist'.\nThis function should only apply when in a bibtex file.\n\n(fn URI ACTION)" nil nil)

(autoload 'org-ref-pdf-dir-to-bibtex "org-ref-pdf" "\
Create BIBFILE from pdf files in DIRECTORY.\n\n(fn BIBFILE DIRECTORY)" t nil)

(autoload 'org-ref-pdf-debug-pdf "org-ref-pdf" "\
Try to debug getting a doi from a pdf.\nOpens a buffer with the pdf converted to text, and `occur' on the\nvariable `org-ref-pdf-doi-regex'.\n\n(fn PDF-FILE)" t nil)

(autoload 'org-ref-pdf-crossref-lookup "org-ref-pdf" "\
Lookup highlighted text in PDFView in CrossRef.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-pdf" '("org-ref-" "pdftotext-executable")))

;;;***

;;;### (autoloads nil "org-ref-pubmed" "org-ref-pubmed.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from org-ref-pubmed.el

(autoload 'pubmed-insert-bibtex-from-pmid "org-ref-pubmed" "\
Insert a bibtex entry at point derived from PMID.\nYou must clean the entry after insertion.\n\n(fn PMID)" t nil)

(autoload 'pubmed-get-medline-xml "org-ref-pubmed" "\
Get MEDLINE xml for PMID as a string.\n\n(fn PMID)" t nil)

(autoload 'pubmed "org-ref-pubmed" "\
Open http://www.ncbi.nlm.nih.gov/pubmed in a browser.\n\n(fn)" t nil)

(autoload 'pubmed-advanced "org-ref-pubmed" "\
Open http://www.ncbi.nlm.nih.gov/pubmed/advanced in a browser.\n\n(fn)" t nil)

(autoload 'pubmed-simple-search "org-ref-pubmed" "\
Open QUERY in Pubmed in a browser.\n\n(fn QUERY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-pubmed" '("pubmed-")))

;;;***

;;;### (autoloads nil "org-ref-reftex" "org-ref-reftex.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from org-ref-reftex.el

(autoload 'org-ref-reftex-completion "org-ref-reftex" "\
Use reftex and org-mode for completion.\n\n(fn)" t nil)

(autoload 'org-ref-open-notes-from-reftex "org-ref-reftex" "\
Call reftex, and open notes for selected entry.\n\n(fn)" t nil)

(autoload 'org-ref-cite-onclick-minibuffer-menu "org-ref-reftex" "\
Action when a cite link is clicked on.\nProvides a menu of context sensitive actions.  If the bibtex entry\nhas a pdf, you get an option to open it.  If there is a doi, you\nget a lot of options.  LINK-STRING is used by the link function.\n\n(fn &optional LINK-STRING)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-reftex" '("org-" "ornr")))

;;;***

;;;### (autoloads nil "org-ref-scifinder" "org-ref-scifinder.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-ref-scifinder.el

(autoload 'scifinder "org-ref-scifinder" "\
Open https://scifinder.cas.org/scifinder/view/scifinder/scifinderExplore.jsf in a browser.\n\n(fn)" t nil)

;;;***

;;;### (autoloads nil "org-ref-scopus" "org-ref-scopus.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from org-ref-scopus.el

(autoload 'scopus-related-by-keyword-url "org-ref-scopus" "\
Return a Scopus url to articles related by keyword for DOI.\n\n(fn DOI)" t nil)

(autoload 'scopus-related-by-author-url "org-ref-scopus" "\
Return a Scopus url to articles related by author for DOI.\n\n(fn DOI)" t nil)

(autoload 'scopus-related-by-references-url "org-ref-scopus" "\
Return a Scopus url to articles related by references for DOI.\n\n(fn DOI)" t nil)

(autoload 'scopus-open-eid "org-ref-scopus" "\
Open article with EID in browser.\n\n(fn EID)" t nil)

(autoload 'scopus-basic-search "org-ref-scopus" "\
Open QUERY as a basic title-abstract-keyword search at scopus.com.\n\n(fn QUERY)" t nil)

(autoload 'scopus-advanced-search "org-ref-scopus" "\
Open QUERY as an advanced search at scopus.com.\n\n(fn QUERY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-scopus" '("scopus" "*scopus-api-key*" "*hydra-eid*")))

;;;***

;;;### (autoloads nil "org-ref-url-utils" "org-ref-url-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-ref-url-utils.el

(autoload 'org-ref-url-debug-url "org-ref-url-utils" "\
Open a buffer to URL with all doi patterns highlighted.\n\n(fn URL)" t nil)

(autoload 'org-ref-url-dnd-debug "org-ref-url-utils" "\
Drag-n-drop function to debug a url.\n\n(fn EVENT)" t nil)

(autoload 'org-ref-url-dnd-all "org-ref-url-utils" "\
Drag-n-drop function to get all DOI bibtex entries for a url.\nYou probably do not want to do this since the DOI patterns are\nnot perfect, and some hits are not actually DOIs.\n\n(fn EVENT)" t nil)

(autoload 'org-ref-url-dnd-first "org-ref-url-utils" "\
Drag-n-drop function to download the first DOI in a url.\n\n(fn EVENT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-url-utils" '("org-ref-")))

;;;***

;;;### (autoloads nil "org-ref-utils" "org-ref-utils.el" (0 0 0 0))
;;; Generated autoloads from org-ref-utils.el

(autoload 'org-ref-version "org-ref-utils" "\
Provide a version string for org-ref.\nCopies the string to the clipboard.\n\n(fn)" t nil)

(autoload 'org-ref-debug "org-ref-utils" "\
Print some debug information to a buffer.\n\n(fn)" t nil)

(autoload 'org-ref-open-pdf-at-point "org-ref-utils" "\
Open the pdf for bibtex key under point if it exists.\n\n(fn)" t nil)

(autoload 'org-ref-open-url-at-point "org-ref-utils" "\
Open the url for bibtex key under point.\n\n(fn)" t nil)

(autoload 'org-ref-open-notes-at-point "org-ref-utils" "\
Open the notes for bibtex key under point in a cite link in a buffer.\nCan also be called with THEKEY in a program.\n\n(fn &optional THEKEY)" t nil)

(autoload 'org-ref-citation-at-point "org-ref-utils" "\
Give message of current citation at point.\n\n(fn)" t nil)

(autoload 'org-ref-open-citation-at-point "org-ref-utils" "\
Open bibtex file to key at point.\n\n(fn)" t nil)

(autoload 'org-ref-copy-entry-as-summary "org-ref-utils" "\
Copy the bibtex entry for the citation at point as a summary.\n\n(fn)" t nil)

(autoload 'org-ref-copy-entry-at-point-to-file "org-ref-utils" "\
Copy the bibtex entry for the citation at point to NEW-FILE.\nPrompt for NEW-FILE includes bib files in\n`org-ref-default-bibliography', and bib files in current working\ndirectory.  You can also specify a new file.\n\n(fn)" t nil)

(autoload 'org-ref-wos-at-point "org-ref-utils" "\
Open the doi in wos for bibtex key under point.\n\n(fn)" t nil)

(autoload 'org-ref-wos-citing-at-point "org-ref-utils" "\
Open the doi in wos citing articles for bibtex key under point.\n\n(fn)" t nil)

(autoload 'org-ref-wos-related-at-point "org-ref-utils" "\
Open the doi in wos related articles for bibtex key under point.\n\n(fn)" t nil)

(autoload 'org-ref-google-scholar-at-point "org-ref-utils" "\
Search google scholar for bibtex key under point using the title.\n\n(fn)" t nil)

(autoload 'org-ref-pubmed-at-point "org-ref-utils" "\
Open the doi in pubmed for bibtex key under point.\n\n(fn)" t nil)

(autoload 'org-ref-crossref-at-point "org-ref-utils" "\
Open the doi in crossref for bibtex key under point.\n\n(fn)" t nil)

(autoload 'org-ref-bibliography "org-ref-utils" "\
Create a new buffer with a bibliography.\nIf SORT is non-nil it is alphabetically sorted by key\nThis is mostly for convenience to see what has been cited.\nEntries are formatted according to the bibtex entry type in\n`org-ref-bibliography-entry-format', and the actual entries are\ngenerated by `org-ref-reftex-format-citation'.\n\n(fn &optional SORT)" t nil)

(autoload 'org-ref-link-set-parameters "org-ref-utils" "\
Set link TYPE properties to PARAMETERS.\n\n(fn TYPE &rest PARAMETERS)" nil t)

(function-put 'org-ref-link-set-parameters 'lisp-indent-function '1)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-utils" '("ords" "org-ref-")))

;;;***

;;;### (autoloads nil "org-ref-worldcat" "org-ref-worldcat.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from org-ref-worldcat.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-worldcat" '("worldcat-query-all")))

;;;***

;;;### (autoloads nil "org-ref-wos" "org-ref-wos.el" (0 0 0 0))
;;; Generated autoloads from org-ref-wos.el

(autoload 'wos-search "org-ref-wos" "\
Open the word at point or selection in Web of Science as a topic query.\n\n(fn)" t nil)

(autoload 'wos "org-ref-wos" "\
Open Web of Science search page in a browser.\n\n(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-ref-wos" '("wos-" "*wos-")))

;;;***

;;;### (autoloads nil "x2bib" "x2bib.el" (0 0 0 0))
;;; Generated autoloads from x2bib.el

(autoload 'ris2bib "x2bib" "\
Convert RISFILE to bibtex and insert at point.\nWithout a prefix arg, stderr is diverted.\nIf VERBOSE is non-nil show command output.\n\n(fn RISFILE &optional VERBOSE)" t nil)

(autoload 'medxml2bib "x2bib" "\
Convert MEDFILE (in Pubmed xml) to bibtex and insert at point.\nWithout a prefix arg, stderr is diverted.\nDisplay output if VERBOSE is non-nil.\n\n(fn MEDFILE &optional VERBOSE)" t nil)

(autoload 'clean-entries "x2bib" "\
Map over bibtex entries and clean them.\n\n(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("org-ref-ivy.el" "org-ref-pkg.el" "org-ref-sci-id.el"
;;;;;;  "org-ref.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-ref-autoloads.el ends here
