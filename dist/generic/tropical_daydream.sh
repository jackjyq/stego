#!/bin/sh
# tropical_daydream

# source for these helper functions:
# https://github.com/chriskempson/base16-shell/blob/master/templates/default.mustache
if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' $@; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' $@; }
  put_template_custom() { printf '\033]%s%s\033\\' $@; }
fi

# 16 color space
put_template 0  "21/21/21"
put_template 1  "c3/1c/0e"
put_template 2  "02/76/35"
put_template 3  "7e/63/01"
put_template 4  "41/59/db"
put_template 5  "a8/30/a2"
put_template 6  "06/71/7f"
put_template 7  "ba/ba/ba"
put_template 8  "21/21/21"
put_template 9  "c3/1c/0e"
put_template 10 "02/76/35"
put_template 11 "7e/63/01"
put_template 12 "41/59/db"
put_template 13 "a8/30/a2"
put_template 14 "06/71/7f"
put_template 15 "fa/fa/fa"

color_foreground="21/21/21"
color_background="fa/fa/fa"

if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg "212121"
  put_template_custom Ph "fafafa"
  put_template_custom Pi "212121"
  put_template_custom Pj "add6ff"
  put_template_custom Pk "949494"
  put_template_custom Pl "000000"
  put_template_custom Pm "fafafa"
else
  put_template_var 10 $color_foreground
  put_template_var 11 $color_background
  if [ "${TERM%%-*}" = "rxvt" ]; then
    put_template_var 708 $color_background # internal border (rxvt)
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom

unset color_foreground
unset color_background
