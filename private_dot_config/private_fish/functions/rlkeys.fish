function rlkeys
    set CHEATSHEET ' \
MOVEMENT           ┋  HISTORY               ┋  EDITING
  Ctrl-a    Start  ┋    Ctrl-p    Prev cmd  ┋     Ctrl-d   Delete char
  Ctrl-e      End  ┋    Ctrl-n    Next cmd  ┋    Backspc   Delete char
  Ctrl-f  Forward  ┋    Ctrl-r  Rev search  ┋     Ctrl-t     Transpose
  Ctrl-b     Back  ┋     Alt-.    Last arg  ┋      Alt-t  Transp words
   Alt-f   Word →  ┋                        ┋      Alt-u     Uppercase
   Alt-b   Word ←  ┋                        ┋      Alt-l     Lowercase
  Ctrl-l    Clear  ┋                        ┋      Alt-c    Capitalize
'

    echo -e $CHEATSHEET
end
