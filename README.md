# hun-stclaus
Parts for hungarian children songs for St Claus celebration.

The parts are also simple, written for kids playing the instruments.

## Pre-requisites
Install [lilypond 2.8.12](http://lilypond.org/download.html).
Make sure you can invoke lilypond on the command line, e.g.
when you issue the command, you get something like this
```
$ lilypond --version
GNU LilyPond 2.18.2

Copyright (c) 1996--2012 by
  Han-Wen Nienhuys <hanwen@xs4all.nl>
  Jan Nieuwenhuizen <janneke@gnu.org>
  and others.

This program is free software.  It is covered by the GNU General Public
License and you are welcome to change it and/or distribute copies of it
under certain conditions.  Invoke as `lilypond --warranty' for more
information.
```


## Build .pdf / .midi
To compile all lilypond (`.ly`) files, simply issue
```
$ make all
```

Build a single `.pdf` by issuing `make some-score.pdf` where `some-score.ly`
is a lilypond score notation file.

Clean the folder of all `.pdf` and `.midi` files by issuing `make clean`.
