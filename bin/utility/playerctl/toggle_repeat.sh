#! /bin/bash
curStat=$(playerctl loop)

if [ $curStat = None ]; then
  playerctl loop Playlist
elif [ $curStat = Playlist ]; then
  playerctl loop Track
else
  playerctl loop None
fi
