#!/usr/bin/env zsh

is_dark=~/.config/cosmic/com.system76.CosmicTheme.Mode/v1/is_dark
if ( $("cat" $is_dark) ); then
    echo false > $is_dark
else
    echo true > $is_dark
fi
