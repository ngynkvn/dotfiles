#!/usr/bin/env fish
# shellcheck disable=2002,1087
# Index : Role               | Value   | Notes
# $C[1] : foreground         | #fffcf2 | Lightest – for text (high contrast on dark bg)
# $C[2] : border color       | #ccc5b9 | Soft accent border (can be used elsewhere)
# $C[3] : content background | #403d39 | Panel background (rich midtone)
# $C[4] : page background    | #252422 | Base background (darkest)
# $C[5] : highlight/accent   | #eb5e28 | 🔥 Hot border or title pop
#
set C ["#fffcf2" "#ccc5b9" "#403d39" "#252422" "#eb5e28"]
cat readline-keys.txt |
  gum style \
    --border="rounded" \
    --border-foreground="$C[5]" \
    --foreground="$C[1]" \
    --background="$C[3]" \
    --align="left" \
    --height=0 \
    --width=0 \
    --margin="0 0" \
    --padding="0 0" |
  tee readline-keys.pretty
