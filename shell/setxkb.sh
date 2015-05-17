#!/bin/bash
if [ $1 = "in" ]; then
    setxkbmap -option;
    setxkbmap -option 'ctrl:swapcaps';
    echo "only switched ctrl and capslock";
elif [ $1 = "out" ]; then
    setxkbmap -option;
    setxkbmap -option 'ctrl:swapcaps';
    setxkbmap -option 'ctrl:swap_rwin_rctl';
    echo "switched both capslock and right windows with ctrl";
fi

