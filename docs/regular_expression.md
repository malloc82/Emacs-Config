# Emacs Regular Expression

References:
- [emacswiki](https://www.emacswiki.org/emacs/RegularExpression)
- [gnu.org](https://www.gnu.org/software/emacs/manual/html_node/emacs/Regexps.html)

### Regular Expression Syntax

Here is the syntax used by Emacs for regular expressions. Any character matches itself, except for the list below.

The following characters are special: ```. * + ? ^ $ \ [```

Between brackets ```[]```, the following are special: ```] - ^```

Many characters are special when they follow a backslash – see below.

```
  .        any character (but newline)
  *        previous character or group, repeated 0 or more time
  +        previous character or group, repeated 1 or more time
  ?        previous character or group, repeated 0 or 1 time
  ^        start of line
  $        end of line
  [...]    any character between brackets
  [^..]    any character not in the brackets
  [a-z]    any character between a and z
  \        prevents interpretation of following special char
  \|       or
  \w       word constituent
  \b       word boundary
  \sc      character with c syntax (e.g. \s- for whitespace char)
  \( \)    start/end of group
  \&lt; \&gt;    start/end of word (faulty rendering: backslash + less-than and backslash + greater-than)
  \_< \_>  start/end of symbol
  \` \'    start/end of buffer/string
  \1       string matched by the first group
  \n       string matched by the nth group
  \{3\}    previous character or group, repeated 3 times
  \{3,\}   previous character or group, repeated 3 or more times
  \{3,6\}  previous character or group, repeated 3 to 6 times
  \=       match succeeds if it is located at point
```


```+?```, and ```??``` are non-greedy versions of ```*```, ```+```, and ```?``` – see [NonGreedyRegexp](https://www.emacswiki.org/emacs/NonGreedyRegexp). Also, ```\W```, ```\B```, and ```\Sc``` match any character that does not match ```\w```, ```\b```, and ```\sc```.

Characters are organized by category. Use ```C-u C-x =``` to display the category of the character under the cursor.

```
  \ca      ascii character
  \Ca      non-ascii character (newline included)
  \cl      latin character
  \cg      greek character
```

Here are some [syntax classes](https://www.gnu.org/software/emacs/manual/html_node/elisp/Syntax-Descriptors.html#Syntax-Descriptors), also known as character classes, that can be used between brackets, e.g. ```[[:upper:]\|[:digit:]\.]```.

```
  [:digit:]  a digit, same as [0-9]
  [:alpha:]  a letter (an alphabetic character)
  [:alnum:]  a letter or a digit (an alphanumeric character)
  [:upper:]  a letter in uppercase
  [:lower:]  a letter in lowercase
  [:graph:]  a visible character
  [:print:]  a visible character plus the space character
  [:space:]  a whitespace character, as defined by the syntax table, but typically [ \t\r\n\v\f], which includes the newline character
  [:blank:]  a space or tab character
  [:xdigit:] an hexadecimal digit
  [:cntrl:]  a control character
  [:ascii:]  an ascii character
```

Syntax classes:

```
  \s-   whitespace character        \s/   character quote character
  \sw   word constituent            \s$   paired delimiter
  \s_   symbol constituent          \s'   expression prefix
  \s.   punctuation character       \s<   comment starter
  \s(   open delimiter character    \s>   comment ender
  \s)   close delimiter character   \s!   generic comment delimiter
  \s"   string quote character      \s|   generic string delimiter
  \s\   escape character
```

You can see the current syntax table by typing ```C-h s```. The syntax table depends on the current mode. As expected, letters a..z are listed as word constituents in text-mode. Other word constituents in this mode include A..Z, 0..9, $, %, currency units, accented letters, kanjis. See [EmacsSyntaxTable](https://www.emacswiki.org/emacs/EmacsSyntaxTable) for details.


