;;; fzf-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "fzf" "fzf.el" (0 0 0 0))
;;; Generated autoloads from fzf.el

(autoload 'fzf "fzf" "\
Starts a fzf session in the appropriate directory.

By default this process the current working directory unless this is inside a
Projectile project in which case the root directory of the Projectile project
is used.

With optional prefix WITH-PREVIEW the currently selected file
content or attribute is shown using the preview command
identified by the `fzf/args-for-preview' user-option.  By default
that shows the file content with cat, but that can be customized
to use other mechanisms.

\(fn &optional WITH-PREVIEW)" t nil)

(autoload 'fzf-directory "fzf" "\
Starts a fzf session at the specified directory.

With optional prefix WITH-PREVIEW the currently selected file
content or attribute is shown using the preview command
identified by the `fzf/args-for-preview' user-option.  By default
that shows the file content with cat, but that can be customized
to use other mechanisms.

\(fn &optional WITH-PREVIEW)" t nil)

(autoload 'fzf-switch-buffer "fzf" "\
Switch buffer selecting them with fzf." t nil)

(autoload 'fzf-find-in-buffer "fzf" "\
Fuzzy search the current buffer visiting a file." t nil)

(autoload 'fzf-find-file "fzf" "\
Find file in projectile project (if used), current or specified DIRECTORY.

\(fn &optional DIRECTORY)" t nil)

(autoload 'fzf-find-file-in-dir "fzf" "\
Find file in specified DIRECTORY or prompt for it.

\(fn &optional DIRECTORY)" t nil)

(autoload 'fzf-recentf "fzf" "\
Start a fzf session with the list of recently opened files.

With optional prefix WITH-PREVIEW the currently selected file
content or attribute is shown using the preview command
identified by the `fzf/args-for-preview' user-option.  By default
that shows the file content with cat, but that can be customized
to use other mechanisms.

\(fn &optional WITH-PREVIEW)" t nil)

(autoload 'fzf-grep "fzf" "\
FZF search filtered on a grep search result.

- SEARCH is the end of the grep command line;  typically holding the regexp
  identifying what to search and the glob pattern to identify the file that
  must be searched.  If SEARCH is nil, read input interactively.
- Grep in `fzf--resolve-directory` using DIRECTORY if provided.
- If AS-FILTER is non-nil, use grep as the narrowing filter instead of fzf.

File name & Line extraction:

- By default this function extracts file name and line number
  using the '(fzf--file-lnum-regexp 1 2) extraction list.

  If the grep command you use requires a different extraction
  rule, then let bind a `fzf-extractor-list' variable to a list
  of the form (regexp file-group line-group) over the call
  context of `fzf-grep' (or the function that calls it).

  - IMPORTANT: the name of that let-bound variable must have only
    one dash after 'fzf'!  It's not the same as the internal
    `fzf--extractor-list' variable!

\(fn &optional SEARCH DIRECTORY AS-FILTER FILE-PATTERN)" t nil)

(autoload 'fzf-grep-in-dir "fzf" "\
Call `fzf-grep` in DIRECTORY.

If DIRECTORY is nil, read input interactively.
If AS-FILTER is non-nil, use grep as the narrowing filter instead of fzf.
If FILE-PATTERN is non-nil it is used to restrict the scope further. If nil,
it's not specified.

See note about file & line extraction in `fzf-grep'.
The same note applies here.

\(fn &optional DIRECTORY AS-FILTER FILE-PATTERN)" t nil)

(autoload 'fzf-grep-with-narrowing "fzf" "\
Call `fzf-grep` with grep as the narrowing filter.

By default the grep command searches in the files identified by
the `fzf/grep-file-pattern' user-option unless a
WITH-FILE_PATTERN prefix argument argument is used; in that case
it prompts for a file pattern to use. The prompt identifies the
tool used (grep or rg) if it recognizes the on specified in
`fzf/grep-command'.  Remember to use the file pattern appropriate
for the tool; grep and Ripgrep use different ones.

\(fn &optional WITH-FILE-PATTERN)" t nil)

(autoload 'fzf-grep-in-dir-with-narrowing "fzf" "\
Call `fzf-grep-in-dir` with grep as the narrowing filter.


By default the grep command searches in the files identified by
the `fzf/grep-file-pattern' user-option unless a
WITH-FILE_PATTERN prefix argument argument is used; in that case
it prompts for a file pattern to use. The prompt identifies the
tool used (grep or rg) if it recognizes the on specified in
`fzf/grep-command'.  Remember to use the file pattern appropriate
for the tool; grep and Ripgrep use different ones.

\(fn &optional WITH-FILE-PATTERN)" t nil)

(autoload 'fzf-grep-dwim "fzf" "\
Call `fzf-grep` on `symbol-at-point`.

If there's no symbol at point (as identified by
`thing-at-point'), prompt for one.

By default the grep command searches in the files identified by
the `fzf/grep-file-pattern' user-option unless a
WITH-FILE_PATTERN prefix argument argument is used; in that case
it prompts for a file pattern to use. The prompt identifies the
tool used (grep or rg) if it recognizes the on specified in
`fzf/grep-command'.  Remember to use the file pattern appropriate
for the tool; grep and Ripgrep use different ones.

\(fn &optional WITH-FILE-PATTERN)" t nil)

(autoload 'fzf-grep-dwim-with-narrowing "fzf" "\
Call `fzf-grep` on `symbol-at-point`, with grep as the narrowing filter.

If there's no symbol at point (as identified by
`thing-at-point'), prompt for one.

By default the grep command searches in the files identified by
the `fzf/grep-file-pattern' user-option unless WITH-FILE_PATTERN
prefix argument is used; in that case it prompts for a file
pattern to use.

See note about file & line extraction in `fzf-grep'.  The same
note applies here.

\(fn &optional WITH-FILE-PATTERN)" t nil)

(autoload 'fzf-git "fzf" "\
Starts an fzf session at the root of the current git repo.

Search *all* files in the repository directory tree." t nil)

(autoload 'fzf-git-files "fzf" "\
Starts an fzf session for tracked files in the current Git repo.

Only search files that have been committed." t nil)

(autoload 'fzf-git-grep "fzf" "\
Grep files committed in Git repo, fzf search result.

Use 'git grep' in the current Git repository to grep into the
files that have been committed into Git. Then execute fzf to
fuzzy search into the files/lines found.  Open the selected file
at the specific line.

Note that git grep *does not* grep into all past revisions of a
Git repo committed files (the way Mercurial 'hg grep' does).
This command only greps in the *current* version of the files.

- With Git, looking into the history is more involved and requires
  using several commands: 'git log -S' to identify the
  'version' (commit-sha) and then a grep on each of these.

See note about file & line extraction in `fzf-grep'.
The same note applies here." t nil)

(autoload 'fzf-hg "fzf" "\
Starts an fzf session at the root of the current hg repo.

Search *all* files in the repository directory tree." t nil)

(autoload 'fzf-hg-files "fzf" "\
Starts an fzf session for tracked files in the current Mercurial repo.

Only search files that have been committed." t nil)

(autoload 'fzf-hg-grep "fzf" "\
Grep specified versions of files committed in Mercurial repo, fzf result.

Grep files committed in Mercurial repo and perform a fzf search on the output.
By default only grep in the current revision of the files, but with C-u prefix
grep inside all revisions of the files.

Perform fzf search on the result and open selection.

File name & Line extraction:

- By default this function extracts file name and line number
  using the '(fzf--file-rnum-lnum-regexp 1 3) extraction list.

  If the grep command you use requires a different extraction
  rule, then let bind a `fzf-extractor-list' variable to a list
  of the form (regexp file-group line-group) over the call
  context of `fzf-grep' (or the function that calls it).

  - IMPORTANT: the name of that let-bound variable must have only
    one dash after 'fzf'!  It's not the same as the internal
    `fzf--extractor-list' variable!

\(fn &optional ALL-REVS)" t nil)

(autoload 'fzf-projectile "fzf" "\
Starts an fzf session at the root of the current projectile project.

\(fn &optional WITH-PREVIEW)" t nil)

(register-definition-prefixes "fzf" '("fzf"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; fzf-autoloads.el ends here
