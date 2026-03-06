#!/bin/sh
# Tropical Twilight

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
put_template 0  "00/00/00"
put_template 1  "ff/5b/66"
put_template 2  "65/d2/4b"
put_template 3  "f3/ae/04"
put_template 4  "55/95/ff"
put_template 5  "d2/6c/e8"
put_template 6  "01/ce/d6"
put_template 7  "e0/e0/e0"
put_template 8  "33/42/65"
put_template 9  "ff/a2/a1"
put_template 10 "88/f5/6f"
put_template 11 "ff/d7/94"
put_template 12 "95/bd/fe"
put_template 13 "ed/9e/ff"
put_template 14 "05/f3/fc"
put_template 15 "ff/ff/ff"

color_foreground="e0/e0/e0"
color_background="00/0f/32"

if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg "e0e0e0"
  put_template_custom Ph "000f32"
  put_template_custom Pi "e0e0e0"
  put_template_custom Pj "264f78"
  put_template_custom Pk "000f32"
  put_template_custom Pl "e0e0e0"
  put_template_custom Pm "000f32"
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
